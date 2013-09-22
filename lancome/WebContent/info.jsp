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
<meta name="description" content="${p["name"]}_兰蔻Lancome手机官方网站暨网上商城" />
<meta name="Keywords" content="${p["name"]}_兰蔻Lancome手机官方网站暨网上商城" />
<meta name="author" content="arvato">
<meta name="HandheldFriendly" content="True">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<title>${p["name"]}_兰蔻Lancome手机官方网站暨网上商城</title>
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/css/common.css" />
<style type="text/css">
html,body{
	height:auto;
	overflow-x:hidden;
}
.main-content{
	height:auto;
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
	width: 50%;
	vertical-align: middle;
	padding-top:6px;
	padding-bottom:6px;
}

.info-img img {
	width: 100%;
}

.info-buy {
	display: table-cell;
	vertical-align: bottom;
}

.info-name {
	width: 100%;
	text-align: center;
	font-size: 17px;
}

.price {
	height: 30px;
	font-size: 20px;
	line-height: 30px;
	padding-left: 7px;
	margin-bottom: 5px;
	color: #000;
	text-align: left;
}

.button-inset {
	border-radius: 20px 20px 20px 20px;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 -1px 0
		rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.1);
	display: block;
	height: 30px;
	line-height: 30px;
	margin-bottom: 10px;
	padding: 3px;
	width: 117px;
}

.button-inset a {
	border-radius: 18px 18px 18px 18px;
	box-shadow: 0 100px 100px transparent inset, 0 1px 2px
		rgba(0, 0, 0, 0.8), 0 1px 0 rgba(255, 255, 255, 0.2) inset;
	color: #FFFFFF;
	display: block;
	font-size: 16px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	text-decoration: none;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
	width: 100%;
}

.button-inset a.button.dark-grey {
	background-image: linear-gradient(bottom, rgb(68, 74, 83) 0%,
		rgb(43, 50, 59) 50%, rgb(54, 62, 70) 50%, rgb(106, 112, 118) 100% );
	background-image: -o-linear-gradient(bottom, rgb(68, 74, 83) 0%,
		rgb(43, 50, 59) 50%, rgb(54, 62, 70) 50%, rgb(106, 112, 118) 100% );
	background-image: -moz-linear-gradient(bottom, rgb(68, 74, 83) 0%,
		rgb(43, 50, 59) 50%, rgb(54, 62, 70) 50%, rgb(106, 112, 118) 100% );
	background-image: -webkit-linear-gradient(bottom, rgb(68, 74, 83) 0%,
		rgb(43, 50, 59) 50%, rgb(54, 62, 70) 50%, rgb(106, 112, 118) 100% );
	background-image: -ms-linear-gradient(bottom, rgb(68, 74, 83) 0%,
		rgb(43, 50, 59) 50%, rgb(54, 62, 70) 50%, rgb(106, 112, 118) 100% );
	background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0, rgb(68, 74
		, 83) ), color-stop(0.5, rgb(43, 50, 59) ),
		color-stop(0.5, rgb(54, 62, 70) ), color-stop(1, rgb(106, 112, 118) )
		);
}

.button-inset a.button.grey:active,.button-inset a.dark-grey:active {
	/*box-shadow:0px 100px 100px rgba(0,0,0,0.2) inset,0px 1px 2px rgba(0,0,0,0.8),0px 1px 0px rgba(255,255,255,0.2) inset;*/
	color: #fff;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.5);
	background-image: linear-gradient(bottom, rgb(56, 115, 224) 0%,
		rgb(27, 59, 188) 50%, rgb(60, 85, 197) 50%, rgb(142, 157, 221) 88% );
	background-image: -o-linear-gradient(bottom, rgb(56, 115, 224) 0%,
		rgb(27, 59, 188) 50%, rgb(60, 85, 197) 50%, rgb(142, 157, 221) 88% );
	background-image: -moz-linear-gradient(bottom, rgb(56, 115, 224) 0%,
		rgb(27, 59, 188) 50%, rgb(60, 85, 197) 50%, rgb(142, 157, 221) 88% );
	background-image: -webkit-linear-gradient(bottom, rgb(56, 115, 224) 0%,
		rgb(27, 59, 188) 50%, rgb(60, 85, 197) 50%, rgb(142, 157, 221) 88% );
	background-image: -ms-linear-gradient(bottom, rgb(56, 115, 224) 0%,
		rgb(27, 59, 188) 50%, rgb(60, 85, 197) 50%, rgb(142, 157, 221) 88% );
	background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0, rgb(56,
		115, 224) ), color-stop(0.5, rgb(27, 59, 188) ),
		color-stop(0.5, rgb(60, 85, 197) ),
		color-stop(0.88, rgb(142, 157, 221) ) );
}

.button-inset a.button.grey {
	background-image: linear-gradient(bottom, rgb(190, 192, 195) 0%,
		rgb(190, 191, 194) 50%, rgb(207, 208, 210) 50%, rgb(235, 236, 236) 88%
		);
	background-image: -o-linear-gradient(bottom, rgb(190, 192, 195) 0%,
		rgb(190, 191, 194) 50%, rgb(207, 208, 210) 50%, rgb(235, 236, 236) 88%
		);
	background-image: -moz-linear-gradient(bottom, rgb(190, 192, 195) 0%,
		rgb(190, 191, 194) 50%, rgb(207, 208, 210) 50%, rgb(235, 236, 236) 88%
		);
	background-image: -webkit-linear-gradient(bottom, rgb(190, 192, 195) 0%,
		rgb(190, 191, 194) 50%, rgb(207, 208, 210) 50%, rgb(235, 236, 236) 88%
		);
	background-image: -ms-linear-gradient(bottom, rgb(190, 192, 195) 0%,
		rgb(190, 191, 194) 50%, rgb(207, 208, 210) 50%, rgb(235, 236, 236) 88%
		);
	background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0, rgb(190,
		192, 195) ), color-stop(0.5, rgb(190, 191, 194) ),
		color-stop(0.5, rgb(207, 208, 210) ),
		color-stop(0.88, rgb(235, 236, 236) ) );
	color: #000;
	text-shadow: 0px 1px 0px rgba(255, 255, 255, 0.5);
}

a.select {
	border-radius: 20px 20px 20px 20px;
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
	height:20px;
	line-height:20px;
	vertical-align: top;
	width:90px;
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
</style>

</head>
<body>
	<section>
		<jsp:include page="common-top.jsp"></jsp:include>
        <article id="main-content" class="main-content">
			<div class="info">
				<div class="info-row">
					<div class="info-img">
						<img src="${p.imgs}" />
					</div>
					<div class="info-buy">
						<c:choose>
						<c:when test="${!empty p.products}">
							<c:choose>
							<c:when test="${p.classify eq 'color' }">
							<div class="price" style="height:auto"><span style="display:block" name="price-txt">￥${p.products[0].price}</span>
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
							<div class="price"><span name="price-txt">￥${p.products[0].price}</span>
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
							<div class="price">￥${p.price}</div>
						</c:otherwise>
						</c:choose>
						<span class="button-inset"><a cid="${catalog.id}" pid="<c:choose><c:when test="${!empty p.products}">${p.products[0].id}</c:when><c:otherwise>${p.id}</c:otherwise></c:choose>" class="button dark-grey" onclick="buynow(this)" href="javascript:void(0);">立即购买</a></span>
					</div>
				</div>
			</div>   			
   			
			<div class="info-name">
				${p.name}
			</div>
			<div class="info-desc">
			
				<ul id="menu" class="menu">
					<li><a href="javascript:;" data-name="efficacy">产品功效</a></li>
					<li><a href="javascript:;" data-name="comment">用户评论</a></li>
					<c:if test="${!empty p.recommend}">
					<li><a href="javascript:;" data-name="recommend">相关推介</a></li>
					</c:if>
					<c:if test="${!empty p.offer}">
					<li><a href="javascript:;" data-name="offer">优惠信息</a></li>
					</c:if>
				</ul>
				<div class="nav-border" style="position:relative;z-index:1;top:-1px;"><div class="nav-border-l"></div><div class="nav-border-r"></div></div>
				<div name="efficacy" class="info-content">
					<div class="pre">${p.desc}</div>
					<%-- <div class="pre">${p.desc}</div> --%>
				</div>
				<div name="comment" class="info-content">
				
				
					<div name="comment-content" style="position:relative;left:0px;height:auto;margin-right:5px;">
					<div id="preComment" class="pre-comment">我要评论</div>
					<div style="clear:both;height:0px;"></div>
					<c:choose>
					<%-- 单个产品 --%>
					<c:when test="${!empty comments}">
						<c:forEach items="${comments}" var="c">
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
						</div>
						</c:forEach>
					</c:when>
					<%-- 多个产品 --%>
					<c:when test="${!empty allcomments}">
						<c:forEach items="${allcomments}" var="comments">
						<div name="comment-${comments.key}"  <c:if test="${!(!empty p.products && p.products[0].id eq comments.key)}">style="display:none"</c:if> >
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
							</div>
							</c:forEach>
						</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
				</div>
				
				
				<div name="comment-add" style="position:relative;left:100%;width:100%;display:none;height:auto;">
					<div class="add-comment-btn"><div id="viewComment" class="add-comment">返回</div><div id="addComment" class="add-comment">提交</div></div>
					<div style="clear:both;height:0px;"></div>
					<div class="comment-row">
						<input type="text" name="commentName" class="common-text" placeholder="这里填写您的用户名">
						<div style="margin-top:3px;font-size:9px;color:#aaa;">
						不填写将匿名评论
						<br />
						通过审核后PC官网和手机官网将会显示您的评论
						</div>
					</div>
					<div class="comment-row" style="height:20px;line-height:20px;">
						总体评价：
						<span id="commentLevel" class="level">
						<img data-lev="0" src="<%=contextPath %>/img/ui/star2.png">
						<img data-lev="1" src="<%=contextPath %>/img/ui/star2.png">
						<img data-lev="2" src="<%=contextPath %>/img/ui/star2.png">
						<img data-lev="3" src="<%=contextPath %>/img/ui/star2.png">
						<img data-lev="4" src="<%=contextPath %>/img/ui/star2.png">
						</span>
						<div style="font-size:9px;color:#aaa;">点击星进行评分</div>
					</div>
					<div class="comment-row">
						<textarea name="commentContent" style="height:70px;" class="common-text" type="text" placeholder="这里填写您的评论内容"></textarea>
					</div>					
				</div>
				</div>
				
				
				
				<c:if test="${!empty p.recommend}">
				<div name="recommend" class="info-content">
					${p.recommend}
				</div>
				</c:if>
				<c:if test="${!empty p.offer}">
					<div name="offer" class="info-content">
						${p.offer}
					</div>
				</c:if>
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
					$me.parent().parent().find('span[name="price-txt"]').empty().html('￥'+$option.data('price'));
					$me.parent().parent().parent().find('a[pid]').attr('pid',$option.val());
					$me.parent().children('span').empty().html($option.text());
					
					$('div[name="comment-content"]').children('div[name^="comment-"]').css('display','none').end().children('div[name="comment-'+$option.val()+'"]').css('display','block');
					
					$option = null;
				}else if($me.attr('name')==='selProductsColor'){
					var $option = $me.children('option:selected');
					$me.parent().parent().find('span[name="price-txt"]').empty().html('￥'+$option.data('price'));
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