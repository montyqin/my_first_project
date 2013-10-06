<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%

	String contextPath = request.getContextPath();

	if (request.getAttribute("catalog") == null) {
		response.sendRedirect(contextPath+"/index.jsp");
		return;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="${p["name"]}_科颜氏Kiehl's手机官方网站暨网上商城" />
<meta name="Keywords" content="${p["name"]}_科颜氏Kiehl's手机官方网站暨网上商城" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>${p["name"]}_科颜氏Kiehl's手机官方网站暨网上商城</title>
<link rel="stylesheet" type="text/css"	href="<%=contextPath%>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/category.css" />
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
        <article id="main-content">
          <div class="inner-content">
			<div class="info">
				<div class="info-row">
					<div class="info-img">
						<img src="<%=contextPath %>/${p.imgs}"/>
						<div class="button-weibo">分享到微博</div>
					</div>
					<div class="info-buy">
						<div class="info-name">
							${p.name}
						</div>
						<c:choose>
							<c:when test="${!empty p.products}">
								<c:choose>
								<c:when test="${p.classify eq 'color' }">
									<div class="price" style="height:auto"><span style="display:block" name="price-txt">RMB ${p.products[0].price}</span>
										<a class="select" style="width:110px;" href="javascript:void(0)">
											<select data-pid="${p.id}" name="selProductsColor">
												<c:forEach items="${p.products}" var="subP">
													<option data-rgb="${subP.rgb}" data-price="${subP.price}" value="${subP.id}">${subP.color}</option>
												</c:forEach>
											</select>
											<span class="color"><span class="product-color" style="background-color:${p.products[0].rgb}"></span>${p.products[0].color}</span>
										</a>
									</div>
								</c:when>
								<c:when test="${p.classify eq 'capacity'}">
									<div class="price"><span name="price-txt">RMB ${p.products[0].price}</span>
										<a class="select" href="javascript:void(0)">
											<select data-pid="${p.id}" name="selProducts">
												<c:forEach items="${p.products}" var="subP">
													<option data-price="${subP.price}" value="${subP.id}">${subP.capacity}</option>
												</c:forEach>
											</select>
											<span class="capacity">${p.products[0].capacity}</span>
										</a>
									</div>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<div class="price">RMB ${p.price}</div>
							</c:otherwise>
						</c:choose>
						<div style="margin-top:15px;">
							<a cid="${catalog.id}" pid="<c:choose><c:when test="${!empty p.products}">${p.products[0].id}</c:when><c:otherwise>${p.id}</c:otherwise></c:choose>"
								class="button-buy" onclick="buynow(this)" href="javascript:void(0);">立即购买</a>
						</div>
					</div>
				</div>
			</div>
			<div>
	        	<div class="details">
	        		产品详情<div class="plus"></div>
	        	</div>
	        	<div class="details-content" style="display:none;">
	        		${p.desc}
	        	</div>
	        </div>
			<div>
	        	<div class="details">
	        		顾客评论<div class="plus"></div>
	        	</div>
	        	<div class="details-content" style="display:none;">
	        		<c:choose>
						<%-- 单个产品 --%>
						<c:when test="${!empty comments}">
							<c:forEach items="${comments}" var="c">
								<div class="comment-item">
									<div>
										<span class="comment-info">${c.name}&nbsp;${c.date}</span>
										<span class="level">
										<c:forEach var="i" begin="1" end="${c.score}" step="1">
											<img src="<%=contextPath %>/img/ui/star.png">
										</c:forEach>
										</span>
									</div>
									<div class="comment-content">
										${c.content}
									</div>
								</div>
							</c:forEach>
						</c:when>
						<%-- 多个产品 --%>
						<c:when test="${!empty allcomments}">
							<c:forEach items="${allcomments}" var="comments" varStatus="i">
							<div name="comment-${comments.key}" <c:if test="${!(!empty p.products && p.products[0].id eq comments.key)}">style="display:none"</c:if> >
								<c:forEach items="${comments.value}" var="c">
									<div class="comment-item">
										<div>
											<span class="comment-info">${c.name}&nbsp;${c.date}</span>
											<span class="level">
											<c:forEach var="i" begin="1" end="${c.score}" step="1">
												<img src="<%=contextPath %>/img/ui/star2.png">
											</c:forEach>
										</span>
										</div>
										<div class="comment-content">
											${c.content}
										</div>
										<c:if test="${!i.last}">
											<div class="details-content-split"></div>
										</c:if>
									</div>
								</c:forEach>
							</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<br/>
							暂无顾客评论
						</c:otherwise>
					</c:choose>
	        	</div>
	        </div>
			<div>
	        	<div class="details">
	        		主要成分<div class="plus"></div>
	        	</div>
	        	<div class="details-content" style="display:none;">
	        		<br/>主要成分详细
	        	</div>
	        </div>
			<div>
	        	<div class="details">
	        		使用指导<div class="plus"></div>
	        	</div>
	        	<div class="details-content" style="display:none;">
	        		<br/>使用指导详细
	        	</div>
	        </div>
			<div>
	        	<div class="details">
	        		推荐购买<div class="plus"></div>
	        	</div>
	        	<div class="details-content" style="display:none;">
	        		<br/>推荐产品列表
	        	</div>
	        </div>
           </div>
        </article>
        <footer>
	      <p style="text-align:center;margin:15px">2013 Kiehl's Since 1851</p>
	    </footer>
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
			
			var commentObj = {"pcode":"<c:choose><c:when test='${!empty p.products}'>${p.products[0].pcode}</c:when><c:otherwise>${p.pcode}</c:otherwise></c:choose>","name":"","score":5,"content":""};
			
			var initBodyH = 0;
			var isAndroid2 = (navigator.userAgent.indexOf('Android 2')!=-1?true:false);
			
			$('#main-content').find('select[name="selProducts"],select[name="selProductsColor"]').on('change',function(){
				var $me = $(this);
				if($me.attr('name')==='selProducts'){
					var $option = $me.children('option:selected');
					$me.parent().parent().find('span[name="price-txt"]').empty().html('RMB '+$option.data('price'));
					$me.parent().parent().parent().find('a[pid]').attr('pid',$option.val());
					$me.parent().children('span').empty().html($option.text());
					
					$('div[name="comment-content"]').children('div[name^="comment-"]').css('display','none').end().children('div[name="comment-'+$option.val()+'"]').css('display','block');
					
					$option = null;
				}else if($me.attr('name')==='selProductsColor'){
					var $option = $me.children('option:selected');
					$me.parent().parent().find('span[name="price-txt"]').empty().html('RMB '+$option.data('price'));
					$me.parent().parent().parent().find('a[pid]').attr('pid',$option.val());
					$me.parent().children('span').empty().html('<span class="product-color" style="background-color:'+$option.data('rgb')+'}"></span>'+$option.text());
					
					$('div[name="comment-content"]').children('div[name^="comment-"]').css('display','none').end().children('div[name="comment-'+$option.val()+'"]').css('display','block');
					
					$option = null;
				}else{
					
				}
				$me = null;
			})
			
			$('#menu > li > a').on('click',function(){
				var $me = $(this);
				$me.parent().parent().children('li.active').removeClass('active').end().end().addClass('active');
				$('div.info-content').css('display','none');
				$('div[name="'+$me.data('name')+'"]').show();
				
				if(isAndroid2){
					var $body = $(document.body);
					if(initBodyH==0){
						initBodyH = $body.height();
					}
					
					//var hh = $('#main-content > div.info-desc > div.info-content:visible').height();
					if($me.data('name')=='efficacy'){
						$body.height(initBodyH);
					}else{
						$body.css('height','auto');
					}
					
					$body = null;
				}
			}).filter(':eq(0)').click();
			
			$('#preComment').on('click',function(){
				var $divComment = $('div[name="comment"]');
				$divComment.children('div[name="comment-content"]').hide().css({'left':0-$(window).width()+'px'});
				$divComment.children('div[name="comment-add"]').show().animate({'left':'0px'},300);
			});
			$('#addComment').on('click',function(){
				var $addComment = $('div[name="comment-add"]');
				commentObj.name = $.trim($addComment.find('input[name="commentName"]').val());
				commentObj.content = $.trim($addComment.find('textarea[name="commentContent"]').val());
				if($.trim(commentObj.content)==''){
					alert('请填写内容哦，谢谢');
				}else{
			 		$.ajax({
						url:'<%=contextPath %>/info/comment/'+commentObj.pcode,
						type:'POST',
						dataType:'json',
						data:commentObj,
						success: function(d){
							if(d && d.state=='1'){
								alert('评论已提交，请等待审核，谢谢您的参与');
							}
							$('#viewComment').trigger('click');
						},
						error:function(e){
							alert('网络异常，请稍后重试');
						}
			 		});
				}
			});
			$('#viewComment').on('click',function(){
				var $divComment = $('div[name="comment"]');
				$divComment.children('div[name="comment-add"]').hide().css({'left':'100%'});
				$divComment.children('div[name="comment-content"]').show().animate({'left':'0px'},300);
			});
			
			$('#commentLevel').on('click',function(e){
				var eTarget = e.target;
				if(eTarget.nodeName === 'IMG'){
					var $eTarget = $(eTarget);
					var lev = parseInt($eTarget.data('lev'),10);
					$(this).children('img:gt('+lev+')').attr('src','<%=contextPath %>/img/ui/star1.png');
					$(this).children('img:lt('+(lev+1)+')').attr('src','<%=contextPath %>/img/ui/star2.png');
					commentObj.score = lev+1;
				}
				eTarget = null;
			});
			
			
			//$('div[name="efficacy"] > .pre').css('width',$(window).width()-6+'px');
			
			//if(isAndroid2){
				//var $menu = $('#menu');
				
				//$('div[name="efficacy"]').css({'position':'absolute','z-index':'2','top':$menu.position().top+$menu.height()+1});
				
/* 				var noBarsOnTouchScreen = function($elem){
					var tx, ty;
					$elem.css('overflow','hidden');
					$elem.on('touchstart',ts).on('touchmove',tm);
					function ts(event){
						var tch;
						if(e.originalEvent.touches){
						  e.stopPropagation();
						  tch = e.originalEvent.touches[0];
						  tx = tch.clientX;
						  ty = tch.pageY;
						}
					}
					function tm(e){
						var tch;
						if(e.originalEvent.touches){
							e.preventDefault();
							e.stopPropagation();
							tch = e.originalEvent.touches[0];
							this.scrollTop += ty-tch.pageY;
							ty = tch.pageY;
						}
					}					
				}
				noBarsOnTouchScreen($('div[name="efficacy"]')); */
				
				//$menu = null;
			//}
			
			var $weiboShare = $('div[name="weiboshare"]');
			if($weiboShare.length){
				$weiboShare.click(function(){
					var $me = $(this);
					var shareTitle = encodeURIComponent($me.parent().children('div[name="weibotitle"]').html());
					var shareUrl = encodeURIComponent($me.parent().children('div[name="weibourl"]').html());
					$me = null;
					//var contextPath = window.contextPath || '/lancome';
					//var picUrl = encodeURIComponent(window.location.protocol+'//'+window.location.host+contextPath+'/img/info/lancome-info.png');
					//window.location.href = 'http://v.t.sina.com.cn/share/share.php?url='+encodeURIComponent(window.location.href)+'&appkey=2530574100&title='+shareTitle+'&pic='+picUrl;
					window.location.href = 'http://v.t.sina.com.cn/share/share.php?url='+shareUrl+'&appkey=2530574100&title='+shareTitle+'&content=utf-8&pic=';
				});
			}
			
			//alert('${catalog.id}');
			
			$("div.details").each(function()
			{
				$(this).click(function()
				{
					$(this).find("div:first").toggleClass("minus");
					$(this).nextAll("div:first").toggle();
				});
			});
		});
	
		$(window).load(function(){
/* 			var $win = $(this);
			var winH = $win.height();
			var fullH = winH+60;
			var h = fullH-$(document.body).height();
			if(h>0){
				$(document.body).height(fullH);
			}
 			var $menu = $('#menu');
			var maxH = $win.height() - $menu.offset().top-$menu.height()+50;
			if(maxH>0){
				$('div.info-content').css('height',maxH+'px');
			}
			$win = null; */
			setTimeout(function(){ window.scrollTo(0, 1); }, 100);
		});	
	</script>
<%@include file="common-track.jsp" %>
</body>
</html>