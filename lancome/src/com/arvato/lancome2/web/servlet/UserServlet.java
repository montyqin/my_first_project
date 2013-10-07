package com.arvato.lancome2.web.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(UserServlet.class);
	private static final String fileName = "subscribe.txt";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if(pathInfo!=null){
			String[] pathParts = pathInfo.split("/");
			if(pathParts.length>1){ // 不计算第一个空字符串
				if(pathParts.length==2){
					// 一级目录
					if(log.isDebugEnabled()){
						log.debug(pathParts[1]);
					}
					
					if ("regist".equalsIgnoreCase(pathParts[1])) {
						
					}
					else if ("login".equalsIgnoreCase(pathParts[1])) {
						
					}
					else if ("subscribe".equalsIgnoreCase(pathParts[1]))
					{
						boolean result = false;
						String message = "";
						String email = request.getParameter("email");
						if (!StringUtils.isEmpty(email))
						{
							String filePath = request.getSession().getServletContext().getRealPath("/data");
							File dir = new File(filePath);
							
							if (!dir.exists())
							{
								if (!dir.mkdirs())
									log.error("Cannot make dirs, path: " + filePath);
							}
							
							if (dir.exists())
							{
								File file = new File(filePath, fileName);
								StringBuffer sb = new StringBuffer();
								List list = new ArrayList();
								boolean fileExist = false;
								if (file.exists())
								{
									String content = readFileContent(file);
									sb = new StringBuffer(content);
									String[] str = content.split("\r\n");
									list = Arrays.asList(str);
									fileExist = true;
								}
								else {
									if (!file.createNewFile())
										log.error("Cannot make file, file name: " + fileName);
									else
										fileExist = true;
								}
								
								if (fileExist)
								{
									if (list.contains(email))
									{
										result = false;
										message = "您已订阅。";
									}
									else
									{
										sb.append(email + "\r\n");
										writeFileContent(file, sb.toString());
										result = true;
										message = "订阅成功。";
									}
								}
							}
						}
						
						JSONObject json = new JSONObject();
						try
						{
							json.put("result", result);
							json.put("detail", message);
						} catch (Exception e) {
							// TODO: handle exception
						}
						request.setAttribute("result", json);
						request.getRequestDispatcher("/resultinfo.jsp").forward(request, response);
					}
				}else{
				}
			}
		}
	}

	private String readFileContent(File file) throws FileNotFoundException,
			IOException, UnsupportedEncodingException
	{
		RandomAccessFile fis = new RandomAccessFile(file, "rw"); //not support chinese.
		FileChannel fcin = fis.getChannel();
		FileLock flin = null;
		while (true)
		{
			try {
				flin = fcin.tryLock();
				break;
			} catch (Exception e) {
				log.info("有其他线程正在操作该文件，当前线程休眠500毫秒");
				try {
					Thread.sleep(500);
				} catch (Exception e2) {
					log.error(e2);
				}
			}
		}
		
		String line = null;
		StringBuffer sb = new StringBuffer();
		
		while ((line = fis.readLine()) != null)
			sb.append(line + "\r\n");

		flin.release();    
		fcin.close();    
		fis.close();    
		
		return sb.toString();
	}
	
	private void writeFileContent(File file, String content) throws FileNotFoundException,
			IOException, UnsupportedEncodingException
	{
		RandomAccessFile out = new RandomAccessFile(file, "rw");
        FileChannel fcout = out.getChannel();
        FileLock flout = null;
        while(true)
        {
            try {
                flout = fcout.tryLock();
                break;
            } catch (Exception e) {
                 System.out.println("有其他线程正在操作该文件，当前线程休眠500毫秒");
                 try {
 					Thread.sleep(500);
 				} catch (Exception e2) {
 					log.error(e2);
 				}
            }
        }
        
        out.write(content.getBytes("UTF-8"));
        flout.release();
        fcout.close();
        out.close();
	}
}
