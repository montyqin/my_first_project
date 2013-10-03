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
<link href="<%=contextPath %>/css/common.min.css" rel="stylesheet">
<link href="<%=contextPath %>/css/dl.css" rel="stylesheet">
<script src="<%=contextPath%>/js/index-img.js"></script>
<script src="<%=contextPath%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=contextPath%>/js/index.js"></script>
<script src="<%=contextPath%>/js/zepto.min.js"></script>
<script src="<%=contextPath%>/js/channel.min.js"></script>
<script src="<%=contextPath%>/js/swipe.sina.min.js"></script>


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
	<script type="text/javascript">
		function openSubCategory(obj){
		   var next = $(obj).next();
		   if(next.css("display") == "none"){
			  next.css("display","block");
			  $(obj).addClass("expand");
			  $(obj).find("div.crow_arrow").addClass("arrow_up");
		   }else{
			  next.css("display","none");
			  $(obj).removeClass("expand");
			  $(obj).find("div.crow_arrow").removeClass("arrow_up");
		   }
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
			<div id="j_imgSwipe" class="swipe" style="visibility: visible;">
				<div class="swipe-wrap" data-sudaclick="imgswipe" style="width: 1280px;">
					<div class="swipe_pic" style="width: 320px; left: 0px; -webkit-transition: 300ms; -webkit-transform: translate(-320px, 0px) translateZ(0px);"
					data-index="0">
						<a href="http://www.neulion.com.cn">
							<img src="<%=contextPath %>/img/index/KV.png" alt="">
							<h3 class="swipe_h3">
								手机官网购物即有机会体验科颜氏明星四宝旅行装1
							</h3>
						</a>
					</div>
					<div class="swipe_pic" style="width: 320px; left: -320px; -webkit-transition: 300ms; -webkit-transform: translate(-320px, 0px) translateZ(0px);"
					data-index="1">
						<a href="http://www.neulion.com.cn">
							<img src="<%=contextPath %>/img/index/vsnlp.jpg" alt="">
							<h3 class="swipe_h3">
								手机官网购物即有机会体验科颜氏明星四宝旅行装2
							</h3>
						</a>
					</div>
	            </div>
	            <ul class="swipe_num">
					<li class="active"></li>
					<li class=""></li>
				</ul>
	        </div>
	       	<div class="clist"> 
				  <ul>	
					<c:forEach items="${categories}" var="item">
					<li class="crow level1" >
						<div class="crow_row" onclick="openSubCategory(this)">
							<div class="crow_title">
								<span>
									${item.name}
								</span>
							</div>
							<div class="crow_arrow"></div>
							<div>
								&nbsp;
							</div>
						</div>			
						<ul class="clist clist_sub" style="opacity: 1; display: none;">
							<li class="crow level2">				
								<div class="crow_row_2">     
								   <c:forEach items="${item.subCategory}" var="subitem">					
									<div class="crow_item">
										<a href="<%=contextPath%>/catalog/${subitem.id}">${subitem.name}</a>
									</div>						
								  </c:forEach>
								</div>
							</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</div>
		    <div class="subscribe">
				<div><h1 style="text-align:center;">订阅</h1></div>
				<div style="text-align:center;margin:10px"><span>输入邮箱地址</span></div>
				<div style="text-align:center;"><input type="text" style="height:70px; width:80%" name="email" id="email" value=""></div>
				<div style="text-align:center;margin:10px;"><input type="submit" class="btn_submit" value=""></div>
			</div>
		</article>
        <footer>
	      <p style="text-align:center;margin:15px">2013 Kiehl's Since 1851</p>
	    </footer>		
	</section>
	
	
	<script src="js/tool.js"></script>
	
	
<%@include file="common-track.jsp" %>

</body>
</html>