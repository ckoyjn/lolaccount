<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="1280*720;text/html; charset=utf-8">
<title>EPG首页</title>
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

.background{
    width:1280px;
    height:720px;
    position:absolute;
    background-image:url(static/epgimg/sy_bj.jpg)
}

.poster{
    position: absolute;
	left: 258px;
	top: 87px;
	width: 993px;
	height: 408px;
}

.focus{
    position: absolute;
    left: 537.5px;
    top: 476px;
    width: 205px;
    height: 128px;
}


.list{
    position: absolute;
    top: 506px;
    width: 152px;
    height: 84px;
}
#list_3{
    position: absolute;
    top: 16px;
    left: 8px;
    width:188px;
    height:103px;
}

.recommendlist li{     
    float: left;
    width: 148px;
    height: 84px;
    text-align: center;
    margin-right:5px;
    /* margin-bottom: 8px; */
    background-color: red;}

.button{
    position: absolute;
    top: 635px;
}

#listCon{
	position: absolute;
	width: 996px;
	height: 83px;
	left: 258px;
	top: 520px;
	overflow: hidden;
}

#list{
	position:absolute;
	width: 2490px;
	height: 83px;
}

#list li{
	width: 153px;
	margin-right: 13px;
	height: 83px;
	float: left;
}

#subject{
	position: absolute;
	top: 118px;
	left: 40px;
}
#subject_focus{
	position: absolute;
	left: 37px;
	top: 115px;
	display:none;
}

#activity{
	position: absolute;
	left: 40px;
	top:344px;
}
#activity_focus{
	position: absolute;
	left: 37px;
	top: 341px;
	display:none;
}

#wxts{
	position:absolute;
	background: url(static/epgimg/wxts.png);
	width:594px;
	height:413px;
	left:343px;
	top:150px;
}

</style>
<script type="text/javascript" src="static/js/epgCommon.js"></script>
<script type="text/javascript" src="static/js/epgCQ.js"></script>
<script type="text/javascript" src="static/js/epgData.js"></script>
</head>
<body>
<div id="main" class="background">
<img id="focus" src="static/epgimg/focus.png" style="position: absolute;  top: 517px;  display: none; left: 255px;">
<img id="subject_focus" src="static/epgimg/subject_focus.png" />
<img id="subject" src="static/epgimg/subject_index.jpg"/>
<img id="activity_focus" src="static/epgimg/activity_focus.png">
<img id="activity" src="static/epgimg/activity_index.jpg"/>
<img id="poster" class="poster" src=""/>
<div id="listCon" >
<ul id="list" style="left:0px;">
</ul>
</div>

<img id="yxry" src="static/epgimg/yxtb_f.png" class="button" style="left:215px;"/>
<img id="gdjc" src="static/epgimg/gdjc.png" class="button" style="left:430px;"/>
<img id="jjcx" src="static/epgimg/jjcx.png" class="button" style="left:640px;"/>
<img id="wdsf" src="static/epgimg/wdsf.png" class="button" style="left:850px;"/>
<img id="btnFocus" src="static/epgimg/btnFocus.png" style="position: absolute;  top: 630px;  left: 210px; display:none;">

<div id="screen"
    style="position: absolute; background: url('static/epgimg/screen.png'); top:0px;left:0px;width: 1280px; height: 720px; display: none;">
</div>
        
<div id="wxts" style="display: none;">
        <div id="wxtsmsg"
            style="position: absolute; color: white; left: 38px; width: 496px; text-align: center; top: 130px;"></div>
        <img src="static/epgimg/fh_f.png" style="position: absolute; top: 261px; left: 220px;">
</div>
<%@ include file="quit.jsp" %>
</div>
<script>
var URL = {
    ipaddr:ipaddress,
    recommendlist:"/REST/recommend/list",
    recommendsubject:"/REST/recommend/subject"
};

function getRecommendList(param){
    var url = URL.ipaddr+URL.recommendlist;
    var data=""; 
    var sucFunc=param.sucFunc;
    var failFunc=param.failFunc;
    ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
        var result = eval("("+xmlHttp.responseText+")");
        if(result.errCode==0){
            sucFunc(result);
        }else{
            failFunc(result);
        }
    }});
    
}

function getSubject(param){
	var url = URL.ipaddr+URL.recommendsubject;
    var data=""; 
    var sucFunc=param.sucFunc;
    var failFunc=param.failFunc;
    ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
        var result = eval("("+xmlHttp.responseText+")");
        if(result.errCode==0){
            sucFunc(result);
        }else{
            failFunc(result);
        }
    }});
}
var list = {
    size:0,
    data:[],
    poster:$("poster"),
    initLeft:255,
    index : 0,
    focusIndex:0,
    pageSize:6,
    focus:$("focus"),
    step:166,
    init:function(data){
        $("list").innerHTML = "";
        this.data=data;
        this.size=this.data.length;
        this.index=0;
        this.focusIndex=0;
        for(var i=0; i<this.size; i++){
			var li = document.createElement("li");
			li.style.background = "url(static/epgimg/list/"+this.data[i].identify+"_list.jpg)";
			$("list").appendChild(li);	
		}
        
        this.setFocus();
    },
    setFocus:function(){
		this.poster.src="static/epgimg/banner/"+this.data[this.index].identify+"_banner.jpg";
		this.focus.style.display = "block";
		this.focus.style.left = (this.initLeft + this.step*this.focusIndex)+"px";
		if(this.focusIndex == this.pageSize - 1 || this.focusIndex == 0){
			$("list").style.left = (0 - this.step*(this.index - this.focusIndex)) + "px";
			
		} 
    },
    blur:function(){
        $("focus").style.display = "none";
    },
    moveLeft:function(){
		if(this.focusIndex == 0){
				
		}else{
			this.focusIndex --;
		}
		this.index--;
		this.setFocus();
    },
    moveRight:function(){
    	if(this.index == this.size-1){
    		return;
		}
		if(this.focusIndex == this.pageSize-1){
				
		}else{
			this.focusIndex++;
		}
		
		this.index++;
		this.setFocus();
    }
};

var subject={
	id:null,
	focus:$("subject_focus"),
	setFocus:function(){
		this.focus.style.display="block";
	},
	blur:function(){
		this.focus.style.display="none";
	},
	ok:function(){
		location.href="epg/subjectMovieList.jsp?sid="+this.id;
	}
};

var activity={
	id:null,
	focus:$("activity_focus"),
	setFocus:function(){
		this.focus.style.display="block";
	},
	blur:function(){
		this.focus.style.display="none";
	},
	ok:function(){
		insRecord({action:20});//首页推荐活动点击
		location.href="epg/activity.jsp?activity="+fxjcImgs[recommendIndex];
	}
};

var area=0;/*0-list 1-下方按钮 2-推荐专题 3-推荐活动*/
function moveLeft(){
	if (!windows.flag) {
	    if(area==0){
	    	if(list.index==0){
	    		area=2;
	    		list.blur();
	    		subject.setFocus();
	    		
	    	}else{
	    		list.moveLeft();	
	    	}
	        
	    }else if(area==1){
	        if(focusIndex==0)
	            setFocus(3);
	        else
	            setFocus(focusIndex-1);
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
	    	area=0;
	    	list.setFocus();
	    	subject.blur();
	    }else if(area==3){
	    	area=0;
	    	list.setFocus();
	    	activity.blur();
	    }
	} else {
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
	    	subject.blur();
	    	activity.setFocus();
	    	area=3;
	    }
	}else{
		window[windows.key].moveDown();
	}
}

function moveUp(){
	if (!windows.flag) {
		if(area==0){
			area=2;
			list.blur();
			subject.setFocus();
		}else if(area==1){
	        list.setFocus();
	        buttonBlur();
	        area=0;
	    }else if(area==3){
	    	subject.setFocus();
	    	activity.blur();
	    	area=2;
	    }
	}else{
		window[windows.key].movieUp();
	}
}

function doConfirm(){
	if (!windows.flag) {
	    if(area==0){
			insRecord({action:8,mediaId:list.data[list.index].id});//首页推荐影片点击
			location.href="epg/moviedetail.jsp?pid="+list.data[list.index].id;
		}else if(area==1){
			buttonClick();
		}else if(area==2){
			insRecord({action:9,specialid:subject.id});//首页推荐专题点击
			subject.ok();
		}else if(area==3){
			activity.ok();
		}
	} else {
		if(getCANO()==""||getCANO()=="0000000000000000"){
			location.href="http://10.254.244.17:8080/cdvod";
		}else{
			window[windows.key].ok();
		}
	}
}


window.onload=function(){
	isHome = true;
	
	getRecommendList({sucFunc:function(result){
            list.init(result.list);
    }});

    getSubject({sucFunc:function(result){
            subject.id=result.subject.id;
    }});
    if(getCANO()==""||getCANO()=="0000000000000000"){
            //温馨提示框显示提示内容
            windows.hidden();
            $("wxtsmsg").innerHTML="没有读取到您的智能卡号，请检查智能卡是否已插好<br/><h6>智能卡"+getCANO()+"插好后，请点击【返回】</h6>";
            windows.show("wxts");
     }else{
		insRecord({action:1});//进入首页
     }
};
</script>
</body>
</html>
