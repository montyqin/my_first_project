// JavaScript Document

/*********************
* class extends
**********************/
function extend(Child, Parent) {
　　　　var F = function(){};
　　　　F.prototype = Parent.prototype;
　　　　Child.prototype = new F();
　　　　Child.prototype.constructor = Child;
　　　　Child.uber = Parent.prototype;
}



/*********************
* view controller
**********************/
function ZHViewController(){

}

//ZHViewController.prototype.testNum = 100;


ZHViewController.prototype.init = function(parent){	
		this.setUpView(parent);
		this.viewDidLoad();
}

ZHViewController.prototype.initWithNav = function(nav){
	    this.setUpView();
	    this.navController = nav;
		nav.pushViewController(this);
		this.viewDidLoad();
}

ZHViewController.prototype.setUpView = function(parent){
        var viewController = this;
		
		this.view=$('<div></div>');
	    this.view.attr('class','ZHView'); 
		this.view.css('width',"100%"); 
		this.view.css('height',"100%"); 

		
		this.navbar=$('<div></div>');
	    this.navbar.attr('class','ZHNavBar'); 
		this.navbar.css('width',"100%"); 
		
		
		this.title = $('<p></p>');
		this.title.attr('class','ZHBarTitle'); 
		this.title.css('width','100%'); 
		this.title.html("test");
		
		this.navbar.append(this.title);
		this.view.append(this.navbar);
		if(parent){
			parent.append(this.view);
		}
		
}

ZHViewController.prototype.viewDidLoad = function(){

}

ZHViewController.prototype.resize = function(){	
	
}

ZHViewController.prototype.setNavView = function(nav){
	this.navController = nav;
}


ZHViewController.prototype.setBackgroundImg = function(imgsrc){
		this.view.css("background-image",imgsrc);
}

ZHViewController.prototype.setNavImg = function(imgsrc){
		this.navbar.css("background-image",imgsrc);
}

ZHViewController.prototype.setNavColor = function(color){
		this.navbar.css("background-color",color);
}

ZHViewController.prototype.setTitle = function(text){
	    this.title.html(text);
}

/*ZHViewController.prototype.loadView = function(){
	
}*/


/*********************
* nav view controller
**********************/
//extend(ZHNavViewController,ZHViewController);

function ZHNavViewController(rootview){
	this.rootview = rootview;
	var views = [];
	var navViewController = this;
	
	this.init = function(){
		this.view=$('<div></div>');
		this.view.attr('class','ZHView');
		//this.view.css("display","table");
		//viewController.view.css("display","table-cell");
		//viewController.navController = this;	
	}
	
	this.setRootView = function(viewController){
		this.view=$('<div></div>');
		this.view.attr('class','ZHView');
		
	    this.view.append(viewController.view);
		viewController.navController = navViewController;
		views.push(viewController);
		
		this.rootview.append(this.view);
	}
	
	this.pushViewController = function(viewController){
		//pushView.view.css("float","right");
		//pushView.view.css("display","table-cell");
	    this.view.append(viewController.view);
		viewController.setNavView(navViewController);
		//viewController.navController = navViewController;
		views.push(viewController);
		
		this.view.css("width",window.innerWidth*views.length+"px");
		var targetX = window.innerWidth*(views.length-1);
		this.view.animate({left:"-"+targetX+"px"});
	}
	
	this.popToRootViewController = function(){
		var targetView = this.view;
		var targetX = 0;
		this.view.animate({left:"-"+targetX+"px"},"normal","swing",function(){
			for(i=views.length-1;i>0;i--){
				var popView = views.pop();
				popView.view.remove();
			}
			targetView.css("width",window.innerWidth+"px");
		});
	}
	
	this.popViewController = function(){
		var targetView = this.view;
		var popView = views.pop();
		var viewNum = views.length;
		var targetX = window.innerWidth*(viewNum-1);
		this.view.animate({left:"-"+targetX+"px"},"normal","swing",function(){popView.view.remove();targetView.css("width",window.innerWidth*viewNum+"px");});
	}
}



/*********************
* scrollview
**********************/

function ZHScrollViewController(rootview){
	this.rootview = rootview;
	var views = [];
	var scrollViewController = this;
	var animating = false;
	var autoScroll = false;
	var touchScroll = false;
	var indicatorShow = false;
	var timer = null;
	var currendIndex = 0;
	var startX = 0;
	var startY = 0;
	var endX = 0;
	var endY = 0;
	var delegate = null;
			
	this.init = function(){
		this.scrollView=$('<div></div>');
		this.scrollView.attr('class','ZHView');
		this.scrollView.css('overflow','hidden');
		this.scrollView.css("width","100%");
		this.scrollView.css("height","100%");
		this.scrollView.css("background","transparent");
		
		this.contentView = $('<div></div>');
		this.contentView.attr('class','ZHView');
		this.contentView.attr('id','contnet');
		this.contentView.css("background","transparent");
		this.contentView.css("width","100%");

		
		this.scrollView.append(this.contentView);
		if(this.rootview){
			this.rootview.append(this.scrollView);
		}
			
		this.scrollView.bind('touchmove', function(e){
			e.preventDefault();					
		});	
		
		this.scrollView.bind('touchstart', function(e){
			startX = endX = e.originalEvent.touches[0].pageX;
			startY = endY = e.originalEvent.touches[0].pageY;
			touchScroll = true;
			if(autoScroll){
				scrollViewController.stopAutoScroll();
			}
	    }).bind('touchmove', function(e){
			endX = e.originalEvent.touches[0].pageX;
			endY = e.originalEvent.touches[0].pageY;
	    }).bind('touchend', function(e){
			if(startX+20<endX){
				scrollRight();
			}else if(startX>endX+20){
				scrollLeft();
			}
	    }); 
	}
	
	this.getIndex = function(){
		return currendIndex;
	}
	
	this.setDelegate = function(_d){
		delegate = _d;
	}
	
	this.setSize = function(width,height){
		this.scrollView.css("width",width);
		this.scrollView.css("height",height);
	}
	
	this.addIndicator = function(num){
		indicatorShow = true;
		this.indicator=$('<ul></ul>');
		this.indicator.attr('id','indicator');
		for(i=0;i<num;i++){
			var point = $('<li></li>');
			if(i==0){
				point.attr("class","active");
			}
			this.indicator.append(point);
		}
		
		this.scrollView.append(this.indicator);
	}
	
	this.setIndicatorPosition = function(x,y){
		if(this.indicator){
			this.indicator.css("left",x+"px");
		    this.indicator.css("top",y+"px");
		}
	}
	
	var indicatorChange = function(currentNum,preNum){
		if(indicatorShow){
			$('#indicator').find('li:eq('+currentNum+')').attr('class','active');	
		    $('#indicator').find('li:eq('+preNum+')').attr('class','');
		}
	}
	
	this.addContent = function(view){
		view.css("position","absolute");
		views.push(view);
		
		if(views.length==1){
			this.contentView.append(view);
		}
	}
	
	
	var scrollLeft = function(){
		if(!animating){
			animating = true;
			var tempIndex = currendIndex;
		
		if(currendIndex<views.length-1){
			currendIndex++;
		}else{
			currendIndex = 0;
		}
		
		indicatorChange(currendIndex,tempIndex);
		
		views[currendIndex].css("left",window.innerWidth+"px");
		scrollViewController.contentView.append(views[currendIndex]);
			
		views[currendIndex].animate({left:"0px"},"normal","swing");
		views[tempIndex].animate({left:-window.innerWidth+"px"},"normal","swing",function(){animating=false;views[tempIndex].remove();if(delegate){delegate.scrollDidEnd(currendIndex)};if(touchScroll && autoScroll){scrollViewController.startAutoScroll(5000)}});
		}
	}
	
	var scrollRight = function(){
		if(!animating){
			animating = true;
			
			var tempIndex = currendIndex;
		
		if(currendIndex>0){
			currendIndex--;
		}else{
			currendIndex = views.length-1;
		}
			
		indicatorChange(currendIndex,tempIndex);
		views[currendIndex].css("left",-window.innerWidth+"px");
		scrollViewController.contentView.append(views[currendIndex]);
			
		views[currendIndex].animate({left:"0px"},"normal","swing");
		views[tempIndex].animate({left:window.innerWidth+"px"},"normal","swing",function(){animating=false;views[tempIndex].remove();if(delegate){delegate.scrollDidEnd(currendIndex)};if(touchScroll && autoScroll){scrollViewController.startAutoScroll(5000)}});
		}
		
	}
	
	this.startAutoScroll = function(time){
		if(timer == null){
			autoScroll = true;
		    timer =  setInterval(scrollLeft,time);
		}
	}
	
	var scrollTime = function(){
		if(!touchScroll){
			
		}	
	}
	
	this.stopAutoScroll = function(){
		window.clearInterval(timer);
		timer = null;
	}
}


/*********************
* button
**********************/

function ZHButton(x,y,width,height){
	this.width = width;
	this.height = height;
	this.x = x;
	this.y = y;
	
	
	this.init = function(){
		this.view=$('<div></div>');
	    this.view.attr('class','ZHButton'); 
		this.view.css("left",this.x+"px");
		this.view.css("top",this.y+"px");
		this.view.css("width",this.width+"px");
		this.view.css("height",this.height+"px");
		this.view.css("background-size",this.width+"px "+this.height+"px");
	}
}

ZHButton.prototype.setBackgroundImg = function(imgsrc){
		this.view.css("background-image",imgsrc);
}



/*********************
* textField
**********************/

function ZHTextField(x,y,width,height){
	this.width = width;
	this.height = height;
	this.x = x;
	this.y = y;
	
	this.init = function(){
		this.text=$('<input type="text"></input>');
	    this.text.attr('class','ZHTextField'); 
		this.text.css("left",this.x+"px");
		this.text.css("top",this.y+"px");
		this.text.css("width",this.width+"px");
		this.text.css("height",this.height+"px");
		this.text.css("border-radius",this.height/2+"px");
	}
}


/*********************
* img
**********************/

function ZHImg(){
	var zhimg = this;
	
	this.autoCenter = false;
	
	this.init = function(src,parent){
		this.tag = 0;
		this.img=$('<img></img>');
	    this.img.attr('class','ZHImg'); 
		if(src){
			this.img.attr("src",src);
		}
		this.img.hide();
		this.img.load(function(e){
			$(this).show();
			if(zhimg.autoCenter){
				$(this).css('top',(window.innerHeight/2-$(this).height()/2)+'px');
				$(this).css('left',(window.innerWidth/2-$(this).width()/2)+'px');
			}
		});
		
		if(parent){
			parent.append(this.img);
		}
	}
	
	this.setWidth = function(width){
		this.img.css("width",width);
	}
	
	this.setHeight = function(height){
		this.img.css("height",height);
	}
	
	this.addClickeEvent = function(method){
		zhimg.img.bind('click', function(e){
			method(zhimg.tag);
	    }); 
	}
}

/*********************
* imgview
**********************/

function ZHImgView(_src,_parent){
	var zhimg = this;
	var src = _src;
	var parent = _parent;
	
	this.autoCenter = false;
	
	this.init = function(){
		this.tag = 0;
		this.img=$('<img></img>');
	    this.img.attr('class','ZHImg'); 
		if(src){
			this.img.attr("src",src);
		}
		this.img.hide();
		this.img.load(function(e){
			$(this).show();
			if(zhimg.autoCenter){
				$(this).css('top',(window.innerHeight/2-$(this).height()/2)+'px');
				$(this).css('left',(window.innerWidth/2-$(this).width()/2)+'px');
			}
		});
		
		if(parent){
			parent.append(this.img);
		}
	}
	
	this.setWidth = function(width){
		this.img.css("width",width);
	}
	
	this.setHeight = function(height){
		this.img.css("height",height);
	}
	
	this.addClickeEvent = function(method){
		zhimg.img.bind('click', function(e){
			method(zhimg.tag);
	    }); 
	}
	
	this.setPosition = function(x,y){
		this.img.css('position','absolute');
		this.img.css('left',x);
		this.img.css('top',y);
	}
	
	this.setId = function(imgid){
		this.img.attr('id',imgid);
	}
	
	this.setClass = function(imgclass){
		this.img.attr('class',imgclass);
	}
	
	this.init();
}

/*********************
* alert
**********************/

function ZHAlertView(){
	var alertView = this;
	
	this.init = function(){
		this.view=$('<div></div>');
	    this.view.attr('class','ZHAlert'); 
		
		var bgView=$('<div></div>');
	    bgView.attr('class','ZHButton'); 
		bgView.css("opacity","0.5");
		bgView.css("background-color","#000");
		bgView.css("width",window.innerWidth+"px");
		bgView.css("height",window.innerHeight+"px");
		this.view.append(bgView);
		
		var bgIMG = $('<img></img>');
	    bgIMG.attr("src","img/alertBg.png");
	    bgIMG.attr('class','ZHButton'); 
		bgIMG.css("left",window.innerWidth/2-80+"px");
		bgIMG.css("top",window.innerHeight/2-100+"px");
		
		this.title = $('<p></p>');
		this.title.attr('class','ZHAlertTitle'); 
		this.title.css("left",window.innerWidth/2-80+"px");
		this.title.css("top",window.innerHeight/2-50+"px");
		this.title.html("Delete");
		
		this.confirmBtn = new ZHButton(window.innerWidth/2-65,230,136,30);
		this.confirmBtn.init();
		this.confirmBtn.setBackgroundImg("url(img/confrimBtn.png)");
		
		this.cancelBtn = new ZHButton(window.innerWidth/2-65,270,136,30);
		this.cancelBtn.init();
		this.cancelBtn.setBackgroundImg("url(img/cancelBtn.png)");
		this.cancelBtn.view.bind("click",function(e){
			 //nav.popViewController();
			 alertView.clear();
	    });
		
		this.view.append(bgIMG);
		this.view.append(this.title);
		this.view.append(this.confirmBtn.view);
		this.view.append(this.cancelBtn.view);
	}
	
	this.show = function(){
		$("body").append(this.view);
	}
	
	this.clear = function(){
		this.view.remove();
	}
}


/*********************
* tableView
**********************/

function ZHTableView(){
	var tableView = this;
	
	this.init = function(id){
		this.view=$('<div></div>');
		this.view.attr("id",id);
		this.view.attr('class','ZHTableView');
		//this.view.css('width',window.innerWidth+'px');

		
		this.scrollView=$('<div></div>');
	    this.scrollView.attr('id','scroller'); 
		
		this.ul=$('<ul></ul>');
	    this.ul.attr('id','thelist'); 
		
		this.scrollView.append(this.ul);
		this.view.append(this.scrollView);
	}
	
	this.addCell = function(cell){
		var li = $('<li></li>');
		li.append(cell);
		this.ul.append(li);
	}
	
	
	this.setBackgroundColor = function(color){
		this.view.css('background',color);
	}
	
	this.setCellHeight = function(height){
		$('#scroller>ul>li').css("height",height);
	}
}


/*********************
* utils
**********************/
function getURLParameter(){
	var urlInfo=window.location.href; 
    var intLen=urlInfo.length;  
				   
    var offset=urlInfo.indexOf("?")+1; 
    var strKeyValue=urlInfo.substr(offset,intLen); 
	var params=strKeyValue.split("&");
    var param = new Object();

	for(i=0;i<params.length;i++){
		var arrParam=params[i].split("="); 
		param[arrParam[0]] = arrParam[1];
	}
	    
	return param;
}

///设置cookie   
function setCookie(NameOfCookie, value, expiredays)   
{   
//@参数:三个变量用来设置新的cookie:   
//cookie的名称,存储的Cookie值,   
// 以及Cookie过期的时间.   
// 这几行是把天数转换为合法的日期   
  
var ExpireDate = new Date ();   
ExpireDate.setTime(ExpireDate.getTime() + (expiredays * 24 * 3600 * 1000));   
  
// 下面这行是用来存储cookie的,只需简单的为"document.cookie"赋值即可.   
// 注意日期通过toGMTstring()函数被转换成了GMT时间。   
  
document.cookie = NameOfCookie + "=" + escape(value) +   
  ((expiredays == null) ? "" : "; expires=" + ExpireDate.toGMTString());   
}   
  
///获取cookie值   
function getCookie(NameOfCookie)   
{   
  
// 首先我们检查下cookie是否存在.   
// 如果不存在则document.cookie的长度为0   
  
if (document.cookie.length > 0)   
{   
  
// 接着我们检查下cookie的名字是否存在于document.cookie   
  
// 因为不止一个cookie值存储,所以即使document.cookie的长度不为0也不能保证我们想要的名字的cookie存在   
//所以我们需要这一步看看是否有我们想要的cookie   
//如果begin的变量值得到的是-1那么说明不存在   
  
begin = document.cookie.indexOf(NameOfCookie+"=");   
if (begin != -1)      
{   
  
// 说明存在我们的cookie.   
  
begin += NameOfCookie.length+1;//cookie值的初始位置   
end = document.cookie.indexOf(";", begin);//结束位置   
if (end == -1) end = document.cookie.length;//没有;则end为字符串结束位置   
return unescape(document.cookie.substring(begin, end)); }   
}   
  
return null;   
  
// cookie不存在返回null   
}   
  
///删除cookie   
function delCookie (NameOfCookie)   
{   
// 该函数检查下cookie是否设置，如果设置了则将过期时间调到过去的时间;   
//剩下就交给操作系统适当时间清理cookie啦   
  
if (getCookie(NameOfCookie)) {   
document.cookie = NameOfCookie + "=" +   
"; expires=Thu, 01-Jan-70 00:00:01 GMT";   
}   
}  