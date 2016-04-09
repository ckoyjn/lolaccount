<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    int flag = request.getParameter("flag")==null?-1:Integer.parseInt(request.getParameter("flag"));
    int cateid=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id")); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
    content="1280*720;text/html; charset=gbk">
<title>电影详情页</title>
<link rel="stylesheet" href="../static/css/moviedetail.css"
    type="text/css" />
<style type="text/css">
#chargezdy {
    position: absolute;
    background: url(../static/epgimg/chargezdy.png);
    width: 912px;
    height: 523px;
    left: 184px;
    top: 100px;
}
/* erweima layout */
#erweima{ position:absolute;left:40px;top:50px; background:url(../static/epgimg/erweimakuangNew.png) no-repeat; width:1200px;height:627px;display:none }
#erweima #erweimatip{position:absolute;left:284px;top:354px;color:#fff;font-size:15px;}
#erweima #close{position:absolute;left:1130px;top:15px;}
#yanzheng{position:absolute;left:176px;top:90px;}

#erweima #fanhui_erweima{ position:absolute;left:450px;top:430px;}
#erweima #price2{ position:absolute;left:40%;top:55px; width:329px;height:43px;line-height:43px;font-size:25px;color:#00B7F0;display: none;}
.PayInfo{ position: absolute; width: 860px; height: 500px; left: 300px; top: 118px; display: block;}
.qrwczf{position:absolute;    left: 660px;    top: 100px;}
.price{ position: absolute;    top: 50px;    width: 300px;    height: 43px;    line-height: 43px;    font-size: 35px; color: white; text-align: center;left:570px;}
.border{border-top:1px solid white;border-bottom:1px solid white;}
.qrimage{left:50px;top:10px;width: 460px;height: 460px;position: absolute;}
</style>
</head>
<body>
    <div id="bg" class="background">
        <div id="categoriesCon">
            <ul id="categories">
            </ul>
        </div>
        <img id="cateFocus" src="../static/epgimg/jdk.png"> <img
            src="../static/epgimg/zcyy.png" class="zcyy">
        <div id="detail">
            <img id="moviepic" src="">
            <div id="name"></div>
            <div id="ename"></div>
            <div id="score"></div>
            <img style="position: absolute; left: 935px; top: 90px;" src="../static/epgimg/zan.png">
            <div style="position: absolute;  left: 679px;  top: 94px;  color: white;  font-size: 18px;  width: 150px;  text-align: right;">
				共&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人观看           
				<div id="watchnum" style="position: absolute;  top: 2px;  left: 42px;  color: yellow;  width: 64px;  text-align: center;">123456</div> 
            </div>
            <div
                style="position: absolute; left: 310px; top: 160px; font-size: 18px; color: #0072ff;">导演：</div>
            <div id="director"></div>
            <div
                style="position: absolute; left: 310px; top: 190px; font-size: 18px; color: #0072ff;">主演：</div>
            <div id="actor"></div>
            <div
                style="position: absolute; left: 310px; top: 220px; font-size: 18px; color: #0072ff;">时长：</div>
            <div id="mins"></div>

            <div id="price"
                style="position: absolute; left: 130px; top: 420px; font-size: 18px; color: #FFFFB9;"></div>

            <div id="intro"></div>
            <img id="buy" class="detailbutton" src="../static/epgimg/buy.png" style="left: 310px"/>
            <img id="ph" class="detailbutton" src="../static/epgimg/ph.png" style="left: 410px"/> 
            <img id="favorite" class="detailbutton" src="../static/epgimg/favor.png" style="left: 510px"/> 
            <img id="rate" class="detailbutton" src="../static/epgimg/dz.png" style="left: 610px"/>
        </div>

        <img id="list_0" class="list" style="left: 280px" /> <img id="list_1"
            class="list" style="left: 442px" /> <img id="list_2" class="list"
            style="left: 604px" /> <img id="list_3" class="list"
            style="left: 766px" /> <img id="list_4" class="list"
            style="left: 928px" /> <img id="list_5" class="list"
            style="left: 1090px" />
        <div id="relatefocus"></div>


		<img id="yxry" src="../static/epgimg/yxtb.png" class="button" style="left:215px;"/>
		<img id="gdjc" src="../static/epgimg/gdjc_f.png" class="button" style="left:430px;"/>
		<img id="jjcx" src="../static/epgimg/jjcx.png" class="button" style="left:640px;"/>
		<img id="wdsf" src="../static/epgimg/wdsf.png" class="button" style="left:850px;"/>
		<img id="btnFocus" src="../static/epgimg/btnFocus.png" style="position: absolute;  top: 630px;  left: 210px; display:none;">

        <div id="screen"
            style="position: absolute; background: url('../static/epgimg/screen.png'); top:0px;left:0px;width: 1280px; height: 720px; display: none;">
        </div>

        <div id="ratetc">
            <div id="ratetx"
                style="position: absolute; left: 20px; top: 10px; color: white;">按遥控器方向键进行评分</div>
            <img id="ratestar_0" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 106px;"> <img
                id="ratestar_1" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 163px;"> <img
                id="ratestar_2" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 220px;"> <img
                id="ratestar_3" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 277px;"> <img
                id="ratestar_4" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 334px;">
            <div id="ratefanhui"></div>
            <div id="rateqr"></div>
        </div>

        <div id="dgtx" style="display: none">
        	<div
                style="position: absolute;  font-size: 22px;  width: 807px;  text-align: center;  left: 51px;  top: 120px;  color: white;">亲爱的用户，你即将购买沙发院线的影片</div>
        	<div id="mctx" style="position: absolute;  font-size: 26px;  width: 807px;  text-align: center;  left: 51px;  top: 159px;  color: white;"></div>
            <div id="jgtx"
                style="  position: absolute;  font-size: 22px;  width: 807px;  text-align: center;  left: 51px;  top: 204px;  color: white;"></div>
            <img id="dgqr" src="../static/epgimg/dgqd.png"
                style="position: absolute; left: 260px; top: 370px;"> <img
                id="dgfh" src="../static/epgimg/dgfh.png"
                style="position: absolute; left: 493px; top: 370px;">
                
             <img id="dg_f" src="../static/epgimg/dg_f.png"
                style="position: absolute; left: 260px;  top: 370px;">
                
        </div>

        <div id="wxts" style="display: none;">
            <div id="wxtsmsg"
                style="position: absolute; color: white; left: 38px; width: 496px; text-align: center; top: 130px;">hahahaha</div>
            <img src="../static/epgimg/fh_f.png"
                style="position: absolute; top: 261px; left: 220px;">
        </div>
        
       	<%@ include file="quit.jsp" %>
    </div>
    
<!-- erweima layout -->
	<div id="erweima">
	<img id="close" src="../static/epgimg/close01.png"/>	
	<img src="../static/epgimg/hLine.png" style="position:absolute;left:30px;top:100px; width:1140px;height:3px;line-height:43px;font-size:25px;"/>
	
	<img id="selbg" src="../static/epgimg/selmenu.png" style="position: absolute; left: 33px; top: 112px; z-index:1;">
	<div id="wxpayMenu" style="position:absolute;left:40px;top:118px; width:250px;height:52px;line-height:43px;font-size:20px;color:white;background:url(../static/epgimg/an02b.jpg);text-align:center;"></div>
	<div id="alipayMenu" class="border" style="position:absolute;left:40px;top:170px; width:250px;height:52px;line-height:43px;font-size:20px;color:white;background:url(../static/epgimg/an03a.jpg);text-align:center;"></div>
	<div id="castPayMenu" class="border"  style="position:absolute;left:40px;top:220px; width:250px;height:52px;line-height:43px;font-size:20px;color:white;background:url(../static/epgimg/an01a.jpg);text-align:center;"></div>
	<div id="tips" style="background-color:#1D2089;position:absolute;left:40px;top: 274px; width:250px;height:80px;line-height: 24px;font-size:15px;color:white;text-align:center;">
	微信扫描支付完成后，<br>请点击【完成支付】
	</div>
	
	<div id="castPayInfo" class="PayInfo"  style="display:none">
		<div id="filmcode" style="position:absolute;left:70px;top:25px; width:330px;height:43px;line-height:43px;font-size:30px;background:white;text-align:center;">请输入8位观影码</div>
		<img id="yanzheng" src="../static/epgimg/yz.png"/>
		<div style="position: absolute;left: 500px;top: 10px;height: 480px;width: 300px">
			<div style="font-size: 25px;color: white;text-align: center;">更多观影资讯<br/>请关注沙发院线微信订阅号</div>
			<img src="../static/epgimg/wechat.jpg" style="width:200px;height:200px; position: absolute;  left: 50px;  top: 100px;">
		</div>
	</div>
	
	<div id="aliPayInfo" class="PayInfo" style="display:none">
		<div style="border-style: solid;position: absolute;width: 480px;   height: 480px; left: 70px;top: 0px;overflow: hidden;background: url(../static/epgimg/showPayMsg.png);">
			<img id="aliqrcode" class="qrcode" src="" style="position: absolute; width: 640px; height: 640px; left: -80px;    top: -80px;background-color: white;">
		</div>
		<img id="aliqrwczf" class="qrwczf" src="../static/epgimg/wczf.png"/>
		<div id="aliprice" class="price" >9.9元</div>
	</div>
	
	<div id="wxPayInfo" class="PayInfo">
		<div style="border-style: solid;position: absolute;width: 480px; height: 480px; left: 70px;top: 0px;overflow: hidden;background: url(../static/epgimg/showPayMsg.png);">
			<img id="wxqrcode" class="qrcode" style="position: absolute; width: 600px; height: 600px; left: -60px; top: -60px;">
		</div>
		<img id="wxqrwczf" class="qrwczf" src="../static/epgimg/wczf.png"/>
		<div id="wxprice" class="price" >10元</div>
	</div>
	
	<div ><img id="zfsb" src="../static/epgimg/zfsb.png" style="position: absolute;top: 370px;left: 350px;display:none"></div>
	<div ><img id="yzsb" src="../static/epgimg/yzsb.png" style="position: absolute;top: 370px;left: 450px;display:none"></div>
	
	</div>

	
    <script type="text/javascript" src="../static/js/epgCQ.js"></script>
    <script type="text/javascript" src="../static/js/epgCommon.js"></script>
    
    <script type="text/javascript">
        var URL = {
            ipaddr : ipaddress,
            categorylist : "/REST/category/listGBK",
            moviedeatil : "/REST/movie/detail",
            same : "/REST/movie/sameCategory",
            favor : "/REST/favorite/add",
            deletefavor:"/REST/favorite/delete",
            rate : "/REST/user/rating",
            verify:"/REST/card/verifycode",
            praise:"/REST/user/praise",
            getCode:"/REST/order/getcode",
            auth:"/REST/movie/auth",
            getAliQrCode:"/REST/order/getaliqrcode",
            getWxQrCode:"/REST/order/getwxqrcode",
            watch:"/REST/user/watch/record"
        }

        function getCategoryList(param) {
            var url = URL.ipaddr + URL.categorylist;
            var data = "{\"encode\":\"1\"}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }
        var flag=<%=flag%>
        var pid =<%=pid%>;
        var cateid =<%=cateid%>;
        function getMovieDetail(param) {
            var url = URL.ipaddr + URL.moviedeatil;
//             var data = "{\"pid\":" + pid + ",\"smartcardid\":\"" + getCANO()
//                     + "\",\"encode\":\"1\"}";
			var data = "{\"pid\":" + pid + ",\"smartcardid\":\"" + getCANO() + "\",\"userid\":\""+ userId +"\",\"encode\":\"1\"}";
                    
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }
        
        /*castPayMenu aliPayMenu wxPayMenu yanzheng aliwczf wxwczf*/
        var orderid=null;
        var erweima = {
        	    status : "wxpayMenu",
        	    moveRight : function(){
        	     if(this.status == "castPayMenu"){
        	            inputmode=true;
        	            inputdom=$("filmcode")
        	            $("filmcode").style.background="url(../static/epgimg/dbtextbg.jpg)";
        	            $("filmcode").innerHTML="";
        	            $("selbg").style.display = "none";
        	            this.status = "filmcode";
        	        }else if(this.status == "alipayMenu"){
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
        	        if(this.status == "yanzheng"){
        	            $("yanzheng").src = "../static/epgimg/yz.png";
        	            $("castPayMenu").style.background="url(../static/epgimg/an01b.jpg)";
        				$("yzsb").style.display = "none";
        				$("selbg").style.display = "block";
        	            this.status = "castPayMenu";
        	        }else if(this.status == "filmcode"){
        	            $("filmcode").blur();
        	            $("filmcode").style.background="white";
        	            $("yanzheng").src = "../static/epgimg/yz.png";
        	            $("filmcode").innerHTML="请输入8位观影码";
        	            $("castPayMenu").style.background="url(../static/epgimg/an01b.jpg)";
        	            $("selbg").style.display = "block";
        	            this.status = "castPayMenu";
        	        }else if(this.status == "aliwczf"){
        				$("castPayMenu").style.background="url(../static/epgimg/an01a.jpg)";
        				$("alipayMenu").style.background="url(../static/epgimg/an03b.jpg)";
        				$("wxpayMenu").style.background="url(../static/epgimg/an02a.jpg)";
        	            $("aliqrwczf").src = "../static/epgimg/wczf.png";
        	            $("selbg").style.display="block";
        	            $("zfsb").style.display = "none";
        	            this.status = "alipayMenu";
        	        }else if(this.status == "wxwczf"){
        				$("castPayMenu").style.background="url(../static/epgimg/an01a.jpg)";
        				$("alipayMenu").style.background="url(../static/epgimg/an03a.jpg)";
        				$("wxpayMenu").style.background="url(../static/epgimg/an02b.jpg)";
        	            $("wxqrwczf").src = "../static/epgimg/wczf.png";
        	            $("selbg").style.display="block";
        	            $("zfsb").style.display = "none";
        	            this.status = "wxpayMenu";
        	        }
        	    },
        	    moveDown : function(){
        	        if(this.status == "filmcode"){
        	        	inputmode=false;
        	        	inputdom=null;
        	            $("filmcode").style.background="white";
        	            $("yanzheng").src = "../static/epgimg/yz_f.png";
        	            this.status = "yanzheng";
        	        }else if(this.status == "wxpayMenu"){
        	            $("selbg").style.top = "164px";
        	            $("wxpayMenu").style.background="url(../static/epgimg/an02a.jpg)";
        	            $("alipayMenu").style.background="url(../static/epgimg/an03b.jpg)";
        	            $("wxPayInfo").style.display="none";
        	            $("aliPayInfo").style.display="block";
        	            $("castPayInfo").style.display="none";
        	            $("tips").innerHTML="支付宝扫描支付完成后,<br>请点击【完成支付】";
        	            this.status = "alipayMenu";
        	        }else if(this.status == "alipayMenu"){
        	            $("selbg").style.top = "214px";
        	            $("alipayMenu").style.background="url(../static/epgimg/an03a.jpg)"; 
        	            $("castPayMenu").style.background="url(../static/epgimg/an01b.jpg)"; 
        	            $("wxPayInfo").style.display="none";
        	            $("aliPayInfo").style.display="none";
        	            $("castPayInfo").style.display="block";
        	            $("tips").innerHTML="请输入8位观影码，点击 “验证”";
        	            this.status = "castPayMenu";
        	        }else if(this.status == "close"){
        				$("close").src = "../static/epgimg/close01.png";
        	            $("wxpayMenu").style.background="url(../static/epgimg/an02b.jpg)";
        	            $("selbg").style.display = "block";
        	            this.status = "wxpayMenu";
        	        }
        	    },
        	    moveUp : function(){
        	    	if(this.status == "castPayMenu"){
        	            $("castPayMenu").style.background="url(../static/epgimg/an01a.jpg)";
        	            $("alipayMenu").style.background="url(../static/epgimg/an03b.jpg)";
        	            $("wxPayInfo").style.display="none";
        	            $("aliPayInfo").style.display="block";
        	            $("castPayInfo").style.display="none";
        	            $("selbg").style.top = "164px";
        	            $("tips").innerHTML="支付宝扫描支付完成后,<br>请点击【完成支付】";
        	            this.status = "alipayMenu";
        	        }else if(this.status == "alipayMenu"){
        	            $("alipayMenu").style.background="url(../static/epgimg/an03a.jpg)";
        	            $("wxpayMenu").style.background="url(../static/epgimg/an02b.jpg)";
        	            $("selbg").style.top = "112px";
        	            $("wxPayInfo").style.display="block";
        	            $("aliPayInfo").style.display="none";
        	            $("castPayInfo").style.display="none";
        	            $("tips").innerHTML="微信扫描支付完成后，<br>请点击【完成支付】";
        	            this.status = "wxpayMenu";
        	        }else if(this.status == "yanzheng"){
        	            $("yanzheng").src = "../static/epgimg/yz.png";
        	            this.status = "filmcode";
        	            $("filmcode").style.background="url(../static/epgimg/dbtextbg.jpg)";
        	            inputmode=true;
        	            inputdom=$("filmcode");
        	            this.status = "filmcode";
        	        }else if(this.status == "wxpayMenu"){
        	            $("close").src = "../static/epgimg/close02.png";
        	            $("wxpayMenu").style.background="url(../static/epgimg/an02a.jpg)";
        	            $("selbg").style.display = "none";
        	            this.status = "close";
        	        }
        	    },
        	    ok : function(){
        	        var filmcode = $("filmcode").innerHTML;
        	        if(this.status == "yanzheng"){
        	            if(filmcode != '' && filmcode != '请输入8位观影码'){
        	                verify({filmcode:filmcode,sucFunc:function(){/*判断电子券状态,通过验证后将用于支付*/
								Auth({sucFunc:function(){
									insRecord({action:10,mediaId:pid});//影片播放
			                    	recordWatch({pid:pid});//观影记录
			                    	setTimeout(function(){
				                    	location.href=detail.data.playUrl+userId;
			                    	},500);
								},failFunc:function(){
									$("yzsb").style.display="block";
								}});
        	                },failFunc:function(){
        	                    $("yzsb").style.display="block";
        	                }});
        	            }else{
        	                $("yzsb").style.display="block";
        	            }
        	        }else if(this.status == "aliwczf" || this.status == "wxwczf"){
        	            Auth({sucFunc:function(){
        	            	insRecord({action:10,mediaId:pid});//影片播放
                        	recordWatch({pid:pid});//观影记录
                        	setTimeout(function(){
    	                    	location.href=detail.data.playUrl+userId;
                        	},500);
        	            }, failFunc:function(){
        					$("zfsb").style.display="block";
        	            }});
        	        }else if(this.status == "fanhui"){
        	            windows.hidden("erweima");
        	            $("yzsb").style.display="none";
        	            $("zfsb").style.display="none";
        	            this.status = "yanzheng";
        	            $("yanzheng").src = "../static/epgimg/yz_f.png";
        	            $("qrwczf").src = "../static/epgimg/wczf.png";
        	            $("fanhui_erweima").src = "../static/epgimg/fanhui.png";
        	            $("filmcode").blur();
        	            $("filmcode").value="";
        	            $("filmcode").style.background="white";
        	            windows.show("castNums");
        	            $("sjback").style.display="none";
        	            $("sjtip").innerHTML="";
        	        }else if(this.status == "close"){
        	            windows.hidden("erweima");
        	        }
        	    },
        	    hidden : function(){
        	        windows.hidden();
        	    },
        	    quit:function(){
        	    	windows.hidden();
        			windows.show("quit");
        	    }
        	};

		function getCode(param){
			var url = URL.ipaddr+URL.getCode;
			var data = "{\"movieid\":<%=pid%>,\"userid\":"+getCANO()+",\"price\":\""+detail.data.price+"\",\"movietype\":0}";
			var sucFun = param.success;
			var faiFun = param.failure;
			ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
				var param = xmlHttp.responseText;
				if(param!=null && param!=''){
					var result = eval("("+param+")");
					if(result.errCode=="0" || result.errCode=="-3"){
						orderid=result.result.orderId;
						sucFun(result);
					}else if(result.errCode=="-2"){
						sucFun(result);
					}else{
						faiFun();
					}
				}else{
					sucFun(result);
				}
			}});
		}
		
		function Auth(param){
			var url = URL.ipaddr+URL.auth;
			var data = "{\"pid\":<%=pid%>,\"smartcardid\":"+getCANO()+"}";
			var sucFun = param.sucFunc;
			var faiFun = param.failFunc;
			ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
				var result = eval("("+xmlHttp.responseText+")");
				if(result.errCode == 0 && result.result==1){
					sucFun();
				}else{
					faiFun();
				}
			}});
		}

        function getSame(param) {
            var url = URL.ipaddr + URL.same;
            var data = "{\"pid\":" + pid + ",\"num\":6}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }

        function favor(param) {
            var url = URL.ipaddr + URL.favor;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":" + pid
                    + "}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });
        }
        
        function deletefavor(param) {
            var url = URL.ipaddr + URL.deletefavor;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":" + pid
                    + "}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });
        }

        function rate(param) {
            var url = URL.ipaddr + URL.rate;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":" + pid
                    + ",\"score\":" + ratetc.score + "}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }
        
        function verify(param){
            var url = URL.ipaddr + URL.verify;
            var data = "{\"evcnid\":\""+param.filmcode+"\",\"orderId\":\""+orderid+"\",\"userid\":\""+getCANO()+"\",\"price\":\""+detail.data.price+"\",\"moviename\":\""+detail.data.name+"\",\"movietype\":0,\"movieid\":<%=pid%>}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.result==1) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });
        }

        function praise(param){
        	var url = URL.ipaddr + URL.praise;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":\"" + pid + "\"}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                	 var result = eval("(" + xmlHttp.responseText + ")");
                     if (result.errCode == 0 && result.result == 0) {
                         sucFunc(result);
                     } else {
                         failFunc(result);
                     }
                }
            });
        }
		
		
		//观影记录
		function recordWatch(param) {
			var url = URL.ipaddr + URL.watch;
			var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":\"" + param.pid + "\",\"price\":"+detail.data.price+"}";
			ajax({
				url : url,
				data : data,
				method : "post",
				handler : function(xmlHttp) {}
			});
		}

        var charge = {
            status : "20",
            init : function() {
                this.status = "20";
                
                if(balanceflag==0){
                    userBalance({
                        sucFunc : function(result) {
                            if(result.type==0){//欠费
                                $("balance").innerHTML = "您已欠费" + result.oweTotalFee
                                + "元，请您选择要充值的金额进行充值";
                            }else {
                                $("balance").innerHTML = "您的余额为" + result.balance
                                + "元，请您选择要充值的金额进行充值";
                            }
                        },
                        failFunc : function(result) {
                            $("balance").innerHTML = "余额不足，请您选择要充值的金额进行充值";
                        }
                    });
                }

                $("chargefocus").style.display = "block";
                $("chargefocus").style.top = "172px";
                $("chargefocus").style.left = "192px";
                $("chargefh").src = "../static/epgimg/fh.png";
            },
            moveRight : function() {
                if (this.status == "20") {
                    this.status = "30";
                    $("chargefocus").style.left = "455px";
                } else if (this.status == "50") {
                    this.status = "100";
                    $("chargefocus").style.left = "455px";
                }
            },
            moveLeft : function() {
                if (this.status == "30") {
                    this.status = "20";
                    $("chargefocus").style.left = "192px";
                } else if (this.status == "100") {
                    this.status = "50";
                    $("chargefocus").style.left = "192px";
                }
            },
            moveDown : function() {
                if (this.status == "20") {
                    this.status = "50";
                    $("chargefocus").style.top = "246px";
                } else if (this.status == "30") {
                    this.status = "100";
                    $("chargefocus").style.top = "246px";
                } else if (this.status == "50" || this.status == "100") {
                    this.status = "cancel";
                    $("chargefh").src = "../static/epgimg/fh_f.png";
                    $("chargefocus").style.display = "none";
                }
            },
            moveUp : function() {
                if (this.status == "50") {
                    this.status = "20";
                    $("chargefocus").style.top = "172px";
                } else if (this.status == "100") {
                    this.status = "30";
                    $("chargefocus").style.top = "172px";
                } else if (this.status == "cancel") {
                    this.status = "100";
                    $("chargefocus").style.top = "246px";
                    $("chargefocus").style.left = "455px";
                    $("chargefh").src = "../static/epgimg/fh.png";
                    $("chargefocus").style.display = "block";
                }
            },
            ok : function() {
                if (this.status == "cancel") {
                    windows.hidden();
                } else if (this.status == "100") {
                    windows.hidden();
                    chargezdy.init();
                    windows.show("chargezdy");
                } else {
                    location.href = chargeaddress + "?payMoney=" + this.status
                            + "&returnUrl=" + location.href+"&flag=1";
                }
            },
            quit:function(){
            	windows.hidden();
            	windows.show("quit");
            }
        }

        var chargezdy = {
            status : "ok",
            init : function() {
                this.status = "ok";
                $("amount").innerHTML = "";
                $("chargezdyqr").src = "../static/epgimg/qr_f.png";
                $("chargezdyfh").src = "../static/epgimg/fh.png";
                inputmode = false;
                inputdom = $("amount");
                inputmaxlen = 3;
            },
            moveRight : function() {
                if (this.status == "ok") {
                    $("chargezdyqr").src = "../static/epgimg/qr.png";
                    $("chargezdyfh").src = "../static/epgimg/fh_f.png";
                    inputmode = false;
                    this.status = "cancel";
                }
            },
            moveLeft : function() {
                if (this.status == "cancel") {
                    $("chargezdyqr").src = "../static/epgimg/qr_f.png";
                    $("chargezdyfh").src = "../static/epgimg/fh.png";
                    inputmode = false;
                    this.status = "ok";
                }
            },
            moveUp : function() {
                $("chargezdyqr").src = "../static/epgimg/qr.png";
                $("chargezdyfh").src = "../static/epgimg/fh.png";
                $("amount").style.border = "2px solid #00FFFF";
                inputmode = true;
                this.status = "amount";
            },
            moveDown : function() {
                if (this.status == "amount") {
                    $("amount").style.border = "1px solid white";
                    $("chargezdyqr").src = "../static/epgimg/qr_f.png";
                    $("chargezdyfh").src = "../static/epgimg/fh.png";
                    inputmode = false;
                    this.status = "ok";
                }
            },
            ok : function() {
                if (this.status == "cancel") {
                    windows.hidden();
                    charge.init();
                    inputmode = false;
                    windows.show("charge");
                } else if (this.status == "ok") {
                    location.href = chargeaddress + "?payMoney="
                            + $("amount").innerHTML + "&returnUrl="
                            + location.href+"&flag=1";
                }
            },
            quit:function(){
            	windows.hidden();
            	windows.show("quit");
            }
        }
        var dgtx = {
            status : "cancel",
            moveRight : function() {
                if (this.status == "enter") {
                    $("dg_f").style.left = $("dgfh").style.left;
                    this.status = "cancel";
                }
            },
            moveLeft : function() {
                if (this.status == "cancel") {
                	$("dg_f").style.left = $("dgqr").style.left;
                    this.status = "enter";
                }
            },
            ok : function() {
                if (this.status == "enter") {
                    trxnstep = 1;
                    var url = iPanel.eventFrame.comfirmUrl;
                    $("data_ifm").src = url;
                } else {
                	$("dg_f").style.left = $("dgqr").style.left;
                    this.status = "enter";
                    windows.hidden();
                }
            }
        }
        
        var category = {
            size : 0,
            data : [],
            index : 0,
            focusIndex : 0,
            listSize : 4,
            initTop : 122,
            step : 56,
            flag : 0,
            lis : [],
            init : function() {
                this.size = this.data.length;
                this.listSize = this.data.length;
                for (var i = 0; i < this.size; i++) {
                    var li = document.createElement("li");
                    li.innerHTML = this.data[i].name;
                    if (cateid != -1 && this.data[i].id == cateid) {
                        this.flag = i;
                    }
                    $("categories").appendChild(li);
                }
                this.lis = $("categories").getElementsByTagName("li");
                this.lis[this.flag].style.background = "url(../static/epgimg/cate_f.jpg)";
            },
            setFocus : function() {
                if (this.focusIndex == this.listSize - 1
                        || this.focusIndex == 0) {
                    $("categories").style.top = (this.step * (this.focusIndex - this.index))
                            + "px";
                }
                $("cateFocus").style.top = this.initTop + this.focusIndex
                        * this.step + "px";
                $("cateFocus").style.display = "block";
            },
            blur : function() {
                $("cateFocus").style.display = "none";
            },
            moveDown : function() {
                if (this.index == this.size - 1) {
                    this.setFocus();
                    return;
                }

                if (this.focusIndex < this.listSize - 1) {
                    this.focusIndex++;
                }

                this.index++;
                this.setFocus();
            },
            moveUp : function() {
                if (this.index == 0) {
                    this.setFocus();
                    return;
                }

                if (this.index > 0) {
                    this.index--;
                }

                this.focusIndex--;
                this.setFocus();
            },
            ok : function() {
                location.href = URL.ipaddr + "/epg/category.jsp?id=" + this.data[this.index].id;
            }
        }

        var detail = {
            userbalance : 0,
            data : {},
            index : 0,
            init : function() {
                $("moviepic").src = "../static/epgimg/detail/" + this.data.identify
                        + "_detail.jpg";
                $("name").innerHTML = this.data.name;
                $("ename").innerHTML = this.data.ename;
                $("score").innerHTML = this.data.praiseNum;
                $("director").innerHTML = this.data.director;
                $("actor").innerHTML = this.data.actor;
                $("intro").innerHTML = this.data.intro;
                $("watchnum").innerHTML = this.data.watchNum;
                $("mins").innerHTML = this.data.mins + "分钟";
                $("mctx").innerHTML = "《"+this.data.name+"》";
                $("jgtx").innerHTML = "需要支付"+this.data.price+"元，请点击确认进行购买。";
                
                if(this.data.price=="0"){
                	$("price").innerHTML = "免费";
                }else{
                	$("price").innerHTML = this.data.price + "元/部";	
                }
                if (this.data.isFavorite == 1) {
                    $("favorite").src = "../static/epgimg/favorited.png";
                } else {
                    $("favorite").src = "../static/epgimg/favor.png";
                }
                $("rate").src = "../static/epgimg/dz.png";
                if (this.data.isAuthed == 1||this.data.price=="0") {
                    $("buy").src = "../static/epgimg/watch_f.png";
                } else {
                    $("buy").src = "../static/epgimg/buy_f.png";
                }
            },
            moveLeft : function() {
                this.index--;
                this.setFocus();
            },
            moveRight : function() {
                this.index++;
                this.setFocus();
            },
            setFocus : function() {
                if (this.index == 0) {
                	$("ph").src="../static/epgimg/ph.png";
                    if (this.data.isAuthed == 1||this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch_f.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy_f.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor.png";
                    }
                    $("rate").src = "../static/epgimg/dz.png";
                } else if (this.index == 1) {
                	$("ph").src="../static/epgimg/ph_f.png";
                    if (this.data.isAuthed == 1||this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor.png";
                    }
                    $("rate").src = "../static/epgimg/dz.png";
                } else if (this.index == 2) {
                	$("ph").src="../static/epgimg/ph.png";
                    if (this.data.isAuthed == 1||this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited_f.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor_f.png";
                    }
                    
                    $("rate").src = "../static/epgimg/dz.png";
                }else if (this.index == 3) {
                	$("ph").src="../static/epgimg/ph.png";
                    if (this.data.isAuthed == 1||this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor.png";
                    }
					$("rate").src = "../static/epgimg/dz_f.png";
                }
            },
            blur : function() {
            	$("ph").src="../static/epgimg/ph.png";
                if (this.data.isAuthed == 1||this.data.price=="0") {
                    $("buy").src = "../static/epgimg/watch.png";
                } else {
                    $("buy").src = "../static/epgimg/buy.png";
                }
                if (this.data.isFavorite == 1) {
                    $("favorite").src = "../static/epgimg/favorited.png";
                } else {
                    $("favorite").src = "../static/epgimg/favor.png";
                }
               
                $("rate").src = "../static/epgimg/dz.png";
            }
        }

        var related = {
            size : 0,
            data : [],
            lis : [],
            index : 0,
            step : 162,
            initTop : 274,
            init : function() {
                this.size = this.data.length;
                for (var i = 0; i < this.size; i++) {
                    $("list_" + i).src = "../static/epgimg/list/"
                            + this.data[i].identify + "_list.jpg";
                    $("list_" + i).style.display = "block";
                }
            },
            setFocus : function() {
                $("relatefocus").style.left = this.initTop + this.index * 162
                        + "px";
                $("relatefocus").style.display = "block";
            },
            blur : function() {
                $("relatefocus").style.display = "none";
            },
            moveRight : function() {
                if (this.index < this.size - 1) {
                    this.index++;
                }
                this.setFocus();
            },
            moveLeft : function() {
                if (this.index > 0) {
                    this.index--;
                }
                this.setFocus();
            }
        }

        var ratetc = {
            status : "rating",
            score : 0,
            moveLeft : function() {
                if (this.status == "rating") {
                    if (this.score > 0) {
                        this.score--;
                    }
                    this.refresh();
                } else if (this.status == "cancel" && detail.data.isRated == 0) {
                    this.status = "ok";
                    $("rateqr").style.background = "url(../static/epgimg/qr_f.png)";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh.png)";
                }
            },
            moveRight : function() {
                if (this.status == "rating") {
                    if (this.score < 10) {
                        this.score++;
                    }
                    this.refresh();
                } else if (this.status == "ok") {
                    this.status = "cancel";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh_f.png)";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                }
            },
            moveDown : function() {
                if (this.status == "rating") {
                    this.status = "ok";
                    $("rateqr").style.background = "url(../static/epgimg/qr_f.png)";
                    this.refresh();
                }
            },
            moveUp : function() {
                if (this.status == "ok") {
                    this.status = "rating";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                    this.refresh();
                } else if (this.status == "cancel" && detail.data.isRated == 0) {
                    this.status = "rating";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh.png)";
                    this.refresh();
                }
            },
            refresh : function() {
                var i;
                for (i = 0; i < Math.floor(this.score / 2); i++) {
                    $("ratestar_" + i).src = "../static/epgimg/fullstar.png"
                }

                for (var j = Math.ceil(this.score / 2); j < 5; j++) {
                    if (this.status == "rating") {
                        $("ratestar_" + j).src = "../static/epgimg/blankstar.png"
                    } else {
                        $("ratestar_" + j).src = "../static/epgimg/blackstar.png"
                    }

                }
                if (this.score % 2 == 1) {
                    $("ratestar_" + i).src = "../static/epgimg/halfstar.png"
                }
            },
            init : function() {
                if (detail.data.isRated == 1) {
                    this.status = "cancel";
                    this.score = detail.data.rating;
                    $("ratefanhui").style.background = "url(../static/epgimg/fh_f.png)";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                    this.refresh();
                } else {
                    this.status = "rating";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh.png)";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                    this.refresh();
                }
            },
            ok : function() {
                if (this.status == "ok") {
                    windows.hidden();
                    rate({
                        sucFunc : function() {
                            detail.data.isRated = 1;
                            detail.data.rating = this.score;
                            detail.setFocus();
                        }
                    });
                } else if (this.status == "cancel") {
                    windows.hidden();
                }
            }
        }

        var wxts = {
            ok : function() {
                windows.hidden();
            },
            quit : function() {
            	windows.hidden();
            	windows.show("quit");
            }
        }

        var area = 0;/*0-电影详情 1-左侧分类列表 2-下方电影列表 3-下方button*/
        function moveLeft() {
            if (!windows.flag) {
                if (area == 0) {
                    if (detail.index == 0) {
                        detail.blur();
                        area = 1;
                        category.setFocus();
                    } else {
                        detail.moveLeft();
                    }
                } else if (area == 2) {
                    related.moveLeft();
                } else if (area == 3) {
                    if (focusIndex == 0)
                        setFocus(3);
                    else
                        setFocus(focusIndex - 1);
                }
            } else {
                window[windows.key].moveLeft();
            }

        }

        function moveRight() {
            if (!windows.flag) {
                if (area == 0) {
                    if (detail.index < 3) {
                        detail.moveRight();
                    }
                } else if (area == 1) {
                    detail.setFocus();
                    area = 0;
                    category.blur();
                } else if (area == 2) {
                    related.moveRight();
                } else if (area == 3) {
                    if (focusIndex == 3)
                        setFocus(0);
                    else
                        setFocus(focusIndex + 1);
                }
            } else {
                window[windows.key].moveRight();
            }
        }

        function moveDown() {
            if (!windows.flag) {
                if (area == 1) {
                    category.moveDown();
                } else if (area == 0) {
                    related.setFocus();
                    area = 2;
                    detail.blur();
                } else if (area == 2) {
                    related.blur();
                    setFocus(focusIndex);
                    area = 3;
                }
            } else {
                window[windows.key].moveDown();
            }
        }

        function moveUp() {
            if (!windows.flag) {
                if (area == 1) {
                    category.moveUp();
                } else if (area == 2) {
                    related.blur();
                    area = 0;
                    detail.setFocus();
                } else if (area == 3) {
                    buttonBlur();
                    area = 2;
                    related.setFocus();
                }
            } else {
                window[windows.key].moveUp();
            }
        }

        function backspace() {
        	alert(URL.ipaddr);
            location.href = URL.ipaddr;
        }

        function doConfirm() {
            if (!windows.flag) {
                if (area == 0) {
                    if (detail.index == 2) {
                    	if(detail.data.isFavorite == 1){
                    		deletefavor({
                                sucFunc : function() {
                                    detail.data.isFavorite = 0;
                                    detail.setFocus();
                                },
                                failFunc : function() {
                                }
                            });
                    	}else{
                    		favor({
                                sucFunc : function() {
                                    detail.data.isFavorite = 1;
                                    detail.setFocus();
                                },
                                failFunc : function() {
                                }
                            });
                    	}
                        
                    } else if (detail.index == 1) {
                    	if(detail.data.preview!=""){
                    		insRecord({action:17,mediaId:pid});//预告片播放
                    		location.href=detail.data.preview+userId;
                    	}else{
                    		windows.hidden();
                    		$("wxtsmsg").innerHTML="影片暂无预告片";
                    		windows.show("wxts");
                    	}
                    } else if (detail.index == 3) {
                    	if(detail.data.isPraised==0){
                    		praise({
                        		sucFunc : function() {
                                    detail.data.isPraised = 1;
                                    $("score").innerHTML=parseInt($("score").innerHTML)+1;
                                    detail.setFocus();
                                },
                                failFunc : function() {
                                }
                        	});	
                    	}
                    }else if (detail.index == 0 && detail.data.isAuthed == 0 && detail.data.price > 0) {
                    	if(getCANO()==""||getCANO()=="0000000000000000"){
                    		$("wxtsmsg").innerHTML="没有读取到您的智能卡号，请检查智能卡是否已插好<br/><h6>智能卡插好后，请点击【返回】</h6>";
                    		windows.show("wxts");
                    	}else{
                    		insRecord({action:21,pid:pid});//支付选择弹窗
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
	                    		}else if(result.errCode==-4){
	                    			
	                    		}
	                            $("close").src = "../static/epgimg/close01.png";
								$("wxpayMenu").style.background="url(../static/epgimg/an02b.jpg)";
	            	            $("selbg").style.display = "block";
	            	            $("yzsb").style.display="none";
	            	            $("zfsb").style.display="none";
	            	            erweima.status = "wxpayMenu";
	                            
	                    	},failure:function(){
	                    		
	                    	}});
                    	}
                    } else if (detail.index == 0 && detail.data.isAuthed == 1 || detail.data.price=="0") {
                    	insRecord({action:10,mediaId:pid});//影片播放
                    	recordWatch({pid:pid});//观影记录
                    	setTimeout(function(){
	                    	location.href=detail.data.playUrl+userId;
                    	},500);
                    }
                } else if (area == 2) {
                    insRecord({action:16,mediaId:related.data[related.index].id});//详情页相似影片点击
                    location.href = "moviedetail.jsp?pid=" + related.data[related.index].id;
                } else if (area == 3) {
					buttonClick();
                } else if (area == 1) {
                    category.ok();
                }
            } else {
            	if(getCANO()==""||getCANO()=="0000000000000000"){
    	    		location.href=location.href;
    	    	}else{
    				window[windows.key].ok();
    	    	}
            }

	}
	var userId=getGlobalVar("userId");

        window.onload = function() {
            getCategoryList({
                sucFunc : function(result) {
                    category.data = result.list;
                    category.init();
                    getMovieDetail({
                        sucFunc : function(result) {
                            detail.data = result;
                            detail.init();
                            if(flag==1){
                            	
                            }
                        },
                        failFunc : function() {
                        }
                    });
                },
                failFunc : function() {
                }
            });
            
            getSame({
                sucFunc : function(result) {
                    related.data = result.list;
                    related.init();
                }
            });
        }
        
    </script>
</body>
</html>

