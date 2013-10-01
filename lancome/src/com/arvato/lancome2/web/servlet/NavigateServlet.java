package com.arvato.lancome2.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NavigateServlet extends HttpServlet {

	private static final long serialVersionUID = 2087791905607973652L;
	
	public NavigateServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pathInfo = req.getPathInfo();
		if(pathInfo!=null){
			String[] pathParts = pathInfo.split("/");
			if(pathParts.length>1){ // 不计算第一个空字符串
				if ("nav1".equalsIgnoreCase(pathParts[1])){
					req.getSession().setAttribute("menuItem", "nav1");
					req.getRequestDispatcher("/info.jsp").forward(req, resp);
				}
				else if ("nav2".equalsIgnoreCase(pathParts[1])){
					req.getSession().setAttribute("menuItem", "nav2");
					req.getRequestDispatcher("/nav2.jsp").forward(req, resp);
				}
				else if ("nav3".equalsIgnoreCase(pathParts[1])){
					req.getSession().setAttribute("menuItem", "nav3");
					req.getRequestDispatcher("/nav3.jsp").forward(req, resp);
				}
				else if ("nav4".equalsIgnoreCase(pathParts[1])){
					req.getSession().setAttribute("menuItem", "nav4");
					req.getRequestDispatcher("/nav4.jsp").forward(req, resp);
				}
			}
		}
	}
}
