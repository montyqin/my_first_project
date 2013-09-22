// JavaScript Document

extend(ZXHLView,ZHViewController);

function ZXHLView(){
 
	var bigImg = null;
	
	this.viewDidLoad = function(){		
		this.view.css("background-color","#ffffff");
		this.navbar.hide();
		this.setupView();
	};
	
	
	this.resize = function(){
       scalePage();
	};
	
	var scalePage = function(){
		
	}
	
	
	this.setupView = function(){
		bigImg = new ZHImg();
		bigImg.init("imgs/catalog/zxdetialimg.jpg");
		bigImg.img.bind('click', function(e){
			goBack();
	    }); 
		this.view.append(bigImg.img);
		
		scalePage();
	};
	
	var goBack = function(){
		window.location.href = "http://mg.lancome.com.cn/lancome";
	};
     
}