<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<%
	if(request.getAttribute("catalog")==null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="${catalog["name"]}_KIEHL'S科颜氏手机官方网站暨网上商城">
<meta name="Keywords" content="${catalog["name"]}_KIEHL'S科颜氏手机官方网站暨网上商城" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
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
		<!-- 视图1 -->
        <article id="main-content-1" style="position:relative;width:100%;">
        	<div id="view-info-1" class="view-info">总共${count}个产品，点击右侧图标切换视图<span onclick="changeView(2)" class="view-icon-1"></span></div>
			<div name="part1" class="part1">		
				<div class="items">
					<c:forEach items="${products}" var="p" varStatus="i">		
						<div class="item" index="${i.index + 1}" iid="${p.id}">
							<div class="bimg"><img class="bi" src="${p.imgs}" <c:if test="${i.index==0}">onload="onimgload();"</c:if> /></div>
							<div class="b_desc">
								<div class="b_ch">${p.name}</div>
							</div>
							<div class="buy" iid="${p.id}" style='width:190px;<c:if test="${p.classify eq 'color' }">margin-top:-223px</c:if>'>
								<c:choose>
								<c:when test="${!empty p.products}">
									<c:choose>
									<c:when test="${p.classify eq 'color'}">
									<div class="price" style="float:right;height:auto"><span style="display:block" name="price-txt">￥${p.products[0].price}</span>
	 								<a class="select" style="width:112px;" href="javascript:void(0)">
	 								<select data-pid="${p.id}" name="selProductsColor" style="width:100%;">
										<c:forEach items="${p.products}" var="subP">
										<option data-rgb="${subP.rgb}" data-price="${subP.price}" value="${subP.id}">${subP.color}</option>
										</c:forEach>
									</select>
									<span class="color"><span class="product-color" style="background-color:${p.products[0].rgb}"></span>${p.products[0].color}</span>
									</a>
									</div>
									</c:when>
									<c:when test="${p.classify eq 'capacity'}">
									<div class="price" style="float:right"><span name="price-txt">￥${p.products[0].price}</span>
	 								<a class="select" href="javascript:void(0)">
	 								<select data-pid="${p.id}" name="selProducts" style="width:100%;">
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
									<div class="price" style="float:right;width:127px;">￥${p.price}</div>
								</c:otherwise>
								</c:choose>
								<span class="button-inset" style="float:right;"><a cid="${catalog.id}" pid="<c:choose><c:when test="${!empty p.products}">${p.products[0].id}</c:when><c:otherwise>${p.id}</c:otherwise></c:choose>" class="button dark-grey" onclick="buynow(this)" href="javascript:void(0);">立即购买</a></span>
								<span class="button-inset" style="float:right;"><a cid="${catalog.id}" info-fileid="${p.fileid}" info-pid="${p.id}" class="button grey" onclick="showinfo(this)" href="javascript:javascript:void(0);">查看详情</a></span>
							</div>
						</div>	
					</c:forEach>	
				</div>					
			</div>
        
			<div name="bgbg_s" class="bgbg s"></div>
			<div name="part2" class="part2">				
				<div id="init">
					<ul class="list">
						<c:forEach items="${products}" var="p" varStatus="i">
							<li class="s_item" index="${i.index + 1}">
								<div class="simg"><img src="${p.imgs}"/></div>
								<div class="s_desc">
									<div class="s_ch">${p.name}</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>				
			</div>
        </article>
        
        <!-- 视图2 -->
		<article id="main-content-2" style="position:relative;width:0;left:100%;top:0px;display:none;">
			<div id="view-info-2" class="view-info">总共${count}个产品，点击右侧图标切换视图<span onclick="changeView(1)" class="view-icon-2"></span></div>
			<div class="view2-main">
			<c:forEach items="${products}" var="p" varStatus="i">
				<c:choose>
					<c:when test="${i.index%2==0}">
						<div class="view2-row">
						<div style="width:49%;" class="view2-cell">
						<img src="${p.imgs}" />
						<div style="width:100%;text-align:center;height:44px;">
							<div style="font-size:12px;">${p.name}</div>
							<div name="price" data-allpid="${p.id}" style="font-size:10px;"><c:choose><c:when test="${!empty p.products}">￥${p.products[0].price}</c:when><c:otherwise>￥${p.price}</c:otherwise></c:choose></div>
						</div>
						<div style="width:100%;min-width:157px;text-align:center;">
						<span class="button-inset" style="width:70px;display:inline-block;"><a style="font-size:11px;" cid="${catalog.id}" pid="<c:choose><c:when test="${!empty p.products}">${p.products[0].id}</c:when><c:otherwise>${p.id}</c:otherwise></c:choose>" class="button dark-grey" onclick="buynow(this)" href="javascript:void(0);">立即购买</a></span>
						<span class="button-inset" style="width:70px;display:inline-block;"><a style="font-size:11px;" cid="${catalog.id}" info-fileid="${p.fileid}" info-pid="${p.id}" class="button grey" onclick="showinfo(this)" href="javascript:javascript:void(0);">查看详情</a></span>
						</div>
						
						</div>
						<div style="width:2%;" class="view2-cell"><img style="height:70%;width:1px;margin-left:50%;" src="<%=contextPath %>/img/ui/view2-divider.png" /></div>
					
						<c:if test="${i.index==count-1}">
							<div class="view2-cell">
							&nbsp;
							</div>
							</div>
						</c:if>
					
					</c:when>
					<c:otherwise>
						<div class="view2-cell">
						<img src="${p.imgs}" />
						<div style="width:100%;text-align:center;height:44px;">
							<div style="font-size:12px;">${p.name}</div>
							<div name="price" data-allpid="${p.id}" style="font-size:10px;"><c:choose><c:when test="${!empty p.products}">￥${p.products[0].price}</c:when><c:otherwise>￥${p.price}</c:otherwise></c:choose></div>
						</div>
						<div style="width:100%;min-width:157px;text-align:center;">
						<span class="button-inset" style="width:70px;display:inline-block;"><a style="font-size:11px;" name="buynow" data-allpid="${p.id}" cid="${catalog.id}" pid="<c:choose><c:when test="${!empty p.products}">${p.products[0].id}</c:when><c:otherwise>${p.id}</c:otherwise></c:choose>" class="button dark-grey" onclick="buynow(this)" href="javascript:void(0);">立即购买</a></span>
						<span class="button-inset" style="width:70px;display:inline-block;"><a style="font-size:11px;" cid="${catalog.id}" info-fileid="${p.fileid}" info-pid="${p.id}" class="button grey" onclick="showinfo(this)" href="javascript:javascript:void(0);">查看详情</a></span>
						</div>
						</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>			
		</article>
		<jsp:include page="common-footer.jsp"></jsp:include>
	</section>
	
	<script src="<%=contextPath %>/js/jquery-1.9.1.min.js"></script>
	<script src="<%=contextPath %>/js/tool.js"></script>
	<script type="text/javascript">
	
		//changeView(2);
	
		function changeView(num){
			if(num!=arvato.viewNum){
				switch(num){
					case 1:
						$('#main-content-1').show().css({'left':'0px'});
						$('#main-content-2').hide().css({'left':'100%'});
						var fullH = $(window).height()+60;
						var h = fullH-$(document.body).height();
						if(h>0){
							$(document.body).height(fullH);
						}
						break;
					case 2:
						$('#main-content-1').hide().css({'left':0-window.innerWidth+'px'});
						$('#main-content-2').css({'left':'0px','width':window.innerWidth+'px'}).show().css('width','100%');
						$(document.body).css('height','auto');
						break;
					default:;
				}
				arvato.viewNum = num;
			}
		}
	
		function showinfo(e){
			this.onclick = null;
			var $me = $(e);
			window.location.href = '<%=contextPath %>/info/'+$me.attr('cid')+'/'+$me.attr('info-fileid');
			$me = null;
			e = null;
		}
		
		function buynow(e){
			var $me = $(e);
			var pid = $me.attr('pid');
			arvato.buyItem(pid);
			$me = null;
			e = null;
		}
		
		function onimgload(){
			var fullH = $(window).height()+60;
			var h = fullH-$(document.body).height();
			if(h>0){
				$(document.body).height(fullH);
			}
		}
	
		$(function(){
			
			// 产品总个数
			var size = $('#main-content-1 div.item').length;
			// li高度
			var cellH = 51;
			// 主图片区高度
			var part1 = 250;
			// 购物车中商品数量
			var count = parseInt(0);
			
			var $p1 = $('div[name="part1"]>div.items');
			var $init = $('#init');
			var $bg = $('#bg');
			var $p2 = $('div[name="part2"]');			
			
			var isAndroid2 = (navigator.userAgent.indexOf('Android 2')!=-1 || navigator.userAgent.indexOf('Android 4.0')!=-1?true:false);

			var obj = {
					lastY : 0,
					movedY : 0
				};
				var obj2 = {
					lastX : 0,
					movedX : 0
				};
				var touched2 = 0;				
	
				// 主图片滚动
				var moveX = parseInt(0);
				// 竖向滑动的索引
				var curr = 1;
				// 横向滑动的索引
				var currX = 1;
				
				var xMove = function(x){		
					if(x<1 && x>-1){
						
					}else{
						var step = x/8;
						if(x > 0){
							obj2.movedX += step;						
							window.setTimeout(function(){

								var bgSpeed = obj2.movedX/10;
								moveOnX(obj2.movedX,bgSpeed);

								x -= step;
								if(x > 0){
									xMove(x);
								}else{
									
								}
							},2);
						}else if(x < 0){
							obj2.movedX += step;
							window.setTimeout(function(){

								var bgSpeed = obj2.movedX/10;
								moveOnX(obj2.movedX,bgSpeed);

								x -= step;
								if(x < 0){
									xMove(x);
								}else{
									
								}
							},2);
						}else{}	
					}					
				}
				var yMove = function(y){
					if(y<1 && y>-1){
						
					}else{
						var step = y/8;
						if(y > 0){
							obj.movedY += step;						
							window.setTimeout(function(){
								$init.css({
									'-webkit-transform': 'translate(0px,'+ obj.movedY + 'px)',
									'-moz-transform': 'translate(0px,'+ obj.movedY + 'px)',							
									'-ms-transform': 'translate(0px,'+ obj.movedY + 'px)',
									'-o-transform': 'translate(0px,'+ obj.movedY + 'px)'
								});
								y -= step;
								if(y > 0){
									yMove(y);
								}else{
									
								}
							},2);
						}else if(y < 0){
							obj.movedY += step;
							window.setTimeout(function(){
								$init.css({
									'-webkit-transform': 'translate(0px,'+ obj.movedY + 'px)',
									'-moz-transform': 'translate(0px,'+ obj.movedY + 'px)',							
									'-ms-transform': 'translate(0px,'+ obj.movedY + 'px)',
									'-o-transform': 'translate(0px,'+ obj.movedY + 'px)'
								});
								y -= step;
								if(y < 0){
									yMove(y);
								}else{
									
								}
							},2);
						}else{}	
					}	
					highLight();
				}
				
				
				// 1为竖屏，0为横屏
				var screen = 1;
				// 是否为横竖屏切换时刻
				var change = 1;
				
				var resize = function(){
					var w = window.innerWidth;
					var h = window.innerHeight;
					
					$('div[name="part1"]').css({'height':'190px','width':w+'px'});
					$('div[name="part1"]>.items').css({'width':w*size+'px'});				
					$('div.item').css({'width':w+'px','height':'60px'});
					$('div.s').css({'width':w+'px'});
					$('li.s_item>.simg>img').css({'margin-top':0.015*h+'px'});
					$('div.item .bimg').css({'margin-left':(w*0.9-290)/2+'px'});
					$('li.s_item>.s_desc').css({'width':(w-300)+'px'});
					if(h/w < 1.5){
						window.setTimeout(function(){
							window.scrollTo(0, 1);
						},1);	
						$p2.css({'width':w+'px','height':(h-185)+'px'});
					}else{
						$p2.css({'width':w+'px','height':(h-190)+'px'});
					}
					
					if(w > h){
						$('.part3>.opr>img').css({'height':'60px'});
					}else{
						$('.part3>.opr>img').css({'height':w/640*100+'px'});
					}	
					obj2.movedX = -(currX - 1)*w;

					var bgSpeed = obj2.movedX/10;
					moveOnX(obj2.movedX,bgSpeed);
				}
				$(window).on('orientationchange',function(){
					window.setTimeout(resize,700);
				})
				resize();

				// 选项滚动
				var touched = 0;
	
				var goBack = function(y){
					/* 渐渐恢复原位
					window.setTimeout(function(){
						$init.css({
							'-webkit-transform': 'translate(0px,'+ y + 'px)',
							'-moz-transform': 'translate(0px,'+ y + 'px)',								
							'-ms-transform': 'translate(0px,'+ y + 'px)',
							'-o-transform': 'translate(0px,'+ y + 'px)',
						});
						if(y > 0){
							y--;
							goBack(y);
						}else{
							curr = 1;
							highLight();
						}
					},2);
					*/
					y = 0;
					$init.css({
						'-webkit-transform': 'translate(0px,'+ y + 'px)',
						'-moz-transform': 'translate(0px,'+ y + 'px)',								
						'-ms-transform': 'translate(0px,'+ y + 'px)',
						'-o-transform': 'translate(0px,'+ y + 'px)',
					});
					$('ul.list').find('li.s_item:first').css({'color':'#000'});
					curr = currX = 1;
					xMove(-obj2.movedX);
				}
				var goBack2 = function(y){
					/* 渐渐恢复原位
					window.setTimeout(function(){
						$init.css({
							'-webkit-transform': 'translate(0px,'+ y + 'px)',
							'-moz-transform': 'translate(0px,'+ y + 'px)',								
							'-ms-transform': 'translate(0px,'+ y + 'px)',
							'-o-transform': 'translate(0px,'+ y + 'px)',
						});
						if(y < -cellH*(size-1)){
							y++;
							goBack2(y);
						}else{
							obj.movedY = -cellH*(size-1);
							highLight();
						}
					},2);
					*/
					y = -cellH*(size-1);
					$init.css({
						'-webkit-transform': 'translate(0px,'+ y + 'px)',
						'-moz-transform': 'translate(0px,'+ y + 'px)',								
						'-ms-transform': 'translate(0px,'+ y + 'px)',
						'-o-transform': 'translate(0px,'+ y + 'px)',
					});
					obj.movedY = -cellH*(size-1);
					highLight();
					curr = currX = size;
				}
				
				var adjust = function(y){
					if(y > 0){
						window.setTimeout(function(){
							obj.movedY++;
							$init.css({
								'-webkit-transform': 'translate(0px,'+ obj.movedY + 'px)',
								'-moz-transform': 'translate(0px,'+ obj.movedY + 'px)',							
								'-ms-transform': 'translate(0px,'+ obj.movedY + 'px)',
								'-o-transform': 'translate(0px,'+ obj.movedY + 'px)',
							});
							y--;
							if(y>0){
								adjust(y);
							}else{
								
							}
						},2);
					}else if(y < 0){
						window.setTimeout(function(){
							obj.movedY--;
							$init.css({
								'-webkit-transform': 'translate(0px,'+ obj.movedY + 'px)',
								'-moz-transform': 'translate(0px,'+ obj.movedY + 'px)',							
								'-ms-transform': 'translate(0px,'+ obj.movedY + 'px)',
								'-o-transform': 'translate(0px,'+ obj.movedY + 'px)',
							});
							y++;
							if(y<0){
								adjust(y);
							}else{
								
							}
						},2);
					}else{};													
				}				
				var touchStartY = 0;
				$('div[name="bgbg_s"],div[name="part2"]').on('touchstart', function(e){
					if(e.originalEvent.touches.length){
						obj.lastY = touchStartY = e.originalEvent.touches[0].pageY;
						touched = 1;						
					}
				}).on('touchmove', function(e){
					if(touched){
						var y = e.originalEvent.touches[0].pageY;
						obj.movedY += (y - obj.lastY);
						obj.lastY = y;
						$init.css({
							'-webkit-transform': 'translate(0px,'+ obj.movedY + 'px)',
							'-moz-transform': 'translate(0px,'+ obj.movedY + 'px)',								
							'-ms-transform': 'translate(0px,'+ obj.movedY + 'px)',
							'-o-transform': 'translate(0px,'+ obj.movedY + 'px)',
						});
						highLight();
					}
				}).on('touchend touchcancel', function(e){
					touched = 0;
					if(Math.abs(obj.lastY-touchStartY)>10){
						var index = 0;
						var w = window.innerWidth;
						if(obj.movedY > 0){
							goBack(obj.movedY);
							obj.movedY = 0;
							index = 1;
						}else{
							var offY = -(obj.movedY % cellH);
							index = Math.floor(-(obj.movedY-cellH)/cellH);

							if(index > (size-1)){
								goBack2(obj.movedY);
								index = size;
							}else{
								if(offY >= 30){
									index++;
									adjust(Math.ceil(offY-cellH));																																									
								}else{
									adjust(offY);
								}
							}	
							xMove(-(curr-1)*w - obj2.movedX);
							curr = index;	
						}
						descChange(index);
					}else{

					}					
				});
				$('#init .s_item').on('click', function(e){
					var $t;
					if(e.target.nodeName != 'LI'){
						$t = $(e.target).parents('li.s_item');
					}else{
						$t = $(e.target);
					}			
					if(curr != $t.attr('index')){
						currX = curr = $t.attr('index');
						yMove(-(currX-1)*cellH - obj.movedY);
						currX = curr = $t.attr('index');
						xMove(-(curr-1)*window.innerWidth - obj2.movedX);
						descChange(curr);
					}					
				});
	
				// 详细说明文字切换
				var detailShow = 0;
				var descChange = function(index){
					var $cont = $('div.content');
					var $item = $('div.item[index="'+index+'"]');
					if(detailShow){						
						$cont.fadeOut('1000',function(){
							$cont.find('div.h_en').html($item.find('div.b_en').html());
							$cont.find('div.h_ch').html($item.find('div.b_ch').html());
							//$cont.find('div.detail').html($item.attr('desc'));
							$cont.fadeIn('1000');
						});
					}else{
						$cont.find('div.h_en').html($item.find('div.b_en').html());
						$cont.find('div.h_ch').html($item.find('div.b_ch').html());
						//$cont.find('div.detail').html($item.attr('desc'));
					}									
				}
	
				// 选中产品高亮
				$('ul.list').find('li.s_item:first').css({'color':'#000'});
				var highLight = function(){
					var offY = -(obj.movedY % cellH);
					index = Math.floor(-(obj.movedY-cellH)/cellH)%size;
					if(offY >= 30){
						index += 1;
					}else{
					}
					curr = index;
					currX = index;
					// var count = Math.floor(-(obj.movedY-cellH)/(cellH*size));
					$p2.find('li.s_item').css({'color':'#666'});
					$('ul.list').find('li.s_item:eq('+(curr-1)+')').css({'color':'#000'});
					
				}				
				
				var adjustX = function(x){
					if(x<1 && x>-1){
						
					}else{
						var speed = x/8;
						if(x > 0){
							window.setTimeout(function(){
								obj2.movedX+=speed;

								var bgSpeed = obj2.movedX/10;
								moveOnX(obj2.movedX,bgSpeed);

								x -= speed;
								if(x > 0){
									adjustX(x);
								}
							},2);						
						}else if(x < 0){
							window.setTimeout(function(){
								obj2.movedX+=speed;

								var bgSpeed = obj2.movedX/10;
								moveOnX(obj2.movedX,bgSpeed);

								x-=speed;
								if(x < 0){
									adjustX(x);
								}
							},2);
						}else{}
					}					
				}

				var touchStartTime = "";
				var touchStartX = 0;
				$('div[name="part1"]').find('select[name="selProducts"],select[name="selProductsColor"]').on('touchstart',function(e){
					e.stopPropagation();
				}).on('touchmove',function(){
					return false;
				}).on('touchend touchcancel',function(e){
					e.stopPropagation();
				}).on('change',function(){
					var $me = $(this);
					if($me.attr('name')==='selProducts'){
						var $option = $me.children('option:selected');
						$me.parent().parent().find('span[name="price-txt"]').empty().html('￥'+$option.data('price'));
						$me.parent().parent().parent().find('a[pid]').attr('pid',$option.val());
						$me.parent().children('span').empty().html($option.text());
						
						var allpid = $me.data('pid');
						// 修改第2视图里的数据
						var $view2 = $('#main-content-2');
						$view2.find('a[name="buynow"][data-allpid="'+allpid+'"]').attr('pid',$option.val()).end().find('div[name="price"][data-allpid="'+allpid+'"]').empty().html('￥'+$option.data('price'));
						
						$view2 = null;
						$option = null;
					}else if($me.attr('name')==='selProductsColor'){
						var $option = $me.children('option:selected');
						$me.parent().parent().find('span[name="price-txt"]').empty().html('￥'+$option.data('price'));
						$me.parent().parent().parent().find('a[pid]').attr('pid',$option.val());
						$me.parent().children('span').empty().html('<span class="product-color" style="background-color:'+$option.data('rgb')+'}"></span>'+$option.text());
						var allpid = $me.data('pid');
						// 修改第2视图里的数据
						var $view2 = $('#main-content-2');
						$view2.find('a[name="buynow"][data-allpid="'+allpid+'"]').attr('pid',$option.val()).end().find('div[name="price"][data-allpid="'+allpid+'"]').empty().html('￥'+$option.data('price'));
						
						$view2 = null;
						$option = null;
					}else{
					}
					$me = null;
				}).end().on('touchstart', function(e){
					if(e.originalEvent.touches.length){
						touchStartX = obj2.lastX = e.originalEvent.touches[0].pageX;
						touched2 = 1;		
						touchStartTime = new Date().getTime();				
					}
				}).on('touchmove', function(e){
					if(e.originalEvent.touches.length){
						var x = e.originalEvent.touches[0].pageX;
						obj2.movedX += (x - obj2.lastX);
						obj2.lastX = x;

						var bgSpeed = obj2.movedX/10;
						moveOnX(obj2.movedX,bgSpeed);

					}
				}).on('touchend touchcancel',function(e){
					var className = $(e.target).attr('class');
					if((Math.abs(touchStartX-obj2.lastX)<10)
						&& (className == 'detail' 
						|| className == 'price' 
						|| className == 'buy'
						|| className == 'bi')
						&& detailShow == 0){
						detailShow = 2;
						$('.part0').animate({height:(part1+40)+'px'},400,function(){
							$('.part0').animate({height:(part1-10)+'px'},200,function(){
								$('.part0').animate({height:part1+'px'},300,function(){
									$('div.part0>div.content').fadeIn('1000',function(){
										detailShow = 1;
										try{
											arvatoTracker._trackOpr("detail",$(e.target).parents('div.item').attr('iid'),"");
										} catch(err) {}
									});
								});
							});
						});
					}else{
						var touchEndTime = new Date().getTime();
						var w = window.innerWidth;
						var maxR = -w * (size-1);
						if(touchEndTime - touchStartTime < 1200 && Math.abs(touchStartX-obj2.lastX)>10){	
							
							if(obj2.lastX - touchStartX > 0){
								// 向右滑动
								if(currX > 1){
									xMove(-(currX-2)*w - obj2.movedX);
									yMove(-(currX-2)*cellH - obj.movedY);
									currX--;
								}else{
									obj2.movedX = 0;

									var bgSpeed = obj2.movedX/10;
									moveOnX(obj2.movedX,bgSpeed);

								}	
								descChange(currX);
							}else{
								// 向左滑动
								if(currX < size){
									xMove(-(currX)*w - obj2.movedX);
									yMove(-(currX)*cellH - obj.movedY);
									currX++;
								}else{				
									obj2.movedX = maxR;
									var bgSpeed = obj2.movedX/10;
									moveOnX(obj2.movedX,bgSpeed);
								}	
								descChange(currX);
							}
							
						}else{
							var speed = 0.7;
							if(obj2.movedX>0){
								obj2.movedX = 0;
								var bgSpeed = obj2.movedX/10;
								moveOnX(obj2.movedX,bgSpeed);
							}else if(obj2.movedX < maxR){
								obj2.movedX = maxR;
								var bgSpeed = obj2.movedX/10;
								moveOnX(obj2.movedX,bgSpeed);
							}else{
								var offX = -(obj2.movedX % w);	
								currX = Math.floor(-(obj2.movedX-w)/w)%size;
								if(offX >= w/2){
									currX++;
									adjustX(Math.ceil(offX-w));
								}else{
									adjustX(offX);
								}
								if('1'!=='${count}'){
									yMove(-(currX-1)*cellH - obj.movedY);
								}
							}
						}
					}
				});
				
				function moveOnX(movedX,bgSpeed){
					if(isAndroid2){
						$p1.css({
							'left':movedX+'px'
						});
						$bg.css({
							'left':bgSpeed+'px'
						});	
					}else{
						$p1.css({
							'-webkit-transform': 'translate('+movedX + 'px, 0px)',
							'-moz-transform': 'translate('+movedX + 'px, 0px)',								
							'-ms-transform': 'translate('+movedX + 'px, 0px)',
							'-o-transform': 'translate('+movedX + 'px, 0px)'
						});
						$bg.css({
							'-webkit-transform': 'translate('+bgSpeed + 'px, 0px)',
							'-moz-transform': 'translate('+bgSpeed + 'px, 0px)',								
							'-ms-transform': 'translate('+bgSpeed + 'px, 0px)',
							'-o-transform': 'translate('+bgSpeed + 'px, 0px)'
						});	
					}
				}
				
				var canMove = 0;
				
				$('#main-content-2').on('touchstart',function(){
					canMove = 1;
				}).on('touchend touchcancel',function(){
					canMove = 0;
				});
				
				$(document).on('touchmove', function(e){
					if(!canMove){
						e.preventDefault();	
					}
				});	
		});

		$(window).load(function(){
			var fullH = $(this).height()+60;
			var h = fullH-$(document.body).height();
			if(h>59){
				$(document.body).height(fullH);
			}
			setTimeout(function(){ window.scrollTo(0, 1);}, 100);
		});
	</script>
<%@include file="common-track.jsp" %>
</body>
</html>