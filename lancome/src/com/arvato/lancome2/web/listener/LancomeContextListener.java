package com.arvato.lancome2.web.listener;

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
//		ConfigUtil.initComment();
	}

	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		ConfigUtil.closeCache();
	}
	
}
