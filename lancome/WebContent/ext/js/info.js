// JavaScript Document

extend(InfoView,ZHViewController);

function InfoView(){
	var infoView = this;
	var titleImg = null;
	var bigImg = null;
	var tableView = null;
	var tableView = null;
	var cells = new Array();
	var cellHeight = null;
	
	
	this.viewDidLoad = function(){		
		this.view.css("background-color","#ffffff");
		this.navbar.hide();
		
		
		addTableView();
		
		this.setupBtn();
	}
	
	
	this.resize = function(){
		fixTablePosition();
		
		var width = window.innerWidth;
		var scale = width/640;
		
		bar.img.css("top",800*scale+"px");
	}
	
	
	this.setupBtn = function(){	
		titleImg = new ZHImg();
		titleImg.init("imgs/info/head.png");
		titleImg.img.css("position","absolute");
		titleImg.img.css("top","0px");
		this.view.append(titleImg.img);
		
		bar = new ZHImg();
		bar.init("imgs/info/foot_bar.jpg");
		bar.img.css("position","absolute");
		bar.img.css("z-index","100");
		bar.img.css("top","500px");
		bar.img.css("float","left");
		this.view.append(bar.img);
	}
	
	var fixTablePosition = function(){
		var width = window.innerWidth;
		var scale = width/640;
		
		cellHeight = 100;
		tableView.setCellHeight(cellHeight+"px");
		tableView.view.css("top",385*scale+"px");	
	}
	
	var addTableView = function(){
		 tableView = new ZHTableView();
	     tableView.init("catalog");
		 tableView.setBackgroundColor("#fff");
		 tableView.view.css("height","300px");
		 tableView.view.css("position","relative");

	     infoView.view.append(tableView.view);
		 
		 var imgs = ["imgs/catalog/l11.jpg","imgs/catalog/l12.jpg","imgs/catalog/l13.jpg","imgs/catalog/l14.jpg","imgs/catalog/l15.jpg"];
		 
		 
		 for(i=0;i<imgs.length;i++){
			 var cell = new ProductCell();
		     cell.init();
		     cell.id = i;
		     cell.position(0,i*100);
			 //cell.scoreLabel.html("兑换积分:"+window.giftInfo[i]["points"]);
		     //cell.title.html(giftInfo[i]["chineseName"]);
		     //cell.productImg.setBackgroundImg("url(img/"+window.giftInfo[i]["img"]+")");
			 tableView.addCell(cell.view);
		 }		
		 
		 fixTablePosition();

		// this.getGift();
	     myScroll = new iScroll($(tableView.view).attr("id"), { checkDOMChanges: false,hScrollbar:false,vScrollbar:false,momentum:false,borderExist:false,
		   /* onScrollMove: function () {
			    if(myScroll.y>0){
				   myScroll.y = -5,cellHeight;
			    }else if(myScroll.y<-5*cellHeight){
				   myScroll.y=0;
			    }
		    },	*/
			onScrollEnd: function () {
			   
		    },
			
			onTouchEnd:function(){
				console.log(myScroll.y);
				console.log(Math.floor(myScroll.y/cellHeight)*cellHeight);
				myScroll.scrollTo(0,Math.round(myScroll.y/cellHeight)*cellHeight,0);
				
				if(myScroll.y>0){
					myScroll.scrollTo(0,0,0);
				}else if(myScroll.y<-4*cellHeight){
					myScroll.scrollTo(0,-4*cellHeight,0);
				}
			}
		
		});
		
		
	}
	
	
    this.getData =  function(){
	   /* $.getJSON("http://zmouseway.com/yuesai/login.json",function(result){
            //$.each(result, function(i, field){
                //$("div").append(field + " ");
            //});
			if(result["ret"] == "0"){
				window.g = result;
				//console.log(window.g["Integral"]);
				gotoExchangeView(loginView.navController);	
			}else{
				alert("登陆失败");
			}
        });*/
    }	
}



/****************************************
* ProductCell
*
****************************************/
function ProductCell(){
	var cell = this;
	
	this.init = function(){
		
		this.id = 0;
		this.view=$('<div></div>');
        this.view.attr('class','ZHCell'); 
		this.view.css("width","100%");
		this.view.css("height","100px");

	    this.productImg =  new ZHImg();
		//$(this.view).data("img",this.productImg);
	    this.productImg.init("imgs/info/p11.png");
		this.productImg.img.css("position","absolute");
		this.productImg.img.css("top","5px");
		this.productImg.img.css("left","5px");
		this.productImg.img.css("width","80px");
		this.productImg.img.css("height","80px");
		this.productImg.img.css("background","fixed");
	    this.view.append(this.productImg.img);
		
		this.title = $('<p></p>');
		this.title.attr('class','ZHLabel');
		this.title.attr('id','title');
		this.title.css('left','96px');
		this.title.css('top','0px');
		this.title.html("羽西当归莹润透白粉底液");
		this.view.append(this.title);
		
		this.scoreLabel = $('<p></p>');
		this.scoreLabel.attr('class','ZHLabel');
		this.scoreLabel.css('left','96px');
		this.scoreLabel.css('top','48px');
		this.scoreLabel.css('font-size','12px');
		this.scoreLabel.html("兑换积分:");
		this.view.append(this.scoreLabel);
	}
	
	this.position = function(x,y){
		this.view.css("left",x+"px");
		this.view.css("top",y+"px");
	}
	
	/*this.addEvent = function(method){
		this.view.bind('click', function(e){
			
		}); 
	}*/
	/*this.productImg = $('<img></img>');
	this.productImg.attr("src","img/bg_ys.jpg");
	this.productImg.attr('class','ZHButton'); 
	this.view.append(this.productImg);*/
}
