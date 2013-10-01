package com.arvato.lancome2.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;

import com.arvato.lancome2.util.ConfigUtil;
import com.arvato.lancome2.vo.Catalog;
import com.arvato.lancome2.vo.Comment;
import com.arvato.lancome2.vo.Product;

/**
 * Servlet implementation class ProductServlet
 */
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static Logger log = Logger.getLogger(InfoServlet.class);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if(pathInfo!=null){
			String[] pathParts = pathInfo.split("/");
			if(pathParts.length>1){ // 不计算第一个空字符串
				request.getSession().setAttribute("menuItem", "nav1");
				if(pathParts.length==3){
					// 一级目录
					if(log.isDebugEnabled()){
						log.debug(pathParts[1]+"/"+pathParts[2]);
					}
					Catalog srcCatalog = ConfigUtil.getCatalog(pathParts[1]);
					Catalog destCatalog = new Catalog();
					destCatalog.setId(srcCatalog.getId());
					destCatalog.setName(srcCatalog.getName());
					destCatalog.setParentCatalog(srcCatalog.getParentCatalog());
					destCatalog.setLevel(2);// 不能直接修改srcCatalog，否则也会修改缓存里的对应类
					request.setAttribute("catalog", destCatalog);
					Product p =  ConfigUtil.getProduct(pathParts[2]);
					request.setAttribute("p",p);
					Product[] products = p.getProducts();
					if(products!=null&&products.length>0){
						int l = products.length;
						Map<String,Comment[]> allComments = new HashMap<String,Comment[]>();
						for(int i=0;i<l;i++){
							allComments.put(products[i].getId(), ConfigUtil.getCommentsByPCode(products[i].getPcode()));
						}
						request.setAttribute("allcomments", allComments);
					}else{
						request.setAttribute("comments", ConfigUtil.getCommentsByPCode(p.getPcode()));
					}
					request.getRequestDispatcher("/info.jsp").forward(request, response);
					srcCatalog = null;
				}else{
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String pathInfo = request.getPathInfo();
		if(pathInfo!=null){
			String[] pathParts = pathInfo.split("/");
			if(pathParts.length>1){ // 不计算第一个空字符串
				request.getSession().setAttribute("menuItem", "nav1");
				if(pathParts.length==3){
					if("comment".equals(pathParts[1])){
						String pcode = pathParts[2];
						if(pcode!=null){
							Comment c = new Comment();
							c.setName(request.getParameter("name"));
							c.setPcode(pcode);
							c.setScore(Integer.parseInt(request.getParameter("score")));
							c.setContent(request.getParameter("content")+"<来自兰蔻手机官网:"+c.getName()+">");
							if(ConfigUtil.addComment(c)){
								JSONObject result = new JSONObject();
								try {
									result.put("state", "1");
								} catch (JSONException e) {
									log.error(e.getMessage(),e);
								}
								response.getWriter().print(result.toString());
							}else{
								JSONObject result = new JSONObject();
								try {
									result.put("state", "0");
								} catch (JSONException e) {
									log.error(e.getMessage(),e);
								}
								response.getWriter().print(result.toString());
							}
						}
					}
				}else{
					
				}
			}
		}
	}

}
