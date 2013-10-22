<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%><html>
<%
	String contextPath = request.getContextPath();
	
    String adText ="手机官网购物既有机会体验科颜氏明星四宝旅行装";
    String adUrl = "http://m.kiehls.com.cn/kiehls/ext/fourb.html";
   
	List list = new ArrayList();
	
	//String[] images = new String[] { "/img/index/kv1.jpg", "/img/index/kv2.jpg","/img/index/kv3.jpg"};
	//String[] descs = new String[] { "科颜氏集焕白系列 超越净白 水润立现", "夜间修护精华液", "焕白双效 清爽隔离"};
	//String[] links = new String[] { "http://v.0nk.cn/kiehls/info/c102/895","http://v.0nk.cn/kiehls/info/c110/908", "http://v.0nk.cn/kiehls/info/c108/902-907"};
	
	
 	String[] images = new String[] { "/img/index/kv1.jpg"};
	String[] descs = new String[] { "科颜氏集焕白系列 超越净白 水润立现"};
	String[] links = new String[] { "http://v.0nk.cn/kiehls/ext/jh.html"};

	
	for (int i = 0; i < images.length; i++)
	{
		Map map = new HashMap();
		map.put("image", images[i]);
		map.put("desc", descs[i]);
		map.put("link", links[i]);
		
		list.add(map);
	}	
	
	request.setAttribute("swipeList", list);
	request.setAttribute("adText", adText);
	request.setAttribute("adUrl", adUrl);
%>
<!DOCTYPE html>
<%-- <html manifest="manifest/indexAppCache.manifest">  --%>
<head>
<meta charset="utf-8">
<meta name="description" content="科颜氏">
<meta name="Keywords" content="科颜氏" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>科颜氏</title>
<link href="<%=contextPath %>/css/common.css" rel="stylesheet">
<link href="<%=contextPath %>/css/category.css" rel="stylesheet">
<link href="<%=contextPath %>/css/dl.css" rel="stylesheet">
<script src="<%=contextPath%>/js/index-img.js"></script>
<script src="<%=contextPath%>/js/zepto.min.js"></script>
<script src="<%=contextPath%>/js/channel.min.js"></script>
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
	   resizeOnLoad2();
	}
</script>
</head>
<body>
   <section id="content_body">			
   <jsp:include page="common-top.jsp"></jsp:include>		
        <article id="main-content">
			<div id="j_imgSwipe" class="swipe" style="visibility: visible;">
				<div class="swipe-wrap" data-sudaclick="imgswipe" style="width: 1280px;">
					<c:forEach items="${swipeList}" var="item">
						<div class="swipe_pic" style="width: 320px; left: 0px; -webkit-transition: 300ms; -webkit-transform: translate(-320px, 0px) translateZ(0px);"
						data-index="0">
							<a href="${item.link}">
								<img src="<%=contextPath %>${item.image}" alt="">
								<h3 class="swipe_h3" style="display:none">${item.desc}</h3>
							</a>
						</div>
					</c:forEach>
	            </div>
	            <c:if test="${fn:length(swipeList) gt 1}">
	            <ul class="swipe_num">
	            	<c:forEach begin="1" end="${fn:length(swipeList)}" varStatus="i">
	            		<li class="${i.index == 1 ? 'active' : '' }"></li>
	            	</c:forEach>
				</ul>
				</c:if>
	        </div>
	       	<a href="${adUrl}"><h3 style="text-align:center;color:red;font-size:13px;">${adText}</h3></a>
	       	<div class="clist"> 
				  <ul>	
					<c:forEach items="${categories}" var="item">
					<li class="crow level1" >
						<div id="first_item" class="crow_row" onclick="openSubCategory(this)">							
						   <c:choose>
		                       <c:when test="${!empty item.subCategory}">
		                           <div class="crow_title">
									<span>
										${item.name}
									</span>
									</div>
							   </c:when>
							   <c:otherwise>
							      <a class="crow_title_a" href="<%=contextPath%>/catalog/${item.id}">${item.name}</a>
							   </c:otherwise>
						   </c:choose>
							<c:if test="${!empty item.subCategory}">
							    <div class="crow_arrow"></div>
							</c:if>
							<div>
								&nbsp;
							</div>
						</div>
						<c:if test="${!empty item.subCategory}">
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
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div>
 
	    <img src="<%=contextPath%>/img/ui/bottom.png" style="width:100%" />	

			<%@include file="subscribe.jsp" %>
		</article>
		
       <jsp:include page="common-footer.jsp"></jsp:include>		
	</section>
<script src="<%=contextPath%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=contextPath%>/js/tool.js"></script>
	
<script type="text/javascript">
	function resizeOnLoad(){
			if(arvato && !arvato.imgload){
				var fullH = $(window).height()+60;
				var h = fullH-$(document.body).height();
				if(h>0){
					$(document.body).height(fullH);
				}
				setTimeout(function(){ window.scrollTo(0, 1); }, 100);
				arvato.imgload = 1;
			}
		}
	
	function resizeOnLoad2() {
		var fullH = $("#content_body").height();
		var body_hight = $(document.body).height();
		if(fullH >= body_hight){
			$(document.body).height(fullH);
		}		
	}
		
	$(window).load(function(){
		var fullH = $("#content_body").height();
		var body_hight = $(document.body).height();
		if(fullH > body_hight){
			$(document.body).height(fullH);
		}
		setTimeout(function(){ window.scrollTo(0, 1); }, 100);
	});		

	$("#lancome-menu-right").css("display","none");

	$('.crow_title_a').each(function(){
		if($(this).html()=="十大明星产品"){
			$(this).attr("href","<%=contextPath%>/ext/top10.html");
		}
	})
	
</script>

<%@include file="common-track.jsp" %>

</body>
</html>