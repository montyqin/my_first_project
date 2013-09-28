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
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>${p["name"]}_科颜氏Kiehl's手机官方网站暨网上商城</title>
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/css/common.css" />
<style type="text/css">
html,body{
	height:auto;
	overflow-x:hidden;
}
.main-content{
	height:auto;
	padding:10px;
	border:solid 10px #ece7e1; 
}
.info {
	display: table;
	width: 100%;
}

.info-row {
	display: table-row;
}

.info-img {
	display: table-cell;
	width: 45%;
	vertical-align: top;
}

.info-img img {
	width: 100%;
}

.info-buy {
	display: table-cell;
	width: 45%;
	padding-left:10px;
	padding-top:10%;
}

.info-name {
	width: 100%;
	text-align: left;
	font-size: 1em;
	font-weight: bold;
}

.info-others {
	width: 100%;
	text-align: left;
	font-size: 1em;
}

.details
{
	position:relative;
	background: url(<%=contextPath%>/img/ui/detailbg.png) no-repeat;
	background-size: 100% 100%;
	height: 44px;
	line-height:44px;
	margin-top: 10px;
	padding:0 5px;
	font-size:20px;
}

.details-content {
	padding-bottom:10px;
}

.details-content-split {
	background:url(<%=contextPath%>/img/ui/detailsplit.png) no-repeat;
	background-position:center;
	height:4px;
	padding:10px 0;
}

.price {
	height: 30px;
	line-height: 30px;
	font-size: 1em;
	margin-bottom: 5px;
	color: #000;
	text-align: left;
}

.button-buy {
	display: block;
	background: url(<%=contextPath%>/img/ui/purchase2.png) no-repeat;
	background-size: contain;
	width: 60%;
	height: 30px;
}

.button-weibo {
	background: url(<%=contextPath%>/img/ui/weibo.png) no-repeat;
	background-position: left;
	height: 36px;
	line-height:36px;
	padding-left:40px;
}

a.select {
	border-radius: 5px;
	border: 1px solid #c8c8c8;
	text-align: left;
	width: 70px;
	height: 26px;
	line-height: 26px;
	display: inline-block;
	text-decoration: none;
	position: relative;
	font-size: 15px;
	color: #000;
}

a.select:after {
	background: linear-gradient(to bottom, #F6F6F6, #DCDCDC) repeat scroll 0
		0 transparent;
	border-left: 1px solid #C8CDD1;
	border-radius: 0 5px 5px 0;
	color: #CDCECF;
	text-shadow: 0 1px #FFFFFF;
	content: "▼";
	display: block;
	position: absolute;
	right: 0;
	top: 0;
	width: 20px;
	text-align: center;
}

a.select span {
	padding-left: 7px;
}
a.select span.capacity{
	display:inline-block;
	width:70%;
	overflow:hidden;
	word-break:keep-all;
	white-space:nowrap;
	text-overflow:ellipsis;
}
a.select span.color{
	display:inline-block;
	width:70%;
	overflow:hidden;
	word-break:keep-all;
	white-space:nowrap;
	text-overflow:ellipsis;
}
a.select select {
	text-align: center;
	opacity: 0;
	width:70px;
	height:30px;
	left: 0;
	top: 0;
	position: absolute;
	z-index: 2;
}
.product-color{
	width:5px;
	height:11px;
	display:inline-block;
	border-radius:11px 11px 11px 11px;
	margin-right:3px;
}
.info-desc{
	width:100%;
	text-align:center;
	padding-top:10px;
}
ul.menu {
	padding: 0;
	margin:0;
	list-style:none inside none;
}

ul.menu li {
	display: inline-block;
	width:70px;
	padding:0;
	margin-left:2px;
	margin-right:2px;
	height:26px;
	line-height:26px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border:1px solid #e0e0e0;
	border-bottom:none;
	text-align:center;
	font-size:12px;
	background:url(<%=contextPath%>/img/ui/tab-bg.png) repeat;
	position:relative;
	z-index:0;	
}
ul.menu li.active {
	background:#fff;
	z-index:2;
}
ul.menu li a {
	padding: 0px;
	display:inline-block;
	text-decoration: none;
	color: #000;
	width:100%;
	height:100%;
}

ul.menu li.active a {

}

.info-content {
	background:url(<%=contextPath%>/img/ui/content-bg.png) repeat;
	width: 100%;
	height:auto;
	/* max-height:300px; */
	text-align:left;
	padding-top:10px;
	padding-left:5px;
	padding-right:5px;
	display:none;
	overflow:auto;
	font-size:11px;
}

.info-content .pre{
	white-space: pre-wrap!important;
	word-wrap: break-word!important;
	*white-space:normal!important;
	margin:0;
	margin-right:5px;
}

.current {
	display:block;
	font-size:11px;
}
.comment-item{
	margin-bottom:10px;
}
.comment-info{
	display:inline-block;
	height:20px;
	line-height:20px;
	vertical-align: bottom;
}
.level{
	display:inline-block;
	float:right;
}
.level img{
	float:left;
}
.weibosharewrap{
	width:100%;
	position:relative;
	text-align:center;
	height:39px;
}
.weiboshare{
	margin-top:7px;
    border: 2px solid #cccccc;
    border-radius: 20px 20px 20px 20px;
    cursor: pointer;
    font-size: 14px;
    height: 23px;
    line-height: 23px;
    width: 79px;
    text-align:center;
    position:absolute;
    margin-left:-39px;
    left:50%;
}
.pre-comment{
    border: 2px solid #cccccc;
    border-radius: 20px 20px 20px 20px;
    cursor: pointer;
    font-size: 14px;
    height: 23px;
    line-height: 23px;
    width: 79px;
    text-align:center;
    float:right;
    margin-right:9px;
}
.add-comment-btn{
	float:right;
	margin-right:9px;
}
.add-comment{
    border: 2px solid #cccccc;
    border-radius: 20px 20px 20px 20px;
    cursor: pointer;
    font-size: 14px;
    height: 23px;
    line-height: 23px;
    width: 79px;
    text-align:center;
    float:right;
    margin-right:7px;
}
.comment-row{
	width:100%;
	margin-top:5px;
	vertical-align: baseline;
}
.common-text{
 	border: 1px solid #DDDDDD;
    border-radius: 5px 5px 5px 5px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1) inset;
    color: #999999;
    font-family: "Helvetica Neue",Helvetica,sans-serif;
    font-size:12px;
    padding: 6px;
    width: 91%;
}

.info-content {
	border:solid 10px #ece7e1;
	padding:10px;
}

.plus {
	position:absolute;
	right:5px;
	top:50%;
	margin-top:-16px;
	dislplay:inline-block;
	*display:inline;
	*zoom:1;
	background:url(<%=contextPath%>/img/ui/plus.png) no-repeat;
	width:33px;
	height:32px;
}
.minus {
	position:absolute;
	right:5px;
	top:50%;
	margin-top:-16px;
	dislplay:inline-block;
	*display:inline;
	*zoom:1;
	background:url(<%=contextPath%>/img/ui/minus.png) no-repeat;
	width:33px;
	height:32px;
}
</style>
</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
        <article id="main-content" class="main-content">
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
						<div>
							<a cid="${catalog.id}" pid="<c:choose><c:when test="${!empty p.products}">${p.products[0].id}</c:when><c:otherwise>${p.id}</c:otherwise></c:choose>"
								class="button-buy" onclick="buynow(this)" href="javascript:void(0);"></a>
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
        </article>
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