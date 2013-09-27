package com.arvato.lancome2.web.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.arvato.lancome2.util.ConfigUtil;
import com.arvato.lancome2.vo.Catalog;
import com.arvato.lancome2.vo.Product;

/**
 * Servlet implementation class CatalogServlet
 */
public class CatalogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger(CatalogServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatalogServlet() {
        super();
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
		String pathInfo = request.getPathInfo();
		if(pathInfo!=null){
			String[] pathParts = pathInfo.split("/");
			if(pathParts.length>1){ // 不计算第一个空字符串
				if(pathParts.length==2){
					// 一级目录
					if(log.isDebugEnabled()){
						log.debug(pathParts[1]);
					}
					Catalog catalog = ConfigUtil.getCatalog(pathParts[1]);
					Product[] products = ConfigUtil.getProductsByCatalogId(pathParts[1]);
					List pts = Arrays.asList(products);
					Collections.sort(pts);
					request.setAttribute("catalog", catalog);
					request.setAttribute("products", pts);
					request.getRequestDispatcher("/catalog.jsp").forward(request, response);
				}else if(pathParts.length==3){
					// 二级目录
					if(log.isDebugEnabled()){
						log.debug(pathParts[1]+"/"+pathParts[2]);
					}
					request.setAttribute("catalog", ConfigUtil.getCatalog(pathParts[2]));
					Product[] products = ConfigUtil.getProductsByCatalogId(pathParts[2]);
					request.setAttribute("count", products.length);
					request.setAttribute("products", products);
					request.getRequestDispatcher("/products.jsp").forward(request, response);
				}else{
				}
			}
		}
	}

}
