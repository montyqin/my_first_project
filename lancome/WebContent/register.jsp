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
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>KIEHL'S科颜氏手机官方网站暨网上商城</title>
<link href="<%=contextPath %>/css/common.css" rel="stylesheet">
<link href="<%=contextPath %>/css/login.css" rel="stylesheet">
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
		     <img id="backbtn" src="img/ui/btn_back.png"/>
		   </div>
		   <div style="width:90%;margin-left:7%;">请填写以下信息成为我们的注册会员,注册邮箱成为您的登陆信息。<br>请正确填写邮箱地址,以确保您能及时登陆</div>
		   <div id="content" style="margin-top:30px">
		   <div class="inputhint">邮箱*:<br/><input class="registerfield" id="mailfield" type="text" class="tips" value="" /></div>
		  <div class="inputhint">密码*:<br/><input class="registerfield" id="passwordfield" type="password" class="tips" value="" /></div>
		  <div class="inputhint">确认密码*:<br/><input class="registerfield" id="confirmpasswordfield" type="password" class="tips" value="" /></div>
		  <div class="inputhint">姓名*:<br/><input class="registerfield" id="namefield" type="text" class="tips" value="" /></div>
		  <div class="inputhint">手机*:<br/><input class="registerfield" id="tel" type="text" class="tips" value="" /></div>
		  <div style="margin-left:7%;font-size:10px;">*为必填项</div>
		   <img class="registerbtn" src="img/ui/btn_confirm_reg.png" style="width:50%;margin-left:25%"/>
		  </div>
		  
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
			
			
            var parameter = getURLParameter();
			
			var url = window.location.protocol + "//"
			+ window.location.host
			+ arvato.globalPath,
			url2 = window.location.protocol + "//"
			+ window.location.host
			+ "/handy";
			
			var submitting = false;
	
			var resize = function(){	
				
			};
			$(window).bind('resize',function(){
				resize();
			});
	
			
			$('.registerbtn').bind('click', function(){
				if(!submitting){
					   if($('#passwordfield').val() != $('#confirmpasswordfield').val()){   
						   alert("两次输入的密码不一致");
					   }else if($('#passwordfield').val().length<6 || $('#passwordfield').val().length>13){
						   alert("密码长度请保持在6-12位");
					   }else if($('#namefield').val() == "姓名*" || $('#namefield').val().length<1){
						   alert("请输入您的姓名");
					   }else if(!arvato.isTel($('#tel').val())){
						   alert("请输入正确的手机号码");
					   }else if(!arvato.isEmail($('#mailfield').val())){
						   alert("请输入正确的邮箱地址");
					   }else{
						   var username = $('#namefield').val();
							var sign = "email="+$('#mailfield').val()+"&pwd="+$('#passwordfield').val()+"&uname="+username+"&mobile="+$('#tel').val()+"2505307234334bb08fa0c855a8933ab0";
							var data = "email="+$('#mailfield').val()+"&pwd="+$('#passwordfield').val()+"&uname="+username+"&mobile="+$('#tel').val()+"&birthday=19840101&gender=1&subscription=1&sign="+hex_md5(sign);
							
							console.log("debug");
							 submitting = true;
							$.ajax({
								"url":"/httpProxy/ajaxproxy/?url="+window.encodeURIComponent('http://user.lancome.com.cn/EcProfileMobile.aspx/Register'),
                                "data":data,
								"dataType":"json",
								"type":"post",
								"success":function(r){
									
									submitting = false;
								    
								     switch(r.result){
									case 0:
										alert("注册失败，请再试一次");
										break;
									case 1:
										
										var sign = "email="+$('#mailfield').val()+"&pwd="+$('#passwordfield').val()+"2505307234334bb08fa0c855a8933ab0";
										var data = "email="+$('#mailfield').val()+"&pwd="+$('#passwordfield').val()+"&sign="+hex_md5(sign);
										$.ajax({
											"url":"/httpProxy/ajaxproxy/?url="+window.encodeURIComponent('http://user.lancome.com.cn/EcProfileMobile.aspx/SignIn'),
											"data":data,
											"dataType":"json",
											"type":"post",
											"success":function(r){
												
												
												switch(r.result){
												case 0:
													alert("登陆失败，请再试一次");
													break;
												case 1:
													
													setCookieEncode("username",r.user.uname,10);
													setCookieEncode("mmallloginid",r.user.id,10);
													setCookieEncode('mmalluserinfo',JSON.stringify(r.user));
													if(r.user.addressList.length>0){
														setCookie("c_desc",r.user.addressList[0]["addr"],10);
													}
													if(parameter["from"]=="checklogin"){
														arvato.gotoCart();
													}else{
														 window.location.href = "<%=contextPath%>/userinfo.jsp"; 
													}	
													break;
												case 6:
													alert("用户不存在");
													break;
												case 7:
													alert("密码不正确");
													break;
												default:
													alert("网络错误,请稍后再试 "+r.result);
													break;
												}
											},
										    "error":function(r){
											}
										});
										break;
									case 2:
										alert("用户已存在");
										break;
									default:
										alert("网络错误,请稍后再试:"+r.result);
										break;
									} 
								},
							    "error":function(r){
							    	submitting = false;
							    	alert("网络错误,请稍后再试");
								}
							}); 
						}
					}
		    });
			
			
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