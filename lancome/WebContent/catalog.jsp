<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<%
	if(request.getAttribute("catalog")==null){
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		//return;
	}
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="${catalog["name"]}_兰蔻Lancome手机官方网站暨网上商城" />
<meta name="Keywords" content="${catalog["name"]}_兰蔻Lancome手机官方网站暨网上商城" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>${catalog["name"]}_兰蔻Lancome手机官方网站暨网上商城</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/common.css" />
<style type="text/css">
	html,body{
		height:auto;
	}
	.catalog-img{
		width:100%;
		border:0;
	}
	.catalog-img img{
		width:100%;
		vertical-align: top;
	}
	.catalog-list{
		width:100%;
	}
	.catalog-list ul{
		list-style:none outside none;
		test-align:left;
		width:100%;
		padding:0;
		margin:0;
	}
	.catalog-list ul li{
		background:url(<%=contextPath%>/img/ui/catalog-list.png) repeat-x;
		margin:0;
		padding-left:20px;
		width:100%;
		height:50px;
		line-height:50px;
		border-bottom:1px solid #cecece;
		float:left;
	}
	.catalog-list ul li.select{
		background-image:url(<%=contextPath%>/img/ui/catalog-list-d.png);
	}
	.list-name{
		color:#000;
		font-size:16px;
		float:left;
		width:150px;
	}
	.list-intro{
		color:#333;
		font-size:15px;
		float:left;
		margin-left:0px;
	}
	.list-arrow{
		width:10px;
		height:16px;
		float:right;
		margin-right:30px;
		margin-top:17px;
		background:url(<%=contextPath%>/img/ui/arrow-r-b.png) no-repeat;
	}
	
	.catalog-content {
		border:solid 15px #e4e4e4;
		padding:10px;
	}
	.catalog-list {
		float:left;
		width:50%;
	}
	.catalog-img {
		width:100%;
	}
</style>
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
        <article id="main-content">
        	<div class="catalog-content">
        		<div>
        			<div style="float:right">按价格排序</div>
	   				<div>全部18个产品</div>
        		</div>
	        	<c:forEach items="${products}" var="item">
	        		<div class="catalog-list">
	        			<div class="catalog-img"><img src="<%=contextPath %>/${item.imgs}"/></div>
	        			<div class="txtcenter">${item.name}</div>
	        			<div class="txtcenter">${item.price}</div>
	        		</div>
	        	</c:forEach>
	        	<div class="clear"></div>
        	</div>
        	
<!--   			<div class="catalog-img"><a href="<%=contextPath %>/${catalog.link}"><img src="${catalog.img}" /></a></div>-->
<!--   			<div class="catalog-list">-->
<!--   				<div style="float:right">按价格排序</div>-->
<!--   				<div>全部18个产品</div>-->
<!--   				-->
<!--   			-->
<!--   				<ul>-->
<!--					<c:forEach var="c" items="${catalog.subCategory}">-->
<!--						<li data-cid="${c.id}"><span class="list-name">${c.name}</span><span class="list-intro">${c.intro}</span><span class="list-arrow"></span></li>-->
<!--					</c:forEach>-->
<!--   				</ul>-->
<!--   			</div>-->
        </article>
	</section>
	<script src="<%=contextPath %>/js/jquery-1.9.1.min.js"></script>
	<script src="<%=contextPath %>/js/tool.js"></script>
	<script type="text/javascript">
	
		$(function(){
			
			var handleListClick = function(cid){
				window.location.href = '<%=contextPath%>/catalog/${catalog.id}/'+cid;
			}
			
			$('#main-content').on(arvato.eventNameObj['clickdown'],function(e){
				var eTarget = e.target;
				if(eTarget.nodeName==='LI'){
					var $eTarget = $(e.target);
					$eTarget.addClass('select');
					$eTarget = null;
				}else if(eTarget.nodeName==='SPAN'){
					var $eTarget = $(e.target);
					$eTarget.parent().addClass('select');
					$eTarget = null;
				}else{
					
				}
				$eTarget = null;
			}).on(arvato.eventNameObj['clickup'],function(e){
				var eTarget = e.target;
				if(eTarget.nodeName==='LI'){
					var $eTarget = $(e.target);
					$eTarget.removeClass('select');
					$eTarget = null;
				} else if(eTarget.nodeName==='SPAN'){
					var $parentETarget = $(e.target).parent();
					if($parentETarget.data('cid')){
						$parentETarget.removeClass('select');
					}
					$parentETarget = null;
				}else{
					
				}
				eTarget = null;
			}).on('click',function(e){
				var eTarget = e.target;
				if(eTarget.nodeName==='LI'){
					var $eTarget = $(e.target);
					handleListClick($eTarget.data('cid'));
					$eTarget = null;
				} else if(eTarget.nodeName==='SPAN'){
					var $parentETarget = $(e.target).parent();
					if($parentETarget.data('cid')){
						handleListClick($parentETarget.data('cid'));
					}
					$parentETarget = null;
				}else{
					
				}
				eTarget = null;
			})
			
		});	
	
		$(window).load(function(){
			var fullH = $(this).height()+60;
			var h = fullH-$(document.body).height();
			if(h>0){
				$(document.body).height(fullH);
			}
			setTimeout(function(){ window.scrollTo(0, 1); }, 100);
		});	
	</script>
<%@include file="common-track.jsp" %>
</body>
</html>