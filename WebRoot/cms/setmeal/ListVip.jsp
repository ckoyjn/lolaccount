<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="this is my page" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addVip').click(function(){
   				 	window.showModalDialog("${ctx}/cms/vip/tomodifyvip.action?id=-1&Edit=true&objecttype=2&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/vip/findviplist.action").submit();
   				});
   				$('#reset').click(function(){
   	                $(":input").not(":button,:submit,:reset,:hidden").val('');
   	            });
		});	
		function editVip(id){
			window.showModalDialog("${ctx}/cms/vip/tomodifyvip.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showVip(id){
			window.showModalDialog("${ctx}/cms/vip/tomodifyvip.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delVip(id){
			var url = window.ctx+'/cms/vip/delvip.action';
			if(confirm("是否删除"))
				{
			$.post(url, {id:id}, function(feedback) {
					alert(feedback.message);
					if(feedback.successful) {
						location.reload();
					}
			}); 
				}
		}
		
		function reloadPage()
        {   
            $('#queryForm').attr("action",window.ctx+"/cms/vip/findviplist.action").submit();
        }
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post">
		<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='0' cellspacing='0' height="32">
						<tr class="search">
							<td>用户卡号：<input type='text' name='userid' value='$!{vip.userid}'/></td>
							<td>状态：
									<select name="sendStatus" id="sendStatus">
										 <option value="0" >==请选择==</option>
											<option value="1" #if(${vip.sendStatus} == '1') selected="selected" #end >有效中</option>
    										<option value="2" #if(${vip.sendStatus} == '2') selected="selected" #end >已过期</option>
    										<option value="2" #if(${vip.sendStatus} == '3') selected="selected" #end >暂停中</option>
									</select>
								</td>
							<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="12" style="padding-left:10px;">会员管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Useid"  lastOrderBy="$!orderColumn"class="tb_head">用户卡号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Validstime"  lastOrderBy="$!orderColumn"class="tb_head">生效时间</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="validetime"  lastOrderBy="$!orderColumn"class="tb_head">失效时间</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="SendStuts"  lastOrderBy="$!orderColumn"class="tb_head">状态</a></td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="11"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($m in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{m.userid}</td>
				<td>$!{m.validstime}</td>
				<td>$!{m.Validetime}</td>
				<td>#if($!{m.sendStatus} == '1') 有效中  #elseif($!{m.sendStatus} == '2') 已过期 #else 暂停中 #end</td>
			</tr>
			#end
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="11" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
