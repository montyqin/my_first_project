package com.arvato.lancome2.util;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionParams;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.log4j.Logger;

public class HttpAccess {
	
	protected static Logger log = Logger.getLogger(HttpAccess.class);
	
	private static final String HTTP_CONTENT_CHARSET = "UTF-8";
	
	public static final Integer MAX_TIME_OUT = 5000;
	public static final Integer MAX_IDLE_TIME_OUT = 60000;
	public static final Integer MAX_CONN = 20;
	
	private HttpClient httpClient = null;
	
	
	public HttpAccess(){
		
//		MultiThreadedHttpConnectionManager connManager = new MultiThreadedHttpConnectionManager();
//		connManager.closeIdleConnections(MAX_IDLE_TIME_OUT);
//		connManager.getParams().setParameter("http.connection-manager.max-total", MAX_CONN);
		
		if(httpClient==null){
//			httpClient = new HttpClient(connManager);
			httpClient = new HttpClient();
			
			httpClient.getParams().setParameter(HttpConnectionParams.SO_TIMEOUT, MAX_TIME_OUT);
	        httpClient.getParams().setParameter("http.connection.timeout",MAX_TIME_OUT);
	        httpClient.getParams().setParameter("http.connection-manager.timeout",MAX_TIME_OUT.longValue());
	        //维持会话
	        httpClient.getParams().setCookiePolicy(CookiePolicy.BROWSER_COMPATIBILITY);
		}
	}
	
	
	public String sendGetRequest(String url){
		GetMethod getMethod = new GetMethod(url);
		getMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,HTTP_CONTENT_CHARSET); 
		try{
			getMethod.addRequestHeader(new Header("Connection", "close"));
			
			getMethod.setRequestHeader("Referer","http://m.lancome.com.cn");
			getMethod.setRequestHeader("Host","http://m.lancome.com.cn");
			getMethod.setRequestHeader("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
			httpClient.executeMethod(getMethod);
            if(getMethod.getStatusCode() == HttpStatus.SC_OK) {  
                return getMethod.getResponseBodyAsString();  
            }else{  
            	getMethod.abort();//马上断开连接
            	log.error("Http Comunication error:"+getMethod.getStatusCode());
            }
		}catch(Exception e){
			log.error(e.getMessage(),e);
			log.error("Http post occur error! again ! url=" + url);
/*			try {
				Thread.sleep(3000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			sendGetRequest(url);*/
		}finally{
			getMethod.releaseConnection();
		}
		return null;
	}
	
	public String sendPostRequest(String url,NameValuePair[] paramsBody){
		PostMethod postMethod = new PostMethod(url);
		postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,HTTP_CONTENT_CHARSET); 
		try{
			postMethod.addRequestHeader(new Header("Connection", "close"));
			
			postMethod.setRequestHeader("Referer","http://m.lancome.com.cn");
			postMethod.setRequestHeader("Host","http://m.lancome.com.cn");
			postMethod.setRequestHeader("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
			
			if(paramsBody!=null){
				postMethod.setRequestBody(paramsBody);
			}
			
			httpClient.executeMethod(postMethod);
            if(postMethod.getStatusCode() == HttpStatus.SC_OK) {  
                return postMethod.getResponseBodyAsString();  
            }else{  
            	postMethod.abort();//马上断开连接
            	log.error("Http Comunication error:"+postMethod.getStatusCode());
            }
		}catch(Exception e){
			log.error(e.getMessage(),e);
			log.error("Http post occur error! again ! url=" + url);
		}finally{
			postMethod.releaseConnection();
		}
		return null;
	}
	
}
