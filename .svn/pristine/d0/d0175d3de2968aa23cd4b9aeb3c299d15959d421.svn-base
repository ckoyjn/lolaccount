/**
 * 用于配置活动页面
 */

var recommendIndex=1;
var fxjcImgs=["xmdj","gzwb","gkmw",""];
var fxjc={
	index:0,
	size:3,
	init:function(){
		this.index=0;
		for(var i=0;i<this.size;i++){
			$("fxjc_"+i).src="../static/epgimg/"+fxjcImgs[i]+".png";
		}
		for(var i=this.size;i<4;i++){
			$("fxjc_"+i).src="../static/epgimg/jqqd.png";
		}
	},
	setFocus:function(){
		$("fxjc_f_"+this.index).style.display="block";
	},
	moveRight:function(){
		this.blur();
		if(this.index<this.size-1){
			this.index++;	
		}
		this.setFocus();
	},
	moveLeft:function(){
		this.blur();
		if(this.index>0){
			this.index--;	
		}
		this.setFocus();
	},
	blur:function(){
		$("fxjc_f_"+this.index).style.display="none";
	},
	ok:function(){
		location.href="activity.jsp?activity="+fxjcImgs[this.index];
	}
}

