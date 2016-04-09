var XMLHttp = {
    _objPool: [],
    _getInstance: function ()
    {
        for (var i = 0; i < this._objPool.length; i ++)
        {
            if (this._objPool[i].readyState == 0 || this._objPool[i].readyState == 4)
            {
                return this._objPool[i];
            }
        }
        // IE5中不支持push方法
        this._objPool[this._objPool.length] = this._createObj();
        return this._objPool[this._objPool.length - 1];
    },
    _createObj: function ()
    {
        var objXMLHttp = new XMLHttpRequest();

        if (objXMLHttp.readyState == null)
        {
            objXMLHttp.readyState = 0;

            objXMLHttp.addEventListener("load", function ()
                {
                    objXMLHttp.readyState = 4;

                    if (typeof objXMLHttp.onreadystatechange == "function")
                    {
                        objXMLHttp.onreadystatechange();
                    }
                },  false);
        }

        return objXMLHttp;
    }
};  

function ajax(param) {
	var url = param.url;
	var method = param.method || 'get';
	var data = param.data || '';
	var handler = param.handler;
	//alert(url+data);
	var xmlHttp =XMLHttp._getInstance();
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {// 已收到响应
            if (xmlHttp.status == 200 || xmlHttp.status == 0) {// 请求成功
                handler(xmlHttp);
            }
        }
    }
	xmlHttp.open(method, url, true);
    if (method.toLowerCase() == "post") {
    	if(param.type==1){
    		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    	}else{
    		xmlHttp.setRequestHeader("Content-Type","application/json");
    	}
    	
    	xmlHttp.send(data);
    } else {
    	xmlHttp.send(null);
    }
    return xmlHttp;
}

window.$ = function(id)
{
    return window.document.getElementById(id);
}

function getEvent(event) {
	return event ? event : window.event;
}

function preventDefault(event) {
	var e = getEvent(event);
	if (e.preventDefault) {
		e.preventDefault();
	} else {
		e.returnValue = false;
	}
}
var KeyCode = {
	KEY_UP:38, /*上*/
	KEY_DOWN:40, /*下*/
	KEY_LEFT:37, /*左*/
	KEY_RIGHT:39, /*右*/
	KEY_ENTER:13, /*确认*/
	KEY_RED:442,
	KEY_GREEN:113,
	KEY_YELLOW:114,
	KEY_BLUE:115,
	KEY_ZERO:48,
	KEY_ONE:49,
	KEY_TWO:50,
	KEY_THREE:51,
	KEY_FOUR:52,
	KEY_FIVE:53,
	KEY_SIX:54,
	KEY_SEVEN:55,
	KEY_EIGHT:56,
	KEY_NINE:57,
	KEY_QUIT:27,
	KEY_QUIT_MOTO:513,
	KEY_BACK:8,    //电视上的code是283
	KEY_BACK_MOTO:283
}
function graEvent(e){
	e=(e)?e:window.event;
	var val = e.which || e.keyCode;
	switch(val){
		case KeyCode.KEY_UP:
			moveUp();
			preventDefault(e);
			break;
		case KeyCode.KEY_DOWN:
			moveDown();
			preventDefault(e);
			break;
		case KeyCode.KEY_LEFT:
			moveLeft();
			preventDefault(e);
			break;			
		case KeyCode.KEY_RIGHT:
			moveRight();
			preventDefault(e);
			break;			
		case KeyCode.KEY_ENTER:
			doConfirm();
			preventDefault(e);
			break;
		case KeyCode.KEY_ZERO:
		case KeyCode.KEY_ONE:
		case KeyCode.KEY_TWO:
		case KeyCode.KEY_THREE:
		case KeyCode.KEY_FOUR:
		case KeyCode.KEY_FIVE:
		case KeyCode.KEY_SIX:
		case KeyCode.KEY_SEVEN:
		case KeyCode.KEY_EIGHT:
		case KeyCode.KEY_NINE:
			numberclick(val-48);
			preventDefault(e);
			break;
		case KeyCode.KEY_BACK:
		case KeyCode.KEY_BACK_MOTO:
			//preventDefault();
			
			if(inputmode==true){
				preventDefault(e);
				backspace1();
			}else{
				backspace();
			}
			break;
		/*case KeyCode.KEY_QUIT:
		case KeyCode.KEY_QUIT_MOTO:
			preventDefault(e);
			if(isHome==true){
				doQuit();
			}else{
				location.href="http://10.254.244.17:8080/cdvod";
			}
			break;*/
	}
}

document.onkeydown = graEvent;
//document.onkeypress = graEvent;

var windows = {
	flag : false,
	key : null,
	show : function(id){
		this.key = id;
		$(id).style.display = "block";
		$("screen").style.display = "block";
		this.flag = true;
	},
	hidden : function(){
		if(windows.flag){
			$(this.key).style.display = "none";
				this.flag = false;
			}
			$("screen").style.display = "none";
		}
}


//写 cookie
function setGlobalVar(sName, sValue)
{	
	try
	{
		iPanel.setGlobalVar(sName, sValue);
	}
	catch(e)
	{	
		document.cookie = escape(sName) + "=" + escape(sValue);
	}

}

//读 cookie
function getGlobalVar(sName) 
{

	var result = null;
	try
	{		
		result = iPanel.getGlobalVar(sName);
	}
	catch(e)
	{
		var aCookie = document.cookie.split("; ");
		for (var i = 0; i < aCookie.length; i++) 
		{
			var aCrumb = aCookie[i].split("=");
			if (escape(sName) == aCrumb[0]) 
			{
				result = unescape(aCrumb[1]);		
				break;
			}
		}		
	}
	return result;
}
