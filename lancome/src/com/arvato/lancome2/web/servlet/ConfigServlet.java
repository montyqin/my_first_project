package com.arvato.lancome2.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arvato.lancome2.util.CacheUtil;
import com.arvato.lancome2.util.ConfigUtil;

/**
 * Servlet implementation class ConfigServlet
 */
public class ConfigServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfigServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ope = request.getParameter("ope");
		if("init_catalog".equals(ope)){
			ConfigUtil.initCatalog();
		}else if("init_comment".equals(ope)){
//			ConfigUtil.initComment();
		}else if("clear_cache".equals(ope)){
			ConfigUtil.clearCache();
//			ConfigUtil.initComment();
		}else{
			
		}
	}

}
