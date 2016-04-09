<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    int sid = Integer.parseInt(request.getParameter("sid"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
    content="1280*720;text/html; charset=utf-8">
<title>专题影片列表</title>
<style>
* {margin:0px;padding:0px; font-family:Microsoft Yahei;}
body {
    width:1280px;
    height:720px;
    font-size: 28px;
    background-color:white;
}
ul,p,h1,h2,h3,h4,h5,h6,dl,dd,dt,button,input,marquee,table{margin: 0px; padding: 0px;}
div,li{list-style: none; list-style-type:none;}
img,p{border: 0;}
input,marquee{outline:none; border: none; border: 0; border-color: transparent;}
a{text-decoration: none; color: #ffffff}

.background {
    width: 1280px;
    height: 720px;
    left: 0px;
    top:0px;
    position: absolute;
    background-image: url(../static/epgimg/subMo_bj.jpg);
    font-size: 18px;
    color: white;
}

.button{
    position: absolute;
    top: 635px;
}

#sub_list{
	position: absolute;
	top: 95px;
	left: 42px;
}

#sub_list li{
	float: left;
	margin-right: 10px;
	padding-left: 10px;
	padding-right: 10px;
}

#erweima{ position:absolute;left:40px;top:50px; background:url(../static/epgimg/erweimakuangNew.png) no-repeat;width:1200px;height:627px;display:none }
#erweima #erweimatip{position:absolute;left:284px;top:354px;color:#fff;font-size:15px;}
#erweima #close{position:absolute;left:1130px;top:15px;}
#yanzheng{position:absolute;left:141px;top:90px;}

.PayInfo{ position: absolute; width: 860px; height: 500px; left: 300px; top: 118px; display: block;}
.qrwczf{position:absolute;    left: 660px;    top: 100px;}
.price{ position: absolute;    top: 50px;    width: 300px;    height: 43px;    line-height: 43px;    font-size: 35px; color: white; text-align: center;left:570px;}

#wxts{
	position:absolute;
	background: url(../static/epgimg/wxts.png);
	width:594px;
	height:413px;
	left:343px;
	top:150px;
}


</style>

<script type="text/javascript" src="../static/js/epgCommon.js"></script>
<script type="text/javascript" src="../static/js/epgCQ.js"></script>
</head>
<body>
    <div id="main" class="background">
    	
	    <img id='sub_img' style="position:absolute;top:83px;" src=''>
	    <div id="subjectButton" style="position: absolute;    border: none;    width: 1280px;    top: 127px;    height: 524px;">
		    <img id="ljgm" src="../static/epgimg/ljgm11111.png" style="position: absolute;   left: 900px;    top: 100px;">
			<img id="ljgm_f" src="../static/epgimg/ljgm11111_h.png" style="position: absolute;    left: 897px;   top: 97px; display:none;">
	    </div>
	    <ul id="sub_list">
    	</ul>
	    <img id="focusimg" src="../static/epgimg/picFocus.png"  style="position: absolute;left:98px;top:359px;display: none;">
	    <div id="m_list" >
	    </div>
	    
		<img id="yxry" src="../static/epgimg/yxtb_f.png" class="button" style="left:215px;"/>
		<img id="gdjc" src="../static/epgimg/gdjc.png" class="button" style="left:430px;"/>
		<img id="jjcx" src="../static/epgimg/jjcx.png" class="button" style="left:640px;"/>
		<img id="wdsf" src="../static/epgimg/wdsf.png" class="button" style="left:850px;"/>
		<img id="btnFocus" src="../static/epgimg/btnFocus.png" style="position: absolute;  top: 630px;  left: 210px; display:none;">
		
		<div id="screen"
            style="position: absolute; background: url('../static/epgimg/screen.png'); top:0px;left:0px;width: 1280px; height: 720px; display: none;">
        </div>
		
		<div id="erweima">
			<img id="close" src="../static/epgimg/close01.png"/>	
			<img src="../static/epgimg/hLine.png" style="position:absolute;left:30px;top:100px; width:1140px;height:3px;line-height:43px;font-size:25px;"/>
	
			<img id="selbg" src="../static/epgimg/selmenu.png" style="position: absolute; left: 33px; top: 112px; z-index:1;">
			<div id="alipayMenu" class="border" style="position:absolute;left:40px;top:118px; width:250px;height:52px;line-height:43px;font-size:20px;color:white;background:url(../static/epgimg/an03a.jpg);text-align:center;"></div>
			<div id="wxpayMenu" class="border" style="position:absolute;left:40px;top:170px; width:250px;height:52px;line-height:43px;font-size:20px;color:white;background:url(../static/epgimg/an02b.jpg);text-align:center;"></div>
			<div id="tips" style="background-color:#1D2089;position:absolute;left:40px;top: 222px; width:250px;height:80px;line-height: 24px;font-size:15px;color:white;text-align:center;">
			支付宝扫描支付完成后,<br>请点击【完成支付】
			</div>
	
			<div id="aliPayInfo" class="PayInfo">
				<div style="border-style: solid;position: absolute;width: 480px;   height: 480px; left: 70px;top: 0px;overflow: hidden;background: url(../static/epgimg/showPayMsg.png);">
					<img id="aliqrcode" class="qrcode" src="" style="position: absolute; width: 640px; height: 640px; left: -80px;    top: -80px;background-color: white;">
				</div>
				<img id="aliqrwczf" class="qrwczf" src="../static/epgimg/qrzf.png"/>
				<div id="aliprice" class="price" >9.9元</div>
			</div>
	
			<div id="wxPayInfo" class="PayInfo" style="display:none">
				<div style="border-style: solid;position: absolute;width: 480px; height: 480px; left: 70px;top: 0px;overflow: hidden;background: url(../static/epgimg/showPayMsg.png);">
					<img id="wxqrcode" class="qrcode" style="position: absolute; width: 600px; height: 600px; left: -60px; top: -60px;">
				</div>
				<img id="wxqrwczf" class="qrwczf" src="../static/epgimg/qrzf.png"/>
				<div id="wxprice" class="price" >10元</div>
			</div>
	
			<div ><img id="zfsb" src="../static/epgimg/zfsb.png" style="position: absolute;top: 370px;left: 350px;display:none"></div>
	</div>
	        
	<div id="wxts" style="display: none;">
		<div id="wxtsmsg"
		    style="position: absolute; color: white; left: 38px; width: 496px; text-align: center; top: 130px;">hahahaha</div>
		<img src="../static/epgimg/fh_f.png"
		    style="position: absolute; top: 261px; left: 220px;">
    </div>
    <%@ include file="quit.jsp" %>
	</div>
	<input id="sid" type="hidden" value="7">
</body>
<script type="text/javascript">
    
    var URL={
            ipaddr:ipaddress,
            movielist:"/REST/subject/movie",
            getallsubject:"/REST/subject/getallsubject",
            getCode:"/REST/order/getcode",
            getAliQrCode:"/REST/order/getaliqrcode",
            getWxQrCode:"/REST/order/getwxqrcode",
            auth:"/REST/subject/auth"
    }
    
    var id = <%=sid%>
    function getRandomMovieByCategoryId(param){
        var sunFunc=param.sunFunc;
        var failFunc=param.failFunc;
        ajax({
            url:URL.ipaddr+URL.movielist,
            data:"{\"id\":\""+id+"\"}",
            method:"post",
            handler: function(xmlHttp){
                var result = eval("("+xmlHttp.responseText+")");
                if(result.errCode==0){
                    sunFunc(result)
                }else{
                    failFunc(result);
                }
            }
        })
    };
    
    function getAllSubjects(param){
    	var sunFunc=param.sunFunc;
        var failFunc=param.failFunc;
        var data="{\"smartcardid\":\""+getCANO()+"\"}";
        ajax({
            url:URL.ipaddr+URL.getallsubject,
            data:data,
            method:"post",
            handler: function(xmlHttp){
                var result = eval("("+xmlHttp.responseText+")");
                if(result.errCode==0){
                    sunFunc(result);
                }else{
                    failFunc(result);
                }
            }
        })
    }
    
    var list ={
            index:0,
            focusIndex:0,
            size:0,
            data:[],
            init:function(){
                this.size=this.data.list.length;
                this.index=0;
                this.focusIndex=0;
                this.refresh();
            },
            refresh:function(){
                $("sub_img").src="../static/epgimg/subject/sub_"+this.data.identify+".jpg";
                $("subjectButton").src="subjectButton/subjectButton"+this.data.identify+".jsp";
                $("m_list").innerHTML=$("m_list").innerHTML+
                "<ul id='img_list'></ul>"
                for (i = 0;i<this.size;i++) {
                    $("img_list").innerHTML+="<li id='m_"+i+"' width:140px; style='position:absolute;left:"+(105+i*185)+"px;top:365px;width:140px;'></li>";
                    if(i<6){
                        $("m_"+i).style.display="block";
                    }else{
                        $("m_"+i).style.display="none";
                    } 
                    $("m_"+i).innerHTML="<img src='../static/epgimg/record/"+this.data.list[i].identify+
                    "_cate_preview.jpg'><div style='text-align:center; width:140px;' >"+this.data.list[i].name+"</div>";
                    $("m_"+i).width='140px';
                }
            },
            setFocus:function(){
                $("focusimg").style.display="block";
                $("focusimg").style.left=(parseInt($("m_"+this.index).style.left)-7)+"px";
            },
            blur:function(){
                $("focusimg").style.display="none";
            } ,
            moveLeft:function(){
                if(this.index<=0){
                    return;
                }
                this.blur();
                if(this.focusIndex==0){
                    $("m_"+(this.index+5)).style.display="none";
                    for(var i=0;i<this.size-i;i++){
                        $("m_"+(this.index+i-1)).style.left=(105+i*185)+"px";   
                    }
                    $("m_"+(this.index-1)).style.display="block";
                }
                
                if(this.focusIndex>0){
                    this.focusIndex--;
                }
                this.index--;
                this.setFocus();
            },
            moveRight:function(){
                
                if(this.index>=this.size-1){
                    return;
                }
                this.blur();
                this.index++;
                if(this.focusIndex==5){
                    $("m_"+(this.index-6)).style.display="none";
                    for(var i=0;i<this.size-i;i++){
                        $("m_"+(this.index-(5-i))).style.left=(105+i*185)+"px";
                    }
                    $("m_"+this.index).style.display="block";
                }
                if(this.focusIndex<5){
                    this.focusIndex++;
                }
                this.setFocus();
            },
            enter:function(){
            	insRecord({action:18,mediaId:this.data.list[this.index].pid});//专题影片点击
                location.href="moviedetail.jsp?pid="+this.data.list[this.index].pid;
            }
    }
    
    var sublist ={
		index:0,
		focusIndex:0,
		size:0,
		data:[],
		lis:[],
		init:function(){
			this.focusIndex=0;
			this.index=0;
		    this.size=this.data.length;
		    for(var i=0;i<this.size;i++){
		    	var li = document.createElement("li");
				li.innerHTML=this.data[i].name;
				$("sub_list").appendChild(li);
				li.style.border="solid 3px blue";
		    }
		    this.lis=$("sub_list").getElementsByTagName('li');
		    this.lis[this.index].style.backgroundColor="blue";
		},
		setFocus:function(){
			$("sub_list").innerHTML="";
			for(var i=0;i<this.size;i++){
		    	var li = document.createElement("li");
				li.innerHTML=this.data[i].name;
				$("sub_list").appendChild(li);
				li.style.border="solid 3px blue";
		    }
		    this.lis=$("sub_list").getElementsByTagName('li');
		    this.lis[this.index].style.backgroundColor="blue";
		    this.lis[this.focusIndex].style.border="solid 3px #00FFFF";
		},
		blur:function(){
			for(var i=0;i<this.size;i++){
				this.lis[i].style.border="solid 3px blue";
			}
			this.lis[this.focusIndex].style.border="solid 3px blue";	
		},
		ok:function(){
			id=this.data[this.focusIndex].id;
			this.lis[this.index].style.backgroundColor="#00052D";
			this.index=this.focusIndex;
			this.lis[this.index].style.backgroundColor="blue";
			$("m_list").innerHTML="";
			insRecord({action:19,specialid:list.data[list.index].id});//专题点击 
			getRandomMovieByCategoryId({sunFunc:function(result){
	              list.data=result;
	              list.init();
	        }});
		},
		moveRight:function(){
			if(sublist.focusIndex<sublist.size-1){
				sublist.focusIndex++;
				sublist.setFocus();
			}
		},
		moveLeft:function(){
			if(this.focusIndex>0){
				this.focusIndex--;
				this.setFocus();
			}
		}
    }
    
    /*castPayMenu aliPayMenu wxPayMenu yanzheng aliwczf wxwczf*/
    var orderid=null;
    var erweima = {
    	    status : "alipayMenu",
    	    moveRight : function(){
    	     	if(this.status == "alipayMenu"){
    				$("aliqrwczf").src = "../static/epgimg/wczfSeclect.png";
    				$("selbg").style.display = "none";
    	            this.status = "aliwczf";
    	        }else if(this.status == "wxpayMenu"){
    	            $("wxqrwczf").src = "../static/epgimg/wczfSeclect.png";
    	            $("selbg").style.display = "none";
    	            this.status = "wxwczf";
    	        }
    	    },
    	    moveLeft : function(){
    	        if(this.status == "aliwczf"){
    				$("alipayMenu").style.background="url(../static/epgimg/an03b.jpg)";
    				$("wxpayMenu").style.background="url(../static/epgimg/an02a.jpg)";
    	            $("aliqrwczf").src = "../static/epgimg/wczf.png";
    	            $("zfsb").style.display="none";
    	            $("selbg").style.display="block";
    	            this.status = "alipayMenu";
    	        }else if(this.status == "wxwczf"){
    				$("alipayMenu").style.background="url(../static/epgimg/an03a.jpg)";
    				$("wxpayMenu").style.background="url(../static/epgimg/an02b.jpg)";
    	            $("wxqrwczf").src = "../static/epgimg/wczf.png";
    	            $("zfsb").style.display="none";
    	            $("selbg").style.display="block";
    	            this.status = "wxpayMenu";
    	        }
    	    },
    	    moveDown : function(){
    	        if(this.status == "alipayMenu"){
    	            $("selbg").style.top = "164px";
    	            $("alipayMenu").style.background="url(../static/epgimg/an03a.jpg)"; 
    	            $("wxpayMenu").style.background="url(../static/epgimg/an02b.jpg)"; 
    	            $("aliPayInfo").style.display="none";
    	            $("wxPayInfo").style.display="block";
    	            $("tips").innerHTML="微信扫描支付完成后，<br>请点击【完成支付】";
    	            this.status = "wxpayMenu";
    	        }else if(this.status == "close"){
    				$("close").src = "../static/epgimg/close01.png";
    				$("alipayMenu").style.background="url(../static/epgimg/an03b.jpg)";
    	            $("selbg").style.display = "block";
    	            this.status = "alipayMenu";
    	        }
    	    },
    	    moveUp : function(){
    	    	if(this.status == "wxpayMenu"){
    	            $("wxpayMenu").style.background="url(../static/epgimg/an02a.jpg)";
    	            $("alipayMenu").style.background="url(../static/epgimg/an03b.jpg)";
    	            $("aliPayInfo").style.display="block";
    	            $("wxPayInfo").style.display="none";
    	            $("selbg").style.top = "112px";
    	            $("tips").innerHTML="支付宝扫描支付完成后,<br>请点击【完成支付】";
    	            this.status = "alipayMenu";
    	        }else if(this.status == "alipayMenu"){
    	        	$("close").src = "../static/epgimg/close02.png";
    	        	$("alipayMenu").style.background="url(../static/epgimg/an03a.jpg)";
    	            $("selbg").style.display = "none";
    	            this.status = "close";
    	        }
    	    },
    	    ok : function(){
    	        if(this.status == "aliwczf" || this.status == "wxwczf"){
    	            Auth({success:function(){
    	            	sublist.data[sublist.index].isAuthed=1;
    	            	windows.hidden("erweima");
    	            }, failure:function(){
    					$("zfsb").style.display="block";
    	            }});
    	        }else if(this.status == "close"){
    	            windows.hidden("erweima");
    	        }
    	    },
    	    hidden : function(){
    	        windows.hidden();
    	    }
    	};

    var wxts = {
            ok : function() {
                windows.hidden();
            },
            quit:function(){
            	windows.hidden();
            	windows.show("quit");
            }
        }
    /*{"errCode":"-3","msg":"支付宝二维码生成失败","result":{"movieid":"96","moviename":"机械姬","movietype":"0","orderId":"1015110318928062","price":"3","qrCodeURL":{"message":"0","orderId":"1015110318928062","qrcodeWXUrl":"weixin://wxpay/bizpayurl?pr=s2n5V3u"},"userid":"9950000000946804"}}*/
	function getCode(param){
		var url = URL.ipaddr+URL.getCode;
		var data = "{\"movieid\":"+sublist.data[sublist.focusIndex].id+",\"userid\":"+getCANO()+",\"price\":\""+sublist.data[sublist.focusIndex].price+"\",\"movietype\":1}";
		var sucFun = param.success;
		var faiFun = param.failure;
		ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
			var result = eval("("+xmlHttp.responseText+")");
			orderid = result.result.orderId;
			if(orderid!=null){
				sucFun(result);
			}else {
				faiFun();
			}
		}});
	}
	
	function Auth(param){
		var url = URL.ipaddr+URL.auth;
		var data = "{\"sid\":<%=sid%>,\"smartcardid\":"+getCANO()+"}";
		var sucFun = param.success;
		var faiFun = param.failure;
		ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
			var result = eval("("+xmlHttp.responseText+")");
			if(result.errCode == 0 && result.result==1){
				sucFun();
			}else{
				faiFun();
			}
		}});
	}
    
    var area=0;/*0-list 1-下方按钮*/
    function moveLeft(){
    	if (!windows.flag) {
	        if(area==0){
	            list.moveLeft();
	        }else if(area==1){
	            if(focusIndex==0)
	                setFocus(3);
	            else
	                setFocus(focusIndex-1);
	        }else if(area==2){
	        	sublist.moveLeft();
	        }
    	}else{
    		window[windows.key].moveLeft();
    	}
    }

    function moveRight(){
    	if (!windows.flag) {
	        if(area==0){
	            list.moveRight();
	        }else if(area==1){
	            if(focusIndex==3)
	                setFocus(0);
	            else
	                setFocus(focusIndex+1);
	        }else if(area==2){
	        	sublist.moveRight();
	        }
	    }else{
			window[windows.key].moveRight();
		}
    }
    
    function moveDown(){
    	if (!windows.flag) {
	        if(area==0){
	            list.blur();
	            setFocus(focusIndex);
	            area=1;
	        }else if(area==2){
	        	area=3;
	        	sublist.blur();
	    		$("ljgm_f").style.display="block";
	        }else if(area==3){
	        	area=0;
	        	list.setFocus();
	        	$("ljgm_f").style.display="none";
	        }
	    }else{
			window[windows.key].moveDown();
		}
    }

    function moveUp(){
    	if (!windows.flag) {
	    	if(area==0){
	    		area=3;
	    		list.blur();
	    		$("ljgm_f").style.display="block";
	    	}else if(area==1){
	            list.setFocus();
	            buttonBlur();
	            area=0;
	        }else if(area==3){
	        	$("ljgm_f").style.display="none";
	    		sublist.setFocus();
	    		area=2;
	        }
	    }else{
			window[windows.key].moveUp();
		}
    }

    function doConfirm(){
    	if (!windows.flag) {
	        if(area==0){
	            list.enter();
	        }else if(area==1){
	            buttonClick();
	        }else if(area==2){
	        	sublist.ok();
	        }else if(area==3){
	        	if(sublist.data[sublist.index].isAuthed==0){
	        		if(getCANO()==""||getCANO()=="0000000000000000"){
                		$("wxtsmsg").innerHTML="没有读取到您的智能卡号，请检查智能卡是否已插好<br/><h6>智能卡插好后，请点击【返回】</h6>";
                		windows.show("wxts");
                	}else{
		        		getCode({success:function(result){
							windows.hidden();
		            		windows.show("erweima");
		            		$("wxprice").innerHTML=result.result.price+"元";
		            		$("aliprice").innerHTML=result.result.price+"元";
		            		if(result.errCode==0){
		            			$("aliqrcode").src=URL.ipaddr+URL.getAliQrCode+"?src="+escape(result.result.qrCodeURL.qrcodeAlipayUrl);
		            			$("wxqrcode").src=URL.ipaddr+URL.getWxQrCode+"?src="+escape(result.result.qrCodeURL.qrcodeWXUrl);
		            		}else if(result.errCode==-2){
		            			$("aliqrcode").src=URL.ipaddr+URL.getAliQrCode+"?src="+escape(result.result.qrCodeURL.qrcodeAlipayUrl);
		            		}else if(result.errCode==-3){
		            			$("wxqrcode").src=URL.ipaddr+URL.getWxQrCode+"?src="+escape(result.result.qrCodeURL.qrcodeWXUrl);
		            		}
		                    $("close").src = "../static/epgimg/close01.png";
		                    $("alipayMenu").style.background="url(../static/epgimg/an03b.jpg)";
		    	            $("selbg").style.display = "block";
		    	            erweima.status = "alipayMenu";
		            	},failure:function(){
						
		            	}});	
                	}
	        	}else{
	        		$("wxtsmsg").innerHTML="您已购买此专题";
	        		windows.show("wxts");
	        	}
	        	
	        }
	    }else{
	    	if(getCANO()==""||getCANO()=="0000000000000000"){
	    		location.href=location.href;
	    	}else{
				window[windows.key].ok();
	    	}
		}
    }
    window.onload=function(){
        getRandomMovieByCategoryId({sunFunc:function(result){
               list.data=result;
               list.init();
               list.setFocus();
           }});
        
        getAllSubjects({sunFunc:function(result){
        	sublist.data=result.list;
        	sublist.init();
        }});
    };
    
    
</script>
</html>
