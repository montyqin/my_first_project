// JavaScript Document

extend(FreeThree,ZHViewController);

function FreeThree(){
   
	var domain = '/lancome';
	var domain2 = window.location.protocol + "//"
	+ window.location.host
	+ "/handy";
	
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
	
		img0 = new ZHImg();
		img0.init("imgs/freethree/p1.jpg");
		img0.img.attr("style","display: inline;");
		img0.setWidth("100%");
		
		img1 = new ZHImg();
		img1.init("imgs/freethree/p2.jpg");
		img1.img.attr("style","display: inline;");
		img1.setWidth("100%");
		img1.img.bind('click', function(e){
			arvato.buyItem('635|636|637','np');
		}); 

		
		img2 = new ZHImg();
		img2.init("imgs/freethree/p3.jpg");
		img2.img.attr("style","display: inline;");
		img2.setWidth("100%");

		
		img3 = new ZHImg();
		img3.init("imgs/freethree/p4.jpg");
		img3.img.attr("style","display: inline;");
		img3.setWidth("100%");

		
		img4 = new ZHImg();
		img4.init("imgs/freethree/p5.jpg");
		img4.img.attr("style","display: inline;");
		img4.setWidth("100%");

		
		this.view.append(img0.img);
		this.view.append(img1.img);
		this.view.append(img2.img);
		this.view.append(img3.img);
		this.view.append(img4.img);
		
		
		scalePage();
	};
	
	
     
}