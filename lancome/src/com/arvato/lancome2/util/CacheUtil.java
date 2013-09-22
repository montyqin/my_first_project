package com.arvato.lancome2.util;

import java.io.IOException;
import java.io.InputStream;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class CacheUtil {

	private static CacheManager cacheManager;

	private static Cache defaultCache;
	
	static{
		init();
	}
	
	public static void setStringCache(String key, String content) {
		defaultCache.put(new Element(key, content));
	}

	public static String getStringCache(String key) {
		Element result = defaultCache.get(key);
		if (result != null) {
			Object resultObj = result.getObjectValue();
			if (resultObj != null) {
				return resultObj.toString();
			}
		}
		return null;
	}
	
	public static void setObjectCache(String key,Object obj){
		defaultCache.put(new Element(key, obj));
	}
	
	public static Object getObjectCache(String key){
		Element result = defaultCache.get(key);
		if(result!=null){
			return result.getObjectValue();
		}
		return null;
	}

	public static void clearCache(){
		cacheManager.clearAll();
	}
	
	public static void closeCache() {
		cacheManager.removeAllCaches();
		cacheManager.shutdown();
	}

	public static void init() {
		if (cacheManager != null) {
			closeCache();
		}
		
		InputStream fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("ehcache.xml");
		try {
			cacheManager = CacheManager.newInstance(fis);
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		defaultCache = cacheManager.getCache("lancomeCache");
	}
}
