var arvato = {
	orderDomain:'/handy',
	webDomain:'kiehls',
	$ : function(objName) {
		if (document.getElementById) {
			return eval('document.getElementById("' + objName + '")')
		} else {
			return eval('document.all.' + objName)
		}
	},
	isIE : navigator.appVersion.indexOf("MSIE") != -1 ? true : false,
			isEmail:function(email){
		    	invalidChars = " /;,:{}[]|*%$#!()`<>?";
		        if (email == "")
		        {
		        return false;
		        }
		        for (i=0; i< invalidChars.length; i++)
		        {
		        badChar = invalidChars.charAt(i)
		        if (email.indexOf(badChar,0) > -1) {
		        return false;
		        }
		        }
		        atPos = email.indexOf("@",1)
		        if (atPos == -1) {   return false; }
		        if (email.indexOf("@", atPos+1) != -1) {   return false; }
		        periodPos = email.indexOf(".",atPos)
		        if(periodPos == -1) {
		        return false; // and at least one "." after the "@"
		        }
		        if ( atPos +2 > periodPos) {
		        return false; // and at least one character between "@" and "."
		        }
		        if ( periodPos +3 > email.length) {   return false; }
		        return true;
		    },

		    isTel:function(str){
		    	var regu =/^[1][3,5,8][0-9]{9}$/;
		    	var re = new RegExp(regu);
		    	if (re.test(str)) {
		    	return true;
		    	}else{
		    	return false;
		    	}
		    },
	addEvent : function(l, i, I) {
		if (l.attachEvent) {
			l.attachEvent("on" + i, I)
		} else {
			l.addEventListener(i, I, false)
		}
	},
	delEvent : function(l, i, I) {
		if (l.detachEvent) {
			l.detachEvent("on" + i, I)
		} else {
			l.removeEventListener(i, I, false)
		}
	},
	readStyle : function(I, l) {
		if (I.style[l]) {
			return I.style[l]
		} else if (I.currentStyle) {
			return I.currentStyle[l]
		} else if (document.defaultView
				&& document.defaultView.getComputedStyle) {
			var i = document.defaultView.getComputedStyle(I, null);
			return i.getPropertyValue(l)
		} else {
			return null
		}
	},
	setCookie : function(c_name,val,exp_days){
		var exdate = new Date();
		exdate.setDate(exdate.getDate()+exp_days);
		document.cookie=c_name+ "=" +escape(val)+((exp_days==null) ? "" : ";path=/;expires="+exdate.toGMTString());
	},
	getCookie : function(c_name){
		var arr = document.cookie.match(new RegExp("(^| )"+c_name+"=([^;]*)(;|$)"));
     	if(arr != null) return unescape(arr[2]); return null;
	},
	canMove:0,
	doShowBuyCount:function(){
		var c_cart = this.getCookie('icybercode_cart');
		if(c_cart){
			var grp = c_cart.split('|');
			var c = 0;
			for(var i=0;i<grp.length;i++){
				c+=1;
			}
			if(c){
				$('#lancome-nav-top div[name="buy_count"]').css('display','block').children('div[name="count"]').empty().html(c);
			}else{
				$('#lancome-nav-top div[name="buy_count"]').css('display','none').children('div[name="count"]').empty();
			}
		}else{
			$('div[name="buy_count"]').css('display','none').children('div[name="count"]').empty();
		}		
	},
	showBuyCount:function(type,fun){
		if(typeof type === 'string'){
			var me = this;
			if(type=='server'){
		 		$.ajax({
					url:arvato.orderDomain+'/mmall/itemedit.html',
					type:'POST',
					dataType:'json',
					data:{"opr":"query"},
					success: function(d){
						if(d.ret=='00'){
							if(d.cookie){
								me.setCookie('icybercode_cart',d.cookie,1);
							}else{
								me.setCookie('icybercode_cart','',-1);
							}
							arvato.doShowBuyCount();
							if(typeof fun === 'function'){
								fun();
							}
							me = null;
						}
					},
					error:function(){
						me.setCookie('icybercode_cart','',0);
						me = null;
					}
		 		});
			}
		}else{
			arvato.doShowBuyCount();
		}
	},
	gotoCart:function(){
		window.location.href = window.location.href = window.location.protocol + "//"
		+ window.location.host
		//+ arvato.orderDomain +"/mmall/cart.html?fp=1&c=1&f=checklogin&id=974";
		+ arvato.orderDomain +"/mmall/cart.html?fp=1&c=1&f=np&pre=checklogin&id=974";
		
	},
	addToCart:function(_product_id,_sample_id,_color_id){
		//赠品
		if(typeof _sample_id === 'undefined'){
			if(_product_id){
				var c_cart = this.getCookie('icybercode_cart');
				if(c_cart){
					var grp = c_cart.split('|'),flag=0;
					for(var i=0;i<grp.length;i++){
						if(grp[i]==_product_id){
							flag = 1;
						}
					}
					if(!flag){
						c_cart+='|'+_product_id;
					}
					this.setCookie('icybercode_cart',c_cart,1);
				}else{
					this.setCookie('icybercode_cart',_product_id,1);
				}
			}
		}else{
			//产品*小样
			if(_product_id){
				var c_cart = this.getCookie('icybercode_cart');
				if(_sample_id && _sample_id != '-1'){
					if(c_cart){
						c_cart+='|'+_product_id+'*'+_sample_id+(typeof _color_id === 'undefined'?'':'*'+_color_id);
						this.setCookie('icybercode_cart',c_cart,1);
					}else{
						this.setCookie('icybercode_cart',_product_id+'*'+_sample_id+(typeof _color_id === 'undefined'?'':'*'+_color_id),1);
					}
				}else{
					if(c_cart){
						c_cart+='|'+_product_id;
						this.setCookie('icybercode_cart',c_cart,1);
					}else{
						this.setCookie('icybercode_cart',_product_id,1);
					}
				}
			}
		}
	},
	buyItem:function(id){

		
		$.ajax({
			url:arvato.orderDomain+'/mmall/itemedit.html',
			type:'post',
			dataType:'json',
			data:{"opr":"edit","products":id},
			success:function(r2){
				if(r2.ret && r2.ret == '00'){
					if(r2.msg && $.trim(r2.msg)!=''){
						alert(r2.msg);
					}
					arvato.setFirstUrlHome();
					arvato.setIndexPage(window.location.href);
					arvato.showBuyCount('server',function(){
						window.location.href = window.location.protocol + "//"
						+ window.location.host
						//+ arvato.orderDomain +"/mmall/cart.html?f=checklogin&fp=1&c=1&id="+id;
						+ arvato.orderDomain +"/mmall/cart.html?f=np&pre=checklogin&fp=1&c=1&id="+id;
					});
				}else{
					alert('添加购物车失败，请稍后再试');
				}
			},
			error:function(){
				alert('网络错误，请稍后再试');
			}
		});
	},
	delFromCart:function(_product_id,_sample_id,_color_id){
		if(!_product_id){
			return;
		}
		if(typeof _sample_id === 'undefined'){
			var arr = _product_id.split('*');
			if(arr.length==2){
				_product_id = arr[0];
				_sample_id = arr[1];
			}else if(arr.length==3){
				_product_id = arr[0];
				_sample_id = arr[1];
				_color_id = arr[2];
			}else{
				return;
			}
		}
		var c_cart = this.getCookie('icybercode_cart');
		if(c_cart){
			var grp = c_cart.split('|');
			var item = _product_id+'*'+_sample_id+(typeof _color_id === 'undefined'?'':'*'+_color_id);
			for(var i=0;i<grp.length;i++){
				if(grp[i]==item){
					grp[i] = '';
				}
			}
			c_cart = grp.join('|');
			this.setCookie('icybercode_cart',c_cart,1);
		}
	},
	asynCart:function(str){
		this.setCookie('icybercode_cart',str,1);
	},
	objectHasProperty:function(obj, propName){
		if (obj.hasOwnproperty){
			return obj.hasOwnproperty(propName);
		}
		else{
			return ('undefined' !== typeof obj[propName]);
		}
	},
	isEventSupported:function(eventName,testElId) {
		var el = document.getElementById(testElId),isSupported;
		//var el = document.getElementById('send_list'),isSupported;
		eventName = 'on' + eventName;
		isSupported = this.objectHasProperty(el, eventName);
		if (!isSupported) {
			el.setAttribute(eventName, 'return;');
			isSupported = typeof el[eventName] === 'function';
		}
		el = null;
		return isSupported;
	},
	isNothing:function(val) {
		if (typeof val === 'undefined' || val == null) {
			return true;
		} else {
			return false;
		}
	},
	detect:function(testEl){
		this._transitionPrefix = (window.document.documentElement.style.webkitTransition !== undefined) ? "webkitTransition"
				: (window.document.documentElement.style.MozTransition !== undefined) ? "MozTransition"
						: "transition";
		this._transformLabel = (window.document.documentElement.style.webkitTransform !== undefined) ? "webkitTransform"
				: (window.document.documentElement.style.MozTransition !== undefined) ? "MozTransform"
						: "transform";
		this._is3dSupported = !this.isNothing(testEl.style.WebkitPerspective);
		this._isCSSTransformSupported = (!this.isNothing(testEl.style.WebkitTransform)
				|| !this.isNothing(testEl.style.MozTransform) || !this.isNothing(testEl.style.transformProperty));
		this._moveOpts={"duration":"0.5s"};
		testEl = null;
	},
	ajastContent:function(){
 		var $content = $('div[name="content"]');
 		if($content.length){
 	 		var _wh = window.innerHeight;
 	 		var _ah = _wh-71;
 	 		if($content.height()<_ah){
 	 			$content.css('height',_ah+'px');
 	 			_ah = _wh = null;
 	 		}
 		}
 		$content = null;
	},
	track:function(op){
		if(window._arvato_t){
			_arvato_t._trackOpr(op,"","");
		}
	},
	setFirstUrlHome:function(){
		var me = this;
		//var urlHome = me.getCookie('url_home');
		//if(!urlHome){
		me.setCookie('url_home',window.location.href,1);
		//}
		me = null;
	},
	setIndexPage:function(indexUrl){
		var me = this;
		//var urlHome = me.getCookie('url_home');
		//if(!urlHome){
		// me.setCookie('index_page',window.location.href,1);
		me.setCookie('index_page',indexUrl,1);
		//}
		me = null;
	},
	goBackHome:function(){
		var me = this;
		var urlHome = me.getCookie('url_home');
		if(urlHome){
			window.location.href = urlHome;
		}else{
			window.location.href = '/';
		}
		me = null;
	},
	goBackIndex:function(){
		var me = this;
		var urlHome = me.getCookie('index_page');
		if(urlHome){
			window.location.href = urlHome;
		}else{
			window.location.href = '/';
		}
		me = null;
	},
	weiboShare:function(){
		_gaq.push(['_trackEvent','share','weibo','lancome',1,true]);

		var shareTitle = "我正在用手机浏览兰蔻手机官网。快捷的购物方式还能随时了解品牌活动";
		var contextPath = window.contextPath || '/lancome';
		var picUrl = encodeURIComponent(window.location.protocol+'//'+window.location.host+contextPath+'/img/info/lancome-info.png');
		window.location.href = 'http://v.t.sina.com.cn/share/share.php?url='+encodeURIComponent(window.location.href)+'&appkey=2530574100&title='+shareTitle+'&pic='+picUrl;
	},
	closeAsideMenu:function(){
		var $viewport = $(document.body).children('section,div');
		if($viewport.data('menu_opened')){
			$viewport.animate({'left':'0px'},370,function(){
				$('#lancome-menu-right').hide();
			});
			$viewport.data('menu_opened',null);
		}
		$viewport = null;
	}
};
(function(a){(jQuery.browser=jQuery.browser||{}).mobile=/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))})(navigator.userAgent||navigator.vendor||window.opera);
$(function(){
	arvato.eventNameObj = {};
	if(jQuery.browser.mobile){
		arvato.eventNameObj['clickdown'] = 'touchstart';
		arvato.eventNameObj['clickup'] = 'touchend touchcancel';
	}else{
		arvato.eventNameObj['clickdown'] = 'mousedown';
		arvato.eventNameObj['clickup'] = 'mouseup';
	}
	
	if($('#lancome-nav-top').length){
		
		$(document.body).children('section,div').css({'position':'relative','left':'0px'});
		
		var _handleNavTop = function(dataClass){
			if(dataClass==='nav-login'){
//				_gaq.push(['_trackEvent','navigate','hotlaine','lancome',1,true]);
//				window.location.href = 'tel:4008208016';
				var username = arvato.getCookie("username");
				
				if (username) {
					
					if(confirm("尊敬的"+username+" 您已登陆,是否要切换其他账号?")){
						window.location.href = window.location.protocol + "//"
						+ window.location.host
						+ "/"+arvato.webDomain 
						+ '/login.jsp';
					}
		} else {
			window.location.href = window.location.protocol + "//"
			+ window.location.host
			+ "/"+arvato.webDomain 
			+ '/login.jsp';
		}
			}else if(dataClass==='nav-bag'){
				//window.location.href = arvato.orderDomain+'/mmall/cart.html?f=checklogin&fp=1&c=1&id=132';
				window.location.href = arvato.orderDomain+'/mmall/cart.html?f=np&pre=checklogin&fp=1&c=1&id=132';
			}else if(dataClass==='nav-menu'){
				var $viewport = $(document.body).children('section,div');
				if($viewport.data('menu_opened')){
					$viewport.animate({'left':'0px'},370,function(){
						$('#lancome-menu-right').hide();
					});
					$viewport.data('menu_opened',null);
				}else{
					$('#lancome-menu-right').css({'display':'block','height':$(document).height()+$('#lancome-nav-top').height()+25+'px'});
					$viewport.animate({'left':'-125px'},370);
					$viewport.data('menu_opened',1);
				}
				$viewport = null;
			}
		}
		
		$('#lancome-nav-top').on(arvato.eventNameObj['clickdown'],function(e){
			var eTarget = e.target;
			if(eTarget.nodeName === 'SPAN'){
				var $eTarget = $(eTarget);
				var dataClass = $eTarget.data('class');
				if(dataClass){
					$eTarget.removeClass(dataClass).addClass(dataClass+'-d');
				}
				$eTarget = null;
			}
			eTarget = null;
		}).on(arvato.eventNameObj['clickup'],function(e){
			var eTarget = e.target;
			if(eTarget.nodeName === 'SPAN'){
				var $eTarget = $(eTarget);
				var dataClass = $eTarget.data('class');
				if(dataClass){
					window.setTimeout(function(){
						$eTarget.removeClass(dataClass+"-d").addClass(dataClass);
						
						if(dataClass==='nav-login'){
							//_gaq.push(['_trackEvent','navigate','hotlaine','lancome',1,true]);
							//window.location.href = 'tel:4008208016';
							
							var username = arvato.getCookie("username");
							
							if (username) {
								
								if(confirm("尊敬的"+username+" 您已登陆,是否要切换其他账号?")){
									window.location.href = window.location.protocol + "//"
									+ window.location.host
									+ "/"+arvato.webDomain 
									+ '/login.jsp';
								}
					} else {
						window.location.href = window.location.protocol + "//"
						+ window.location.host
						+ "/"+arvato.webDomain 
						+ '/login.jsp';
					}
							
						}else if(dataClass==='nav-bag'){
							//window.location.href = arvato.orderDomain+'/mmall/cart.html?f=checklogin&fp=1&c=1&id=132';
							window.location.href = arvato.orderDomain+'/mmall/cart.html?f=np&pre=checklogin&fp=1&c=1&id=132';
						}else if(dataClass==='nav-menu'){
							
							var $viewport = $(document.body).children('section,div');
							if($viewport.data('menu_opened')){
								$viewport.animate({'left':'0px'},370,function(){
									$('#lancome-menu-right').hide();
								});
								$viewport.data('menu_opened',null);
							}else{
								$('#lancome-menu-right').css({'display':'block','height':$(document).height()+$('#lancome-nav-top').height()+25+'px'});
								$viewport.animate({'left':'-125px'},370);
								$viewport.data('menu_opened',1);
							}
							$viewport = null;
							
							_gaq.push(['_trackEvent','navigate','openmenu','lancome',1,true]);

						}
						
						
						$eTarget = null;
					},300);
				}
			}else if(eTarget.nodeName === 'DIV'){
				var $eTarget = $(eTarget);
				if($eTarget.data('navid')){
/*					var navid = $eTarget.data('navid');
					if(navid==='home'){
						$eTarget.children('a:first')[0].click();
					}*/
					eTarget = null;
					return true;
				}else if($eTarget.attr('name')){
					if($eTarget.attr('name')==='count'){
						//window.location.href = arvato.orderDomain+'/mmall/cart.html?f=checklogin&fp=1&c=1&id=132';
						window.location.href = arvato.orderDomain+'/mmall/cart.html?f=np&pre=checklogin&fp=1&c=1&id=132';
					}
				}else{
				}
				$eTarget = null;
			}else{
				
			}
			eTarget = null;
			return false;
		})
		
/*		.on('click',function(e){
			var eTarget = e.target;
			if(eTarget.nodeName === 'SPAN'){
				var $eTarget = $(eTarget);
				var dataClass = $eTarget.data('class');
				if(dataClass){
					_handleNavTop(dataClass);
				}
			}
		});*/
		
		arvato.showBuyCount('server');
	}
});