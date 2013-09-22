// JavaScript Document

extend(LGWP6,ZHViewController);

function LGWP6(){
   
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
		img0.init("imgs/lgwp6/1.jpg");
		img0.img.attr("style","display: inline;");
		img0.setWidth("100%");
		img0.img.bind('click', function(){
			window.location.href = '../index.jsps';
		}); 		
		
		img1 = new ZHImg();
		img1.init("imgs/lgwp6/2.jpg");
		img1.img.attr("style","display: inline;");
		img1.setWidth("100%");


		
		this.view.append(img0.img);
		this.view.append(img1.img);

		
		
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