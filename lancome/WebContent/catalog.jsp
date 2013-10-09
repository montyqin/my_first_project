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
<meta name="description" content="${catalog["name"]}_KIEHL'S科颜氏手机官方网站暨网上商城" />
<meta name="Keywords" content="${catalog["name"]}_KIEHL'S科颜氏手机官方网站暨网上商城" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>${catalog["name"]}_KIEHL'S科颜氏手机官方网站暨网上商城</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/category.css" />
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
        <article id="main-content">
        	<div class="inner-content">
        		<div class="catalog-content-title">
        			<div style="float:right;">
	        			按价格<a class="select" style="width:60px;" href="javascript:void(0)">
							<select id="sortBySel" onchange="sortBy(this)">
								<option value="1" ${sortValue eq '1' ? 'selected' : ''}>升序</option>
								<option value="0" ${sortValue eq '0' ? 'selected' : ''}>降序</option>
							</select>
							<span class="color"></span>
						</a>排序
        			</div>
	   				<div>全部${fn:length(products)}个产品</div>
        		</div>
	        	<c:forEach items="${products}" var="item">
	        		<div class="catalog-list">
	        			<div class="catalog-img"><img src="<%=contextPath %>/${item.imgs}" onclick="showinfo('${item.cid}','${item.id}')"/></div>
	        			<div class="txtcenter">${item.name}</div>
	        			<div class="txtcenter">RMB ${item.price}</div>
	        			<div class="product-contain">
	        				<div class="product-moreinfo" onclick="showinfo('${item.cid}','${item.id}')">详情</div>
	        				<div class="product-purchase" pid="${item.id}" onclick="buynow(this)">购买</div>
	        			</div>
	        		</div>
	        	</c:forEach>
	        	<div class="catalog-list"></div>
				<div class="justifyfix"></div>
        	</div>
        </article>
        <jsp:include page="common-footer.jsp"></jsp:include>
	</section>
	<script src="<%=contextPath %>/js/jquery-1.9.1.min.js"></script>
	<script src="<%=contextPath %>/js/tool.js"></script>
	<script type="text/javascript">
		
		function buynow(e){
			var $me = $(e);
			var pid = $me.attr('pid');
			arvato.buyItem(pid);
			$me = null;
			e = null;
		}
	
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
			$("span.color").html($("#sortBySel").find("option:selected").html());
		});

		function showinfo(cid,id){
			window.location.href = '<%=contextPath %>/info/' + cid + '/' + id;
		}

		function sortBy(obj)
		{
			$("span.color").html($(obj).find("option:selected").html());
			window.location.href = "<%=contextPath %>/catalog/${catalog.id}?sortValue=" + $(obj).val();
		}
	</script>
<%@include file="common-track.jsp" %>
</body>
</html>