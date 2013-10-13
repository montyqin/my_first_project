package com.arvato.lancome2.web.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.arvato.lancome2.util.CacheUtil;
import com.arvato.lancome2.util.ConfigUtil;
import com.arvato.lancome2.vo.Product;
import com.arvato.lancome2.vo.RecordSet;

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
					req.getSession().removeAttribute("menuItem");
					resp.sendRedirect("http://v.0nk.cn/storeaddress/location/kiehls");
				}
				else if ("nav3".equalsIgnoreCase(pathParts[1])){
					req.getSession().setAttribute("menuItem", "nav3");
					req.setAttribute("navItem", "nav3");
					req.getRequestDispatcher("/nav3.jsp").forward(req, resp);
				}
				else if ("nav4".equalsIgnoreCase(pathParts[1])){
					
					Date searchTime = new Date();
					Date loadedProductsTime = (Date) CacheUtil.getObjectCache("loadedProductsTime");
					
					if (loadedProductsTime != null)
					{
						long diff = (searchTime.getTime() - loadedProductsTime.getTime()) / 1000;
						if (diff > 60 * 30) //diff in seconds
							ConfigUtil.initCatalog();
					}

					String keyword = req.getParameter("keyword");
					if (!StringUtils.isEmpty(keyword))
						keyword = URLDecoder.decode(keyword, "UTF-8");
					List productsList = (List) CacheUtil.getObjectCache("products_list");
					List tmpList = new ArrayList();
					String sortValue = req.getParameter("sortValue");
					sortValue = StringUtils.isEmpty(sortValue) ? "1" : sortValue;
					req.setAttribute("sortValue", sortValue);
					if (productsList != null)
					{
						tmpList.addAll(productsList);
						if ("1".equals(sortValue))
						{
							Collections.sort(tmpList, new Comparator<Product>()
							{
								@Override
								public int compare(Product o1, Product o2)
								{
									if (StringUtils.isEmpty(o1.getPrice()) || StringUtils.isEmpty(o2.getPrice()))
								        return 0;
								    
									return new Integer(o1.getPrice()).compareTo(new Integer(o2.getPrice()));
								}
							});
						}
						else
						{
							Collections.sort(tmpList, new Comparator<Product>()
							{
								@Override
								public int compare(Product o1, Product o2)
								{
									if (StringUtils.isEmpty(o1.getPrice()) || StringUtils.isEmpty(o2.getPrice()))
								        return 0;
								    
									return -(new Integer(o1.getPrice()).compareTo(new Integer(o2.getPrice())));
								}
							});
						}
					}
					
					if (!StringUtils.isEmpty(keyword))
					{
						keyword = keyword.trim();
						for (Iterator iter = tmpList.iterator(); iter.hasNext();)
						{
							Product product = (Product) iter.next();
							if (product.getName().indexOf(keyword) == -1)
								iter.remove();
						}
					}
					String pageNum = req.getParameter("pageNum");
					int num = 1;
					try {
						Integer pn = new Integer(pageNum);
						if (pn != null)
							num = pn.intValue();
					} catch (Exception e) {
						num = 1;
					}
					RecordSet rs = new RecordSet(tmpList, num);
					
					if (pathParts.length == 3 && "getproducts".equalsIgnoreCase(pathParts[2])) {
						req.setAttribute("result", rs);
						req.getRequestDispatcher("/result.jsp").forward(req, resp);
					}
					else {
						req.getSession().setAttribute("menuItem", "nav4");
						req.setAttribute("navItem", "nav4");
						
						req.setAttribute("rs", rs);
						req.setAttribute("pageNum", "" + num);
						req.setAttribute("keyword", keyword);
						req.getRequestDispatcher("/nav4.jsp").forward(req, resp);
					}
				}
			}
		}
	}
}
