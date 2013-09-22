// JavaScript Document

extend(FatherDayView,ZHViewController);

function FatherDayView(){
 
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
		bigImg = new ZHImgView("imgs/catalog/fd1.jpg",this.view);
		
		var p1 = new ZHImgView("imgs/catalog/fd2.jpg",this.view);
		p1.setWidth('50%');
		p1.img.bind('click', function(e){
			arvato.buyItem('480','np');
	    }); 
		var p2 = new ZHImgView("imgs/catalog/fd3.jpg",this.view);
		p2.setWidth('50%');
		p2.img.bind('click', function(e){
			arvato.buyItem('481','np');
	    });
		
		var p4 = new ZHImgView("imgs/catalog/fd4.jpg",this.view);
	};
	
	var goBack = function(){
		window.location.href = "http://mg.lancome.com.cn/lancome";
	};
     
}