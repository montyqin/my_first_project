// JavaScript Document

extend(MMDay,ZHViewController);

function MMDay(){
   
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
		img0.init("imgs/catalog/miracle.jpg");
		img0.img.attr("style","display: inline;");
		img0.setWidth("100%");
		
		img1 = new ZHImg();
		img1.init("imgs/catalog/m1.jpg");
		img1.img.attr("style","display: inline;");
		img1.setWidth("100%");
		img1.img.bind('click', function(e){
			//gotobuy('474');
			gotobuy('606');
	    }); 
		
		img2 = new ZHImg();
		img2.init("imgs/catalog/m2.jpg");
		img2.img.attr("style","display: inline;");
		img2.setWidth("100%");
		img2.img.bind('click', function(e){
			//gotobuy('475');
			gotobuy('607');
	    });
		
		img3 = new ZHImg();
		img3.init("imgs/catalog/m3.jpg");
		img3.img.attr("style","display: inline;");
		img3.setWidth("100%");
		img3.img.bind('click', function(e){
			//gotobuy('478');
			gotobuy('608');
	    }); 
		
		img4 = new ZHImg();
		img4.init("imgs/catalog/m4.jpg");
		img4.img.attr("style","display: inline;");
		img4.setWidth("100%");
		img4.img.bind('click', function(e){
			//gotobuy('476');
			gotobuy('604');
	    }); 
	    
	  img5 = new ZHImg();
		img5.init("imgs/catalog/m5.jpg");
		img5.img.attr("style","display: inline;");
		img5.setWidth("100%");
		img5.img.bind('click', function(e){
			//gotobuy('477');
			gotobuy('605');
	    }); 
		
		this.view.append(img0.img);
		this.view.append(img1.img);
		this.view.append(img2.img);
		this.view.append(img3.img);
		this.view.append(img4.img);
		this.view.append(img5.img);
		
		
		scalePage();
	};
	
	var gotobuy = function(id){
		console.log('buy');
		
		$.ajax({
			url:domain2+'/mmall/itemedit.html',
			type:'post',
			dataType:'json',
			data:{"opr":"edit","products":id},
			success:function(r2){						
				if(r2.ret && r2.ret == '00'){
					arvato.setFirstUrlHome();
					arvato.setIndexPage(window.location.protocol + "//"
							+ window.location.host
							+ domain);
					window.location.href = domain2 +"/mmall/cart.html?f=np&fp=1&c=1&id="+id;
				}else{
					alert('添加购物车失败，请稍后再试');
				}
			},
			error:function(){
				alert('网络错误，请稍后再试');
			}
		});
	};
	
	var goback = function(){
		window.location.href = window.location.protocol + "//"+ window.location.host+ domain;
	};
     
}