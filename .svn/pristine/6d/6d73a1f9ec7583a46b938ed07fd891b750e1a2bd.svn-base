<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>#if($SetmealID=='-1') 添加套餐   #elseif($Edit=="true")编辑套餐  #else 查看套餐  #end</title>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="this is my page" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript" src="${ctx}/static/js/validate/jquery.validate.min.js"></script>	
	<script type="text/javascript" src="${ctx}/static/js/validate/validate-tip.js"></script>
	<style>
		table .alink {
			color:blue;
			text-decoration:underline;
			font-weight:bold;
			cursor:pointer;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var validator = $("#fom").validate({
				onsubmit : false, 
				rules: {
					'name': {
						required: true,
						maxlength:100
					},
					'price': {
						required: true,
						maxlength:40,
						number:true,
						min:0
					},
					'formnum': {
						required: true,
						digits:true,
						maxlength:10
					},
					'discountprice': {
						required: true,
						maxlength:40,
						number:true,
						min:0
					},
					'sort': {
						required: true,
						maxlength:11,
						digits:true,
					},
					'identify':{
						required: true,
						maxlength:20,
					},
				},
				messages: {
					'name': {
						required: "套餐名称不能为空",
						maxlength:"套餐名称长度不超过100个字符"
					},
					'price': {
						required: "套餐价格不能为空",
						maxlength:"套餐价格长度不超过40个字符",
						number:"套餐价格必须为数字",
						min:"套餐价格不能小于0"
					},
					'formnum': {
						required: "套餐有效期不能为空",
						digits:"套餐有效期必须为整数",
						maxlength:"套餐有效期长度不超过10个字符"
					},
					'discountprice': {
						required: "套餐折扣价不能为空",
						maxlength:"套餐折扣价长度不超过40个字符",
						number:"套餐折扣价必须为数字",
						min:"套餐折扣价不能小于0"
					},
					'sort': {
						required: "排序不能为空",
						maxlength:"排序长度不超过11个字符",
						digits:"排序必须为整数",
					},
					'identify':{
						required: "图片标识不能为空",
						maxlength:"图片标识长度不超过20个字符",
					},
				},
				errorPlacement: $.handleError,
				success: $.handleSuccess,
				invalidHandler: $.invalidAlertHandler
			});
			
			$('#SaveSetmeal').click(function(){
				if($("#movieid option:selected").val()==-1 && $("#previewid option:selected").val()==-1){
					alert("请选择名称");
				}else{
					if (validator.form()) {
						var url = window.ctx+'/cms/setmeal/addsetmeal.action';
						var data = $('#fom').serializeArray();
						$("#loading").show();
						$.post(url, data, function(feedback) {
							$("#loading").hide();
							alert(feedback.message);
							if(feedback.successful) {
								window.opener.location.reload();
								window.close();
							}
						});
					}
				}
			});
			$('#UpdateSetmeal').click(function(){
				if (validator.form()) {
					var url = window.ctx+'/cms/setmeal/modifysetmeal.action';
					var data = $('#fom').serializeArray();
					$("#loading").show();
					$.post(url, data, function(feedback) {
						$("#loading").hide();
						alert(feedback.message);
						if(feedback.successful) {
							window.opener.location.reload();
							window.close();
						}
					});
				}
			});
		});
	</script>
</head>

<body class="ContentBody">
	<form method="post"  name="fom" id="fom">
	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" style="border:1px solid #cfcfcf;background:#ffffff;">
		<tr>
			<td colspan="2">
			<fieldset style="height:100%;">
					<legend>#if($SetmealID=='-1') 添加套餐 #elseif($Edit=="true") 编辑套餐 #else 查看套餐 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">套餐名称</td>
								<td class="pn-fcontent">
									<input type="hidden" name='id' value="$SetmealID"/>
									#if($Edit=="true")
										<input type='text' id='name' name='name' value='$!{SetmealInfo.name}'/>
										<em class="required">*</em>
									#else
										$!{SetmealInfo.name}
									#end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">套餐价格</td>
								<td class="pn-fcontent">
									#if($Edit=="true")
										<input type='text' id='price' name='price' value='$!{SetmealInfo.price}' />
										<em class="required">*</em>
									#else
										$!{SetmealInfo.price}
									#end 
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">有效期</td>
								<td class="pn-fcontent">
									#if($Edit=="true")
										<input type='text' id='formnum' name='formnum' value='$!{SetmealInfo.formnum}' />个月
										<em class="required">*</em>
									#else
										$!{SetmealInfo.formnum}个月
									#end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">折扣价</td>
								<td class="pn-fcontent">
									#if($Edit=="true")
										<input type='text' id='discountprice' name='discountprice' value='$!{SetmealInfo.discountprice}' />
										<em class="required">*</em>
									#else
										$!{SetmealInfo.discountprice}
									#end 
								</td>
							</tr>
							
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">排序</td>
								<td class="pn-fcontent">
									#if($Edit=="true")
										<input type='text' id='sort' name='sort' value='$!{SetmealInfo.sort}' />
										<em class="required">*</em>
									#else
										$!{SetmealInfo.sort}
									#end 
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">
									#if($Edit=="true")
										<select id="" name="status" style="width:135px">
											<option value="1" #if($!{SetmealInfo.status} == 1) selected #end>上线</option>
											<option value="2" #if($!{SetmealInfo.status} == 2) selected #end>下线</option>
										</select>
									#else
										#if($!{SetmealInfo.status} == 1)上线#else下线#end
									#end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">图片标识</td>
								<td class="pn-fcontent" colspan="3">
									#if($Edit=="true")
										<input type='text' id='identify' name='identify' value='$!{SetmealInfo.identify}' />
										<em class="required">*</em>
									#else
										$!{SetmealInfo.identify}
									#end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">简介</td>
								<td class="pn-fcontent" colspan='3'>
									#if($Edit=="true") 
										<textarea name="description" id="description" style="width: 80%;" rows="4" cols="80">$!{SetmealInfo.description}</textarea>
									#else 
										$!{SetmealInfo.description}
									#end
								</td>
							</tr>
						</table>
					</fieldset>	
			</td>
		</tr>
		<tr>
			<td width="17%">&nbsp;</td>
			<td width="83%">
				#if($SetmealID=='-1')
					<button type="button" id="SaveSetmeal" class="flatbutton">添加</button>
				#elseif($Edit=="true")
					<button type="button" id="UpdateSetmeal" class="flatbutton">更新</button>
				#end
				<button type="button" onclick="window.close();" class="flatbutton">关闭</button>
			</td>
		</tr>
	</table>
	</form>
	<div id="loading">
		<div id="loadingContent">
			<img src="${ctx}/static/img/loadinglit.gif"/>
			<div style="float:left;margin-top:17px;font-size:12px;font-weight: bold">#if($SetmealID=='-1')保存#else更新#end中，请稍后...</div> 
		</div>
	</div>
</body>
</html>
