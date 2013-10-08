package com.arvato.lancome2.web.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;

import com.arvato.lancome2.util.MD5;

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
					
					if ("register".equalsIgnoreCase(pathParts[1])) {
						String email = request.getParameter("email");
						String pwd = request.getParameter("pwd");
						String birthday = request.getParameter("birthday");
						String uname = request.getParameter("uname");
						String mobile = request.getParameter("mobile");
						String gender = request.getParameter("gender");
						String subscription = request.getParameter("subscription");
						String sign = "email=" + email + "&pwd=" + pwd+ "&uname=" + uname
							+ "&mobile=" + mobile + "2505307234334bb08fa0c855a8933ab0";

						NameValuePair nvp1 = new NameValuePair("email", email);
						NameValuePair nvp2 = new NameValuePair("pwd", pwd);
						NameValuePair nvp3 = new NameValuePair("birthday", birthday);
						NameValuePair nvp4 = new NameValuePair("uname", uname);
						NameValuePair nvp5 = new NameValuePair("mobile", mobile);
						NameValuePair nvp6 = new NameValuePair("gender", gender);
						NameValuePair nvp7 = new NameValuePair("subscription", subscription);
						NameValuePair nvp8 = new NameValuePair("sign", MD5.getHashString(sign, "UTF-8"));
						
						String url = "http://user.kiehls.com.cn/EcProfileMobile.aspx/Register";
						//String url = "http://user.lancome.com.cn/EcProfileMobile.aspx/Register";
						String result = postUrl(url, new NameValuePair[] { nvp1, nvp2, nvp3, nvp4, nvp5, nvp6, nvp7, nvp8 });
						
						request.setAttribute("result", result);
						request.getRequestDispatcher("/resultinfo.jsp").forward(request, response);
					}
					else if ("signin".equalsIgnoreCase(pathParts[1])) {
						String email = request.getParameter("email");
						String pwd = request.getParameter("pwd");
						String sign = "email=" + email + "&pwd=" + pwd
							+ "2505307234334bb08fa0c855a8933ab0";
						
						NameValuePair nvp1 = new NameValuePair("email", email);
						NameValuePair nvp2 = new NameValuePair("pwd", pwd);
						NameValuePair nvp3 = new NameValuePair("sign", MD5.getHashString(sign, "UTF-8"));
						
						String url = "http://user.kiehls.com.cn/EcProfileMobile.aspx/SignIn";
						//String url = "http://user.lancome.com.cn/EcProfileMobile.aspx/SignIn";
						String result = postUrl(url, new NameValuePair[] { nvp1, nvp2, nvp3 });

						request.setAttribute("result", result);
						request.getRequestDispatcher("/resultinfo.jsp").forward(request, response);
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
	
	private String postUrl(String url, NameValuePair[] data)
	{
		String result = null;
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(url);
		postMethod.setRequestBody(data);
		
		try
		{
			int statusCode = httpClient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK)
				log.error("Method failed: " + postMethod.getStatusLine());
			
			InputStream is = postMethod.getResponseBodyAsStream();
			result = inputStream2String(is);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	private String inputStream2String(InputStream is) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuffer buffer = new StringBuffer();
		String line = null;
		
		while ((line = reader.readLine()) != null)
			buffer.append(line);
		
		reader.close();
		is.close();
		
		return buffer.toString();
	}
}
