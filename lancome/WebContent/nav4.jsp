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
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/category.css" />
<style type="text/css">
html,body {
	height:auto;
}
</style>
<script type="text/javascript">
	window.contextPath = '<%=contextPath%>';
</script>
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
		<div id="search-box">
               <input type="text" id="searchKeyword" class="search-text" value="${keyword}"/>
               <input type="button" style="color:#fff" class="search-button" value="搜索" onclick="searchProducts()"/>
            </div>
        <article id="main-content">            
        	<div class="catalog-content">
        		<div class="catalog-content-title">
        			<div style="float:right;">
	        			按<a class="select" style="width:60px;" href="javascript:void(0)">
							<select>
								<option value="price">价格</option>
							</select>
							<span class="color">价格</span>
						</a>排序
        			</div>
	   				<div>全部${rs.totalCount}个产品</div>
        		</div>
	        	<c:forEach items="${rs.values}" var="item">
	        		<div class="catalog-list">
	        			<div class="catalog-img"><img src="<%=contextPath %>/${item.imgs}" onclick="showinfo('${item.cid}','${item.id}')"/></div>
	        			<div class="txtcenter">${item.name}</div>
	        			<div class="txtcenter">RMB ${item.price}</div>
	        			<div class="product-contain">
	        				<div class="product-moreinfo" onclick="showinfo('${item.cid}','${item.id}')">详情</div>
	        				<div class="product-purchase">购买<!-- purchase: item.id --></div>
	        			</div>
	        		</div>
	        	</c:forEach>
				<div class="justifyfix"></div>
				<div>
		        	<input type="hidden" id="pageNum" value="1"/>
		        	<input type="hidden" id="allPageNum" value="${rs.pageNum}"/>
		        	<input type="button" id="btnShowMore" value="显示更多" onclick="showMore()" style="display:${rs.pageNum == pageNum ? 'none' : ''}"/>
	        	</div>
        	</div>
        </article>
        <jsp:include page="common-footer.jsp"></jsp:include>
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

		function searchProducts()
		{
			var txt = $.trim($("#searchKeyword").val());
			if (txt.length > 0)
				txt = encodeURIComponent(txt);
			window.location.href = '<%=contextPath%>/nav/nav4?keyword=' + txt;
		}
		function showMore()
		{
			var pageNum = $("#pageNum").val();
			if (isNaN(pageNum))
				pageNum = 1;
			else
				pageNum = parseInt(pageNum) + 1;
			
			$("#pageNum").val(pageNum);
			var allPageNum = parseInt($("#allPageNum").val());
			if (pageNum == allPageNum)
				$("#btnShowMore").hide();

			var txt = $.trim($("#searchKeyword").val());
			if (txt.length > 0)
				txt = encodeURIComponent(txt);
			
			$.post(window.contextPath + '/nav/nav4/getproducts', { "keyword":txt, "pageNum":pageNum }, function(result)
			{
				var jsonArr = eval("(" + result + ")");
				var html = "";
				for (var i = 0; i < jsonArr.length; i++)
				{
					var p = jsonArr[i];
					html += '<div class="catalog-list" style="margin-left:5%;">';
					html += '<div class="catalog-img"><img src="' + window.contextPath + '/' + p.imgs + '" onclick="showinfo(\"' + p.cid + '\",\"' + p.id + '\")"/></div>';
					html += '<div class="txtcenter">' + p.name + '</div>';
	    			html += '<div class="txtcenter">RMB ' + p.price + '</div>';
	    			html += '<div class="product-contain">';
	   				html += '<div class="product-moreinfo" onclick="showinfo(\"' + p.cid + '\",\"' + p.id + '\")">详情</div>';
	   				html += '<div class="product-purchase" style="margin-left:5%;">购买</div>';
		    		html += '</div>';
		    		html += '</div>';
				}
				$("#main-content").find("div.catalog-list:last").after(html);
			});
		}
	</script>
<%@include file="common-track.jsp" %>
</body>
</html>