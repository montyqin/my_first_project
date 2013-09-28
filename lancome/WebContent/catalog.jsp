<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>${catalog["name"]}_科颜氏Kiehl's手机官方网站暨网上商城</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/common.css" />
<style type="text/css">
	html,body {
		height:auto;
	}
	.catalog-content {
		border:solid 10px #ece7e1;
		padding:10px;
		text-align:justify;
	}
	.catalog-content-title {
		height:25px;
	}
	.catalog-list {
		display:inline-block;
		width:45%;
	}
	.catalog-img {
		width:100%;
		border:0;
	}
	.catalog-img img {
		width:100%;
		vertical-align: top;
	}
	.justifyfix {
		display:inline-block;
		width:100%;
		height:0;
		overflow:hidden;
	}
	.product-contain {
		text-align:center;
		height:30px;
		margin-top:5px;
	}
	.product-purchase {
		display:inline-block;
		background:url(../img/ui/purchase.png) no-repeat;
		background-size:100% 100%;
		width:40%;
		height:80%;
	}
	.product-moreinfo {
		display:inline-block;
		background:url(../img/ui/moreinfo.png) no-repeat;
		background-size:100% 100%;
		width:40%;
		height:80%;
	}
</style>
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
        <article id="main-content">
        	<div class="catalog-content">
        		<div class="catalog-content-title">
        			<div style="float:right">按<select style="margin:0 5px;"><option value="price">价格</option></select>排序</div>
	   				<div>全部${fn:length(products)}个产品</div>
        		</div>
	        	<c:forEach items="${products}" var="item">
	        		<div class="catalog-list">
	        			<div class="catalog-img"><img src="<%=contextPath %>/${item.imgs}"/></div>
	        			<div class="txtcenter">${item.name}</div>
	        			<div class="txtcenter">RMB ${item.price}</div>
	        			<div class="product-contain">
	        				<div class="product-moreinfo" onclick="showinfo('${catalog.id}','${item.id}')"></div>
	        				<div class="product-purchase"><!-- purchase: item.id --></div>
	        			</div>
	        		</div>
	        	</c:forEach>
	        	<!--<div class="catalog-list"></div>-->
				<div class="justifyfix"></div>
        	</div>
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

		function showinfo(cid,id){
			window.location.href = '<%=contextPath %>/info/' + cid + '/' + id;
		}
	</script>
<%@include file="common-track.jsp" %>
</body>
</html>