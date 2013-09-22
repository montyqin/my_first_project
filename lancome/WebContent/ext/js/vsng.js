// JavaScript Document

extend(VSNG,ZHViewController);

function VSNG(){
   
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
	
		img0 = new ZHImgView("imgs/catalog/edv4.jpg",this.view);
		
		img0.img.bind('click', function(){
			window.location.href = '../index.jsps';
		});
		
		scalePage();
	};
	
	
	var goback = function(){
		window.location.href = window.location.protocol + "//"+ window.location.host+ domain;
	};
     
}