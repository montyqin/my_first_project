package com.arvato.lancome2.web.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.arvato.lancome2.util.CacheUtil;
import com.arvato.lancome2.util.ConfigUtil;

public class LancomeContextListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		ConfigUtil.setJsonFolderPath(contextEvent.getServletContext().getRealPath("/")+"file");
		ConfigUtil.setContextPath(contextEvent.getServletContext().getContextPath());
		ConfigUtil.initCatalog();
		
		List categories = (List) CacheUtil.getObjectCache("catalog_level_0");
		//ConfigUtil.initComment();
		
		contextEvent.getServletContext().setAttribute("categories", categories);
	}

	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		ConfigUtil.closeCache();
	}
	
}
