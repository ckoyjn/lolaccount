<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
    String activity=request.getParameter("activity")==null?"":request.getParameter("activity"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="1280*720;text/html; charset=utf-8">
<title>电影分类页面</title>
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
    left:14px;
    position:absolute;
    top:3px;
    background-image:url(../static/epgimg/040506_bj.jpg)
}
.button{
    position: absolute;
    top: 635px;
}
</style>
</head>
<body>
<div class="background" id="background">
<img id="activityImg" style="position: absolute;  left: 100px;  top: 100px;">
<img id="yxry" src="../static/epgimg/yxtb.png" class="button" style="left:215px;"/>
<img id="gdjc" src="../static/epgimg/gdjc.png" class="button" style="left:430px;"/>
<img id="jjcx" src="../static/epgimg/jjcx.png" class="button" style="left:640px;"/>
<img id="wdsf" src="../static/epgimg/wdsf_f.png" class="button" style="left:850px;"/>
<img id="btnFocus" src="../static/epgimg/btnFocus.png" style="position: absolute;  top: 630px;  left: 210px; display:none;">

<div id="screen"
    style="position: absolute; background: url('static/epgimg/screen.png'); top:0px;left:0px;width: 1280px; height: 720px; display: none;">
</div>
<%@ include file="quit.jsp" %>
</div>
<script type="text/javascript" src="../static/js/epgCommon.js"></script>
<script type="text/javascript" src="../static/js/epgCQ.js"></script>
<script>
var URL = {
        ipaddr:ipaddress
    }

function moveLeft(){
	if (!windows.flag) {
		if(focusIndex==0)
		    setFocus(3);
		else
		    setFocus(focusIndex-1);
	} else {
		window[windows.key].moveLeft();
	}
}

function moveRight(){
	if (!windows.flag) {
		if(focusIndex==3)
		    setFocus(0);
		else
		    setFocus(focusIndex+1);
	} else {
		window[windows.key].moveRight();
	}
}

function moveUp(){
	if (!windows.flag) {
		
	} else {
		window[windows.key].moveUp();
	}
}

function moveDown(){
	if (!windows.flag) {
		
	} else {
		window[windows.key].moveLeft();
	}
}

function doConfirm(){
	if (!windows.flag) {
		buttonClick();
	} else {
		window[windows.key].ok();
	}
}

window.onload=function(){
	$("activityImg").src="../static/epgimg/<%=activity%>Activity.jpg";
	setFocus(3);
}
</script>
</body>
</html>