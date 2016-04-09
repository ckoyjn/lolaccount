<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>套餐订单管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
<meta http-equiv="description" content="this is my page"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
<script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addSetmealOrder').click(function(){
   				 	window.showModalDialog("${ctx}/cms/setmealorder/tomodifysetmealorder.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/setmealorder/findsetmealorderlist.action").submit();
   				});
   				$('#reset').click(function(){
   	                $(":input").not(":button,:submit,:reset,:hidden").val('');
   	            });
		});	
		function editSetmeal(id){
			window.showModalDialog("${ctx}/cms/setmealorder/tomodifysetmealorder.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showSetmeal(id){
			window.showModalDialog("${ctx}/cms/setmealorder/tomodifysetmealorder.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delSetmeal(id){
			var url = window.ctx+'/cms/setmealorder/delsetmealorder.action';
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
		
		function reloadPage() {
            $('#queryForm').attr("action",window.ctx+"/cms/setmealorder/findsetmealorderlist.action").submit();
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
							<td>订单号：<input type='text' name='orderid' value='$!{setmealOrder.orderid}' /></td>
							<td>用户卡号：<input type='text' name='userid' value='$!{setmealOrder.userid}' /></td>
							<td>套餐名称：<input type='text' name='setmealname' value='$!{setmealOrder.setmealname}' /></td>
							<td>状态：
								<select name="status" id="status">
									<option value="0" >==请选择==</option>
									<option value="1" #if(${setmealOrder.status} == '1') selected="selected" #end >已支付</option>
   									<option value="2" #if(${setmealOrder.status} == '2') selected="selected" #end >支付失败</option>
   									<option value="2" #if(${setmealOrder.status} == '3') selected="selected" #end >未支付</option>
								</select>
							</td>
							<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
						</tr>
						<tr class="search">
							<td>平台订单号：<input type='text' name='ordernum' value='$!{setmealOrder.ordernum}' /></td>
							<td colspan="2">
							支付时间：
							<input type="text" id="paymenttimeStart" name="paymenttimeStart" value="$!{setmealOrder.paymenttimeStart}" style="width:100px" readonly="readonly"	onclick="WdatePicker({maxDate:'#F{$dp.$D(\'paymenttimeEnd\')}'})" class="Wdate" />
							&nbsp;&nbsp;-&nbsp;&nbsp;
							<input type="text" id="paymenttimeEnd" name="paymenttimeEnd" value="$!{setmealOrder.paymenttimeEnd}" style="width:100px" readonly="readonly"	onclick="WdatePicker({minDate:'#F{$dp.$D(\'paymenttimeStart\')}'})" class="Wdate" />
							</td>
							<td>支付方式：
								<select name="paymenttype" id="paymenttype">
									<option value="0" >==请选择==</option>
									<option value="1" #if(${setmealOrder.paymenttype} == '1') selected="selected" #end >观影劵</option>
									<option value="2" #if(${setmealOrder.paymenttype} == '2') selected="selected" #end >微信</option>
									<option value="2" #if(${setmealOrder.paymenttype} == '3') selected="selected" #end >支付宝</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="12" style="padding-left:10px;">套餐订单管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Orderid"  lastOrderBy="$!orderColumn"class="tb_head">订单号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Userid"  lastOrderBy="$!orderColumn"class="tb_head">用户卡号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Setmealname"  lastOrderBy="$!orderColumn"class="tb_head">套餐名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Price"  lastOrderBy="$!orderColumn"class="tb_head">价格</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Status"  lastOrderBy="$!orderColumn"class="tb_head">状态</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Paymenttype"  lastOrderBy="$!orderColumn"class="tb_head">支付方式 </a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Ordernum"  lastOrderBy="$!orderColumn"class="tb_head">平台订单号 </a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Paymenttime"  lastOrderBy="$!orderColumn"class="tb_head">支付时间</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Createtime"  lastOrderBy="$!orderColumn"class="tb_head">创建时间</a></td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="11"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($m in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onmousemove="javascript:this.bgColor='#FCFDEE';"
				onmouseout="javascript:this.bgColor='#FFFFFF';">
				<td>$!{m.orderid}</td>
				<td>$!{m.userid}</td>
				<td>$!{m.setmealname}</td>
				<td>$!{m.price}</td>
				<td>#if($!{m.status} == '1') 已支付  #elseif($!{m.status} == '2')支付失败  #else 未支付  #end</td>
				<td>#if($!{m.paymenttype} == '1') 观影卷  #elseif($!{m.paymenttype} == '2')微信  #else 支付宝  #end</td>
				<td>$!{m.ordernum}</td>
				<td>$!date.format('yyyy-MM-dd HH:mm:ss',$!m.paymenttime)</td>
				<td>$!date.format('yyyy-MM-dd HH:mm:ss',$!m.createtime)</td>
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
