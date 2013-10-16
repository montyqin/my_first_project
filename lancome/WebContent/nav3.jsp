<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String contextPath = request.getContextPath();
	//String f = request.getParameter("f");
%>
<!DOCTYPE html>
<%-- <html manifest="manifest/indexAppCache.manifest">  --%>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="科颜氏">
<meta name="Keywords" content="科颜氏" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>科颜氏</title>
<link href="<%=contextPath %>/css/common.css" rel="stylesheet">
<link href="<%=contextPath %>/css/category.css" rel="stylesheet">
<link href="<%=contextPath %>/css/blue1.css" rel="stylesheet">
<link href="<%=contextPath %>/css/dl.css" rel="stylesheet">
<script src="<%=contextPath%>/js/index-img.js"></script>
<script src="<%=contextPath%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=contextPath%>/js/index.js"></script>
<script src="<%=contextPath%>/js/category.js"></script>
<script src="<%=contextPath%>/js/zepto.min.js"></script>
<script src="<%=contextPath%>/js/channel.min.js"></script>
<script src="<%=contextPath%>/js/tool.js"></script>
<script src="<%=contextPath%>/js/swipe.js"></script>

	<script type="text/javascript">
		if(navigator.userAgent.indexOf('UCWEB')!=-1){
			alert('UC浏览器的极速模式下由于会经过UC服务器压缩处理可能会影响网站外观，关闭后可完整体验');
		}
		if(!navigator.cookieEnabled){
			alert('您的浏览器未开启cookie，将无法正常购物，请开启后再来，谢谢您的关注');
		}

		if(!!navigator.userAgent.match(/AppleWebKit.*Mobile.*/)||!!navigator.userAgent.match(/AppleWebKit/)||navigator.userAgent.indexOf('Linux')>-1){
			
		}else{
			//window.location.replace('http://www.lancome.com.cn/lancome/_zh/_cn/index.aspx');
		}
	</script>
	<style type="text/css">
		html,body {
			height:auto;
			overflow-x:hidden;
		}
	</style>
</head>
<body>
<section>			
	<jsp:include page="common-top.jsp"></jsp:include>		
	<article id="main-content">
     	<img src="<%=contextPath %>/ext/imgs/new/10_01.jpg" name="product" data-id="900"/>
     	<img src="<%=contextPath %>/ext/imgs/new/10_02.jpg"/>
     	<img src="<%=contextPath %>/ext/imgs/new/10_03.jpg"/>
     	<img src="<%=contextPath %>/ext/imgs/new/10_04.jpg" name="product" data-id="895" style="width:50%;float:left;"/>
     	<img src="<%=contextPath %>/ext/imgs/new/10_05.jpg" name="product" data-id="900" style="width:50%;float:left;"/>
     	<img src="<%=contextPath %>/ext/imgs/new/10_06.jpg" name="product" data-id="908" style="width:50%;float:left;"/>
     	<img src="<%=contextPath %>/ext/imgs/new/10_07.jpg" name="product" data-id="900" style="width:50%;float:left;"/>
     	<jsp:include page="common-footer.jsp"></jsp:include>
	</article>
</section>
<script type="text/javascript">
$(function(){
	$('img[name="product"]').click(function(){
		arvato.buyItem($(this).data('id'));
	});
	
});

document.write(unescape('%3Cscript type="text/javascript" src="http://m.icybercode.com/tracking/track.js"%3E%3C/script%3E'));
</script>
<%@include file="common-track.jsp" %>
<script src="<%=contextPath%>/js/tool.js"></script>
</body>
</html>