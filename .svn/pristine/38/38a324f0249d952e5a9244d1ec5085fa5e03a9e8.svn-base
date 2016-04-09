<style>
#quit{
	position: absolute;
	background:url(/cdvod/static/epgimg/quit_bg.jpg);
	width: 1280px;
	height: 720px;
}
</style>
<div id="quit" style="display: none;">
 	<img id="xuanjia" src="/cdvod/static/epgimg/mscw_f.png" style="position: absolute; top: 510px; left: 300px;width: 273;height: 131;">
	<img id="quitepg" src="/cdvod/static/epgimg/quit.png" style="position: absolute; top: 510px; left: 680px;width: 273;height: 131;"> 
</div>
<script>
var quit={
	status:"xuanjia",
	moveRight :function(){
		if(this.status == "xuanjia"){
			$("xuanjia").src="/cdvod/static/epgimg/mscw.png";
			$("quitepg").src="/cdvod/static/epgimg/quit_f.png";
			this.status="quit";
		}
	},
	moveLeft :function(){
		if(this.status == "quit"){
			$("xuanjia").src="/cdvod/static/epgimg/mscw_f.png";
			$("quitepg").src="/cdvod/static/epgimg/quit.png";
			this.status="xuanjia";
		}
	},
	ok:function(){
		if(this.status == "xuanjia"){
			location.href="http://10.254.240.219:8083/GamePortal/CDBCIndex.jsp?pid=11";
		}else if(this.status == "quit"){
			location.href=getGlobalVar("PORTAL_ADDR");
		}
	},
	quit:function(){
		location.href="http://localhost:8080/cdvod";
	}
}
function doQuit(){
	if (!windows.flag) {
		windows.hidden();
		windows.show("quit");
	}else{
		if(getCANO()==""||getCANO()=="0000000000000000"){
			windows.hidden();
			windows.show("quit");
		}else{
			window[windows.key].quit();
		}
	}
}
</script>
