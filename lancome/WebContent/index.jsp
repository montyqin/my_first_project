<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	//String f = request.getParameter("f");
%>
<!DOCTYPE html>
<%-- <html manifest="manifest/indexAppCache.manifest">  --%>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="兰蔻Lancome手机官方网站暨网上商城">
<meta name="Keywords" content="兰蔻Lancome手机官方网站暨网上商城" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>兰蔻Lancome手机官方网站暨网上商城</title>

<!-- <link href="components/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="components/bootstrap/css/bootstrap-responsive.css" rel="stylesheet"> -->

<link href="<%=contextPath %>/css/common.css" rel="stylesheet">
<style type="text/css">
html,body{
	height:auto;
}
body{
	background-color:#fcfcfc;
}
@keyframes topbar-r{
		50%{
			margin-right:5px;
		}
		100%{
			margin-right:10px;
		}
}
@-webkit-keyframes topbar-r{
		50%{
			margin-right:5px;
		}
		100%{
			margin-right:10px;
		}
}
@-moz-keyframes topbar-r{
		50%{
			margin-right:5px;
		}
		100%{
			margin-right:10px;
		}
}
@-o-keyframes topbar-r{
		50%{
			margin-right:5px;
		}
		100%{
			margin-right:10px;
		}
}
@-ms-keyframes topbar-r{
		50%{
			margin-right:5px;
		}
		100%{
			margin-right:10px;
		}
}
.topbar-l{
	background: url("<%=contextPath%>/img/ui/index-topbar-l.jpg") no-repeat scroll 0 0 transparent;
	height:35px;
	width:28px;
	float:left;
	border:none;
	
}
.topbar-r{
	float:right;
	width:6px;
	height:11px;
	background:url("<%=contextPath%>/img/ui/arrow-r.png") no-repeat scroll;
	margin-right:10px;
	margin-top:12px;
 	animation: topbar-r 1s linear 0s infinite normal;
	-webkit-animation: topbar-r 1s linear 0s infinite normal;
	-moz-animation: topbar-r 1s linear 0s infinite normal;
	-o-animation: topbar-r 1s linear 0s infinite normal;
	-ms-animation: topbar-r 1s linear 0s infinite normal;
}
.topbar{
	float:left;
	height:35px;
	width:100%;
	background: url("<%=contextPath%>/img/ui/index-topbar.jpg") repeat-x scroll 0 0 transparent;
	text-align:center;
	position:relative;
}
.topbar-title{
	position:absolute;
	width:100%;
	color:#000;
	font-size:12px;
	height:35px;
	line-height:35px;
}
.topbar-title a{
	color:#fff;
	text-decoration: none;
}

.wrapper {
	width:100%;
	/* width: 320px;*/
	background: #ffffff;
	/*padding-top: 43px;*/
	overflow: hidden;
	/*min-height: 480px;*/
	margin:0;
}

#rotating-item-wrapper {
	float: left;
	width: 100%;
}
#rotating-item-wrapper a img {
	height: auto;
	width: 100%;
}

#rotating-item-wrapper #nav {
	width: 100%;
	text-align: center;
	top:290px;
	margin-left:50%;
	position:absolute;
	z-index:9;
}

#rotating-item-wrapper #nav a {
	height: 8px;
	width: 8px;
 	background: none repeat scroll 0 0 #DDDDDD;
	margin-right: 4px;
	border-radius: 4px 4px 4px 4px;
    text-indent: -100000px;
	display: block;
	float: left;
	overflow:hidden;
}
#rotating-item-wrapper #nav  a.activeSlide {
	background: none repeat scroll 0 0 #888888;
}
#rotating-item-wrapper #previous {
	position: absolute;
	top:0px;
	left:0px;
	width: 20px;
	background: #000000;
	opacity: 0.7;
	z-index: 100;
	height: 84%;
}

#rotating-item-wrapper #next {
	position: absolute;
	top:0px;
	right:0px;
	width: 20px;
	background: #000000;
	opacity: 0.7;
	z-index: 100;
	height: 84%;
}

#rotating-item-wrapper #next  a {
	/* background: url("<%=contextPath%>/img/ui/right-w-arrow.png") no-repeat  3px 50%; */
	display: block;
	height: 100%;
}

#rotating-item-wrapper #previous  a {
	/* background: url("<%=contextPath%>/img/ui/left-w-arrow.png") no-repeat 3px 50%; */
	display: block;
	height: 100%;
}
.main-footer{
	width:100%;
	display:table;
	margin:0;
	padding:0;
}
/* @-moz-document url-prefix()
{.main-footer { top:-1px; }} */

.footer-row{
	display:table-row;
}
.footer-row > div{
	display:table-cell;
	width:25%;
	vertical-align: top;
}
</style>
	<script src="<%=contextPath%>/js/index-img.js"></script>
	<script src="<%=contextPath%>/js/jquery-1.9.1.min.js"></script>
	<script src="<%=contextPath%>/js/index.js"></script>
	<script type="text/javascript">
		if(navigator.userAgent.indexOf('UCWEB')!=-1){
			alert('UC浏览器的极速模式下由于会经过UC服务器压缩处理可能会影响网站外观，关闭后可完整体验');
		}
		if(!navigator.cookieEnabled){
			alert('您的浏览器未开启cookie，将无法正常购物，请开启后再来，谢谢您的关注');
		}
		if(!!navigator.userAgent.match(/AppleWebKit.*Mobile.*/)||!!navigator.userAgent.match(/AppleWebKit/)||navigator.userAgent.indexOf('Linux')>-1){
			
		}else{
			window.location.replace('http://www.lancome.com.cn/lancome/_zh/_cn/index.aspx');
		}
	</script>
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
		<div style="margin:0;padding:0;">
			<div class="nav-border"><div class="nav-border-l"></div><div class="nav-border-r"></div></div>
			<nav id="topbar" class="topbar">
				<!-- <div class="topbar-l"></div> -->
				<div class="topbar-title">幸福臻礼 兰蔻新立体塑颜全系升级</div>
				<i class="topbar-r">&nbsp;</i>
			</nav>
			<div class="nav-border"><div class="nav-border-l"></div><div class="nav-border-r"></div></div>
		</div>
        <article id="main-content">
        	<div id="wrapper">
		      <div id="rotating-item-wrapper">
<!-- 			      <a href="javascript:void(0);"><img class="rotating-item swipe" alt="" src="img/index/hslanding.jpg" /></a>
			      <a href="javascript:void(0);"><img class="rotating-item swipe" alt="" src="img/index/mar_4.jpg" /></a>
			      <a href="javascript:void(0);"><img class="rotating-item swipe" alt="" src="img/index/0428_50ml_landingpage.jpg" /></a>
			      <a href="javascript:void(0);"><img class="rotating-item swipe" alt="" src="img/index/mlrs_lp.jpg" /></a>
			      <a href="javascript:void(0);"><img class="rotating-item swipe" alt="" src="img/index/xiaoheiping_5_1.jpg" /></a>
			      <a href="javascript:void(0);"><img class="rotating-item swipe" alt="" src="img/index/mothersday.jpg" /></a> -->
			
			      <div id="nav"></div>
			      <div id="next" style="opacity: 1;display:none"><a id="nextBt" href="#"></a></div>
			      <div id="previous" style="opacity: 1;display:none"><a id="prevBt" href="#"></a></div>
 			</div>
 			</div>
 			
 			<div style="clear:both;height:0px;width:0px;"></div>
 			<div id="main-footer" class="main-footer" style="display:none">
				<div class="footer-row">
					<div>
						<img style="width:100%" data-num="1" data-cache="img1" src="" />
					</div>
					<div>
						<img style="width:100%" data-num="2" data-cache="img2" src="" />
					</div>
					<div>
						<img style="width:100%" data-num="3" data-cache="img3" src="" />
					</div>
					<div>
						<img style="width:100%" data-num="4" data-cache="img4" src="" />
					</div>
				</div>
 			</div>     
        </article>
        
	</section>
	
	<!-- <script src="components/bootstrap/js/bootstrap.min.js"></script> -->
	<script src="js/tool.js"></script>
	<script type="text/javascript">
		$(function(){
			
			var indexImgFolder = 'img/index/',$wrapper = $('#rotating-item-wrapper');
			
			/************************************************************************
			 *                         ****** 基本配置 *******
			 ************************************************************************
			 */
			// 定义图片列表
			var scrollImgs = ['qsfamily.jpg','mascaralp.jpg','mlrs_lp.jpg','vsnlp.jpg'];
			// 处理图片的方法
			var gotoDetialView = function(index){
				switch(index){
				    case 0:
			    	    window.location.href = "<%=contextPath%>/ext/jzqy.html?v=1";
			    	    break;
				    case 1:
		    	        window.location.href = "<%=contextPath%>/ext/glossinlove09.html?v=1";
		    	    break;
				   
					case 2:
						window.location.href = "<%=contextPath%>/ext/edv.html?v=1";
						break;
					case 3:
						window.location.href = "http://m.lancome.com.cn/vsn";
						break;
				}
			}
			// 处理菜单的方法
			var handleMenu = function(num){
				switch(num){
					case 1:
						window.location.href = '<%=contextPath%>/catalog/c1';
						break;
					case 2:
						window.location.href = '<%=contextPath%>/catalog/c4';
						break;
					case 3:
						window.location.href = '<%=contextPath%>/catalog/c2';
						break;
					case 4:
						window.location.href = '<%=contextPath%>/catalog/c3';
						break;
				}
			}
			
			var eventNameObj = {};
			
			if(jQuery.browser.mobile){
				eventNameObj['clickdown'] = 'touchstart';
				eventNameObj['clickup'] = 'touchend touchcancel';
			}else{
				eventNameObj['clickdown'] = 'mousedown';
				eventNameObj['clickup'] = 'mouseup';
			}
			
			var $w = $(window);
			var _h = Math.ceil($w.width()*641/640);
			var resizeTimer;
			var totalImg = scrollImgs.length;
			var content = new Array();
			for(var i = 0;i<scrollImgs.length;i++){
				content.push('<a href="javascript:void(0);"><img data-idx="');
				content.push(i);
				content.push('" class="rotating-item swipe" onload="resizeOnLoad();" alt="" src="');
				content.push(indexImgFolder+scrollImgs[i]);
				content.push('" /></a>');
			}
			$wrapper.prepend(content.join('')).on('click',function(e){
				var eTarget = e.target;
				if(eTarget.nodeName==='IMG'){
					var $eTarget = $(eTarget);
					gotoDetialView($eTarget.data('idx'));
					$eTarget = null;
				}
				eTarget = null;
			});
			
			$.fn.cycle.transitions.scrollHorzTouch = function($cont, $slides, opts) {
				$cont.css('overflow','hidden').width();
				opts.before.push(function(curr, next, opts, fwd) {

			                if (opts.rev)
			                fwd = !fwd;

			                positionNext = $(next).position();
			                positionCurr = $(curr).position();

			                $.fn.cycle.commonReset(curr,next,opts);
			                if( ( positionNext.left > 0 && fwd ) || ( positionNext.left <  0 && !fwd ) ){
			                    opts.cssBefore.left = positionNext.left;
			                }
			                else{
			                    opts.cssBefore.left = fwd ? (next.cycleW-1) : (1-next.cycleW);
			                }
			                if( ( positionCurr.left > 0 && fwd ) || ( positionCurr.left <  0 && !fwd ) ){
			                             opts.animOut.left = positionCurr.left;
			                }
			                else{
			                        opts.animOut.left = fwd ? -curr.cycleW : curr.cycleW;
			                }

				});
				opts.cssFirst.left = 0;
				opts.cssBefore.top = 0;
				opts.animIn.left = 0;
				opts.animOut.top = 0;
			};
			     var currenSlide = null;
			     var slideNumber = 0;
			     var currentLeft = 0;
			     var leftStart = 0;
			     var sliderExpr;
			     var slideFlag = false;

			 $('#nav').css({'top':_h-20,'left':'-'+(totalImg*12/2)+'px'});
			 $('#rotating-item-wrapper').css('height',_h).cycle({
			        fx:     'scrollHorzTouch',
			        timeout: 3000,
			        pager:  '#nav',
			        speedIn:   400,
			        speedOut:   400,
			        slideExpr: 'img',
 	        		//next:   '#nextBt',
			        //prev:   '#prevBt',
			        before: beforeSlide,
			        after: afterSlide,
			        //continuous:1,
			        startingSlide: 0
			    });


			$('#rotating-item-wrapper').swipe({ swipeMoving: function(pageX){

			        if( slideFlag ) return;
		
			        var newLeft = currentLeft-pageX;
		
			        currenSlide.css('left', newLeft+'px'  );
		
			        var $slides = $( sliderExpr, $('#rotating-item-wrapper') );
			        var scrollSlide;
		
			        nextSlideLeft =   newLeft > 0 ? newLeft - currenSlide.width(): newLeft+currenSlide.width();
			        flag = newLeft > 0 ? -1: 1;
			        scrollSlide  = slideNumber + flag;
			        if( scrollSlide < 0 || scrollSlide > ($slides.length - 1 )){
			            scrollSlide = scrollSlide < 0 ? $slides.length - 1 : 0;
			        }
		
			        $slides.eq( scrollSlide ).css('left',nextSlideLeft + 'px' );
			        $slides.eq( scrollSlide ).show();
			    },
			    swipeLeft: function(){$('#rotating-item-wrapper').cycle('next');},
			    swipeRight: function(){ $('#rotating-item-wrapper').cycle('prev');}
			});
			
			$('#topbar').on('click',function(){
				window.location.href = '<%=contextPath%>/ext/zxhl9.html';
			})

			$('#main-footer').on(eventNameObj['clickdown'],function(e){
				var eTarget = e.target;
				if(eTarget.nodeName==='IMG'){
					var $eTarget = $(eTarget);
					$eTarget.attr('src',arvato_cache[$eTarget.data('cache')+"d"].src);
					$eTarget = null;
				}
				eTarget = null;
			}).on(eventNameObj['clickup'],function(e){
				var eTarget = e.target;
				if(eTarget.nodeName==='IMG'){
					var $eTarget = $(eTarget);
					$eTarget.attr('src',arvato_cache[$eTarget.data('cache')].src);
					//handleMenu($eTarget.data('num'));
					$eTarget = null;
				}
				eTarget = null;
			}).on('click',function(e){
				var eTarget = e.target;
				if(eTarget.nodeName==='IMG'){
					var $eTarget = $(eTarget);
					handleMenu($eTarget.data('num'));
					$eTarget = null;
				}
				eTarget = null;
			});
			
			function beforeSlide( curr,next,opt){
			     sliderExpr = opt.slideExpr;
			     slideFlag = true;
			}

			function afterSlide(curr,next,opt){
			    currenSlide =  $(next);
			    slideNumber = opt.currSlide;
			    currentLeft = $(next).position().left;
			    slideFlag = false;
			}
			
			var resizeHandler = function(){
				_h = Math.ceil($(window).width()*641/640);
				$('#nav').css({'top':_h-20,'margin-left':'50%','left':'-'+(totalImg*12/2)+'px'});
				var $rotating = $('#rotating-item-wrapper');
				$rotating.cycle('destroy').children('a').remove().end().prepend(content.join('')).css('height',_h);
				var rotatingEle = $rotating[0];
				
				delete rotatingEle['cyclePause'];
				delete rotatingEle['cycleStop'];
				delete rotatingEle['cycleTimeout'];

				rotatingEle = null;

				$('#rotating-item-wrapper').cycle({
					fx:     'scrollHorzTouch',
					timeout: 3000,
					pager:  '#nav',
					speedIn:   400,
					speedOut:   400,
					slideExpr: 'img',
					//next:   '#nextBt',
					//prev:   '#prevBt',
					before: beforeSlide,
					after: afterSlide
				});
				setTimeout(function(){ window.scrollTo(0, 1); }, 100);
				resizeTimer = null;
			}
			
			var resizeEvent = 'orientationchange';
			if(navigator.userAgent.indexOf('Android 2')!=-1){
				resizeEvent = 'resize';
			}
			$w.on(resizeEvent,function(){
				window.setTimeout(resizeHandler,700);
			}).unload(function(){
				if(resizeTimer!=null){
					window.clearTimeout(resizeTimer);
					resizeTimer = null;
				}
				content.length = 0;
				content = null;
				$w = null;
				$wrapper = null;
			});
			
			$('#main-footer').find('img[data-cache]').each(function(){
				var $me = $(this);
				$me.attr('src',arvato_cache[$me.data('cache')].src);
				$me = null;
			}).end().show();
			
			arvato.setFirstUrlHome();
			arvato.setIndexPage(window.location.href);
/* 			$w.resize(function(){
				 _h = Math.ceil($w.width()*641/640);
				 
				 if(resizeTimer==null){
					 //resizeTimer = window.setTimeout(resizeHandler,600);
				 }

			}) */
			
			// 对于iphone5之前和ipad的兼容修改
			if(screen && (screen.height<560 || screen.height>1000)){
				var startY = 0,endY = 0,$section = $('body > section:first'),$d = $(document),distance=0,canMove=-1,m_distance=0,tmpTop=0;
				
				var fixDistance = 79;
				if(screen.height>1000){
					fixDistance = 190;
				}else{
					if(/(iPhone|iPod)/i.test(navigator.userAgent)){
						fixDistance = 72;
					}
				}
				
				$(document).on('touchstart',function(e){
					if(canMove===-1){
						distance = $d.height()-window.innerHeight;
						if(distance<fixDistance){
							canMove=1;
						}else{
							canMove=0;
						}
					}						
					if(e.originalEvent.touches){
						startY = e.originalEvent.touches[0].clientY;
					}
					
				}).on('touchmove',function(e){
					if(canMove===1){
						if(e.originalEvent.touches && e.originalEvent.touches.length){
							endY = e.originalEvent.touches[0].clientY;
							m_distance = endY-startY;
							tmpTop = parseInt($section.css('top'),10);
							if(isNaN(tmpTop)){
								tmpTop = 0;
							}
							tmpTop = tmpTop+m_distance;
							if(tmpTop<(0-fixDistance)){
								tmpTop = (0-fixDistance);
							}else {
								if(tmpTop>0){
									tmpTop = 0;
								}
							}
							$section.css('top',tmpTop+'px');
							startY=endY;
						}
					}
					
				})
/* 				.on('touchend touchcancel',function(){
					if(distance<57){
 						if((endY-startY)<-60){
							$section.css('top','-57px');
						}else{
							$section.css('top','0px');
						} 
						
					}
				}); */
			}
		});
		
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
		
		$(window).load(function(){
			var fullH = $(this).height()+60;
			var h = fullH-$(document.body).height();
			if(h>59){
				$(document.body).height(fullH);
			}
			setTimeout(function(){ window.scrollTo(0, 1); }, 100);
		});
		
	</script>
	
<%@include file="common-track.jsp" %>
</body>
</html>