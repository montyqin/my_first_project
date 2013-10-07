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
<meta name="description" content="KIEHL'S科颜氏手机官方网站暨网上商城">
<meta name="Keywords" content="KIEHL'S科颜氏手机官方网站暨网上商城" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>KIEHL'S科颜氏手机官方网站暨网上商城</title>

<!-- <link href="components/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="components/bootstrap/css/bootstrap-responsive.css" rel="stylesheet"> -->

<link href="<%=contextPath %>/css/common.css" rel="stylesheet">
<link href="<%=contextPath %>/css/login.css" rel="stylesheet">

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
	<script src="<%=contextPath%>/js/md5.js"></script>
	<script src="<%=contextPath%>/js/tool.js"></script>
	<script src="<%=contextPath%>/ext/js/ZHUIKit.js"></script>
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
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
		
       <div class="navbar" style="border-bottom:0px">
		     <img id="backbtn" src="img/reg/btn_back.png"/>
		   </div>
		<div id="content">
		  <div id="userhello">您好,</div>
<!-- 		  <div class="exitbtn">退出登录</div>
 -->	    </div>
 
      <jsp:include page="common-footer.jsp"></jsp:include>
	</section>
	
	<!-- <script src="components/bootstrap/js/bootstrap.min.js"></script> -->
	<script src="js/tool.js"></script>
	<script type="text/javascript">
		$(function(){
			var $w = $(window);
			var _h = Math.ceil($w.width()*641/640);
			var resizeTimer;
			var content = new Array();
			
			
			var userinfo = JSON.parse(getCookie("mmalluserinfo"));
			
			
			$("#userhello").html("欢迎您,"+userinfo["uname"]+"<br>系统在3秒后会自动跳转到首页");
			
			$('#backbtn').bind('click', function(){
				window.location.href = window.location.protocol + "//"
				+ window.location.host
				+ arvato.globalPath+"/index.html";
		    });
			
			$('.exitbtn').bind('click', function(){
				delCookie("mmallloginid");
				delCookie("mmalluserinfo");
				
				window.location.href = "<%=contextPath%>/index.jsp"; 
		    });
			
			var timeCount = 0;
			
			var autoJump = function(){
				timeCount++;
				if(timeCount>=3){
					window.location.href = "<%=contextPath%>/index.jsp"; 
				}
			}
			
			timer =  setInterval(autoJump,1000);
			
			$("#backbtn").click(function(){
				history.go(-1);
			})
			
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