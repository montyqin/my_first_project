// JavaScript Document

extend(QX,ZHViewController);

function QX(){
 
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
		
		var p1 = new ZHImgView("imgs/qx/kvdetail_01.jpg",this.view);
		p1.setWidth('100%');
		p1.img.bind('click', function(e){
			arvato.buyItem('406','np');
	    }); 
		
		var p2 = new ZHImgView("imgs/qx/kvdetail_02.jpg",this.view);
		p2.setWidth('100%');

		
		var p3 = new ZHImgView("imgs/qx/kvdetail_03.jpg",this.view);
		p3.setWidth('100%');
		p3.img.bind('click', function(e){
			arvato.buyItem('174','np');
	    });
		
		var p4 = new ZHImgView("imgs/qx/kvdetail_04.jpg",this.view);
		p4.setWidth('100%');
		p4.img.bind('click', function(e){
			arvato.buyItem('176','np');
	    });
		
		var p5 = new ZHImgView("imgs/qx/kvdetail_05.jpg",this.view);
		p5.setWidth('73%');
		p5.img.bind('click', function(e){
			arvato.buyItem('179','np');
	    });
		
		var p6 = new ZHImgView("imgs/qx/kvdetail_06.jpg",this.view);
		p6.setWidth('27%');
		p6.img.bind('click', function(e){
			goBack();
	    });
		
		var p7 = new ZHImgView("imgs/qx/kvdetail_07.jpg",this.view);
		p7.setWidth('100%');

		
		var p8 = new ZHImgView("imgs/qx/kvdetail_08.jpg",this.view);
		p8.setWidth('100%');
		p8.img.bind('click', function(e){
			arvato.buyItem('182','np');
	    });
		
		var p9 = new ZHImgView("imgs/qx/kvdetail_09.jpg",this.view);
		p9.setWidth('100%');
		p9.img.bind('click', function(e){
			arvato.buyItem('752','np');
	    });
		
		var p10 = new ZHImgView("imgs/qx/kvdetail_10.jpg",this.view);
		p10.setWidth('83.5%');
		p10.img.bind('click', function(e){
			arvato.buyItem('755','np');
	    });
		
		var p11 = new ZHImgView("imgs/qx/kvdetail_11.jpg",this.view);
		p11.setWidth('16.5%');
		p11.img.bind('click', function(e){
			goBack();
	    });
		
		var p12 = new ZHImgView("imgs/qx/kvdetail_12.jpg",this.view);
		p12.setWidth('100%');
		p12.img.bind('click', function(e){
			arvato.buyItem('747','np');
	    });
		
		var p13 = new ZHImgView("imgs/qx/kvdetail_13.jpg",this.view);
		p13.setWidth('100%');
		p13.img.bind('click', function(e){
			arvato.buyItem('746','np');
	    });
		
		var p14 = new ZHImgView("imgs/qx/kvdetail_14.jpg",this.view);
		p14.setWidth('37%');
		p14.img.bind('click', function(e){
			arvato.buyItem('749','np');
	    });
		
		var p15 = new ZHImgView("imgs/qx/kvdetail_15.jpg",this.view);
		p15.setWidth('44.5%');
		p15.img.bind('click', function(e){
			arvato.buyItem('748','np');
	    });
		
		var p16 = new ZHImgView("imgs/qx/kvdetail_16.jpg",this.view);
		p16.setWidth('18.5%');
		p16.img.bind('click', function(e){
			goBack('481','np');
	    });
	};
	
	var goBack = function(){
		window.location.href = "http://m.lancome.com.cn/lancome";
	};
     
}