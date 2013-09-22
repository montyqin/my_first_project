// JavaScript Document

extend(Mascaralimit,ZHViewController);

function Mascaralimit(){
   
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
	
		var head = new ZHImgView("imgs/hs/p1.jpg",this.view);
		var head2 = new ZHImgView("imgs/hs/p2.jpg",this.view);
		
		var p1 = new ZHImgView("imgs/hs/p31.jpg",this.view);	
		p1.img.bind('click', function(e){
			arvato.buyItem("609","np");
		});
		
		var p2 = new ZHImgView("imgs/hs/p32.jpg",this.view);	
		p2.img.bind('click', function(e){
			arvato.buyItem("678","np");
		});
		
		var p3 = new ZHImgView("imgs/hs/p33.jpg",this.view);	
		p3.img.bind('click', function(e){
			arvato.buyItems(["609","678"],"np",0);
		}); 
		
		var p4 = new ZHImgView("imgs/hs/p41.jpg",this.view);	
		p4.img.bind('click', function(e){
			arvato.buyItem("610","np");
		});
		
		var p5 = new ZHImgView("imgs/hs/p42.jpg",this.view);	
		p5.img.bind('click', function(e){
			arvato.buyItems(["610","679"],"np",0);
		});
		
		var p6 = new ZHImgView("imgs/hs/p43.jpg",this.view);	
		p6.img.bind('click', function(e){
			arvato.buyItem("679","np");
		}); 
		
		var p7 = new ZHImgView("imgs/hs/p51.jpg",this.view);	
		p7.img.bind('click', function(e){
			arvato.buyItem("611","np");
		});
		
		var p8 = new ZHImgView("imgs/hs/p52.jpg",this.view);	
		p8.img.bind('click', function(e){
			arvato.buyItems(["611","677"],"np",0);
		});
		
		var p9 = new ZHImgView("imgs/hs/p53.jpg",this.view);	
		p9.img.bind('click', function(e){
			arvato.buyItem("677","np");
		}); 
		
		
		var p10 = new ZHImgView("imgs/hs/p6.jpg",this.view);
		p10.img.bind('click', function(e){
			arvato.buyItem("680","np");
		});
		
		var navhead = new ZHImgView("imgs/hs/p7.jpg",this.view);

		var navBar1 = new ZHImgView("imgs/hs/tab1.jpg",this.view);	
		navBar1.img.attr("id","navbar1");
		navBar1.img.bind('click', function(e){
			changeCatalog(1);
		});
		
		var navBar2 = new ZHImgView("imgs/hs/tab2.jpg",this.view);	
		navBar2.img.attr("id","navbar2");
		navBar2.img.bind('click', function(e){
			changeCatalog(2);
		});
		
		var navBar3 = new ZHImgView("imgs/hs/tab3.jpg",this.view);	
		navBar3.img.attr("id","navbar3");
		navBar3.img.bind('click', function(e){
			changeCatalog(3);
		});
		 
		var catalog1 = $("<div></div>");
		catalog1.attr("id","catalog1");
		catalog1.attr("class","hscatalog");
		var c1p3 = new ZHImgView("imgs/hs/p91.jpg",catalog1);
		c1p3.setWidth("100%");
		c1p3.img.bind('click', function(e){
			arvato.buyItems(["609","678","708","576"],"np",0);
		});
		
		var c1p1 = new ZHImgView("imgs/hs/pp11.jpg",catalog1);
		c1p1.setWidth("50%");
		c1p1.img.bind('click', function(e){
			arvato.buyItem("678","np");
		});
		var c1p2 = new ZHImgView("imgs/hs/pp12.jpg",catalog1);
		c1p2.setWidth("50%");
		c1p2.img.bind('click', function(e){
			arvato.buyItem("708","np");
		});
		
		var c1p4 = new ZHImgView("imgs/hs/pp13.jpg",catalog1);
		c1p4.setWidth("50%");
		c1p4.img.bind('click', function(e){
			arvato.buyItem("609","np");
		});
		var c1p5 = new ZHImgView("imgs/hs/pp14.jpg",catalog1);
		c1p5.setWidth("50%");
		c1p5.img.bind('click', function(e){
			arvato.buyItem("576","np");
		});
		this.view.append(catalog1);

		
		
		var catalog2 = $("<div></div>");
		catalog2.attr("id","catalog2");
		catalog2.attr("class","hscatalog");
		
		var c2p3 = new ZHImgView("imgs/hs/p92.jpg",catalog2);
		c2p3.setWidth("100%");
		c2p3.img.bind('click', function(e){
			arvato.buyItems(["679","709","610","595"],"np",0);
		});
		
		var c2p1 = new ZHImgView("imgs/hs/pp31.jpg",catalog2);
		c2p1.setWidth("50%");
		c2p1.img.bind('click', function(e){
			arvato.buyItem("679","np");
		});
		var c2p2 = new ZHImgView("imgs/hs/pp32.jpg",catalog2);
		c2p2.setWidth("50%");
		c2p2.img.bind('click', function(e){
			arvato.buyItem("709","np");
		});
		
		var c2p4 = new ZHImgView("imgs/hs/pp33.jpg",catalog2);
		c2p4.setWidth("50%");
		c2p4.img.bind('click', function(e){
			arvato.buyItem("610","np");
		});
		var c2p5 = new ZHImgView("imgs/hs/pp34.jpg",catalog2);
		c2p5.setWidth("50%");
		c2p5.img.bind('click', function(e){
			arvato.buyItem("595","np");
		});
	
		this.view.append(catalog2);
		
		
		var catalog3 = $("<div></div>");
		catalog3.attr("id","catalog3");
		catalog3.attr("class","hscatalog");
		
		var c3p3 = new ZHImgView("imgs/hs/p93.jpg",catalog3);
		c3p3.setWidth("100%");
		c3p3.img.bind('click', function(e){
			arvato.buyItems(["677","526","611","572"],"np",0);
		});
		var c3p1 = new ZHImgView("imgs/hs/pp21.jpg",catalog3);
		c3p1.setWidth("50%");
		c3p1.img.bind('click', function(e){
			arvato.buyItem("677","np");
		});
		var c3p2 = new ZHImgView("imgs/hs/pp22.jpg",catalog3);
		c3p2.setWidth("50%");
		c3p2.img.bind('click', function(e){
			arvato.buyItem("526","np");
		});
		
		var c3p4 = new ZHImgView("imgs/hs/pp23.jpg",catalog3);
		c3p4.setWidth("50%");
		c3p4.img.bind('click', function(e){
			arvato.buyItem("611","np");
		});
		var c3p5 = new ZHImgView("imgs/hs/pp24.jpg",catalog3);
		c3p5.setWidth("50%");
		c3p5.img.bind('click', function(e){
			arvato.buyItem("572","np");
		});
	
		this.view.append(catalog3);

		//$("#catalog3").hide();
		changeCatalog(1);
	};
	
	var changeCatalog = function(id){
		$(".hscatalog").each(function() {
			$(this).hide();
		}); 
		
		$("#navbar1").attr("src","imgs/hs/tab1.jpg");
		$("#navbar2").attr("src","imgs/hs/tab2.jpg");
		$("#navbar3").attr("src","imgs/hs/tab3.jpg");
		
		$("#catalog"+id).show();
		$("#navbar"+id).attr("src","imgs/hs/tab"+id+"f.jpg");
	}
	
	
	var goback = function(){
		window.location.href = window.location.protocol + "//"+ window.location.host+ domain;
	};
     
}