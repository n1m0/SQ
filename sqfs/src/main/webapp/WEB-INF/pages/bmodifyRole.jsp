<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>办公管理系统-添加用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta name="Keywords" content="keyword1,keyword2,keyword3" />
<meta name="Description" content="网页信息的描述" />
<meta name="Author" content="fkjava.org" />
<meta name="Copyright" content="All Rights Reserved." />
<link href="${ctx}/fkjava.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet"
	href="${ctx }/bresources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${ctx }/bresources/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${ctx }/bresources/jquery/jquery-migrate-1.2.1.min.js"></script>
<!-- 导入bootStrap的库 -->
<script type="text/javascript"
	src="${ctx}/bresources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ctx}/bresources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/bresources/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${ctx}/bresources/easyUI/easyui.css">
<script type="text/javascript">

	$(function() {
		
		 $('.in_radio').each(function(){
			 var code = "${roleInfo.roleCode}";
			 if ($(this).val() == code){
				$(this).attr("checked",true);
				$(this).attr("disabled",true);
				$("#btn_submit").attr("disabled",true);
			} else {
				$(this).mouseover(function(){
					 $(this).css("cursor","pointer")
				 });
			}
		});
		
		  $(":radio").click(function(){
			 //  alert("您是..." + $(this).val());
			 var selroleCode = $(this).val(); 
			 $("#btn_submit").attr("disabled",false);
		     /** 异步查询该角色的角色信息 */
 		       $.ajax({
				 url:"${ctx}/backStage/man/roleInfo",
				 type: "post",
				 dataType : "json",
				 data : {"roleCode":selroleCode} ,
			 	// async : false ,  
				 success : function(data){ 
				 	/**查询角色信息成功*/
					 if(data!= null){				  	
				  	   	 $("#rolename").val(data.roleName);
					     $("#powerinfo").val(data.powerInfo);
 				 	 }else {
						 $.messager.alert("修改角色","<span style='color:red;'>"+"系统故障，请稍后重试！"+"</span>","error");
					 }
				 },error : function(){
					 $.messager.alert("修改角色","<span style='color:red;'>"+"系统故障，请稍后重试！"+"</span>","error");
				 //	return false;
			 	}
			 });  
			   
		 });  
		 
		  $("#btn_submit").click(function(){
			  var selroleCode = $("input:radio:checked").val();
			  var selroleName = $('#rolename').val();
			  //alert(selroleName);
			  if (selroleCode != "${ROLECODE_IN_SESSION}"){
				 // alert(selroleCode);
				// $.messager.defaults = { ok: "是", cancel: "否" };
				 $.messager.confirm("修改确认","<span style='color:red;'>"+"您确定要将当前角色"+"<font size=4>"+"${ROLECODE_IN_SESSION}"+"</font>"+"修改为"+"<font size=4>"+selroleCode+"</font>"+"吗？"+"</span>",
				 	 function(data){
					 if (data){
						// alert(selroleCode);
						  $.ajax({
							 url:"${ctx}/backStage/man/updateRole",
							 type: "post",
							 dataType : "json",
							 data : {"roleCode":selroleCode} ,
						 	// async : false ,  
							 success : function(data){  
							 	/**修改角色成功*/
							 	//console.log(data.strOpeTime);
								 if(data.strOpeTime != null){		
									 $('#iframe', parent.document).css('display', 'none');
									 $('#divDialog', parent.document).parent().css('display', 'none');
									 $('.window-shadow', parent.document).css('display', 'none');
									 $('.window-mask', parent.document).css('display', 'none');
									 /**重置角色展示信息*/
									 $('#manTab tr', parent.document).each(function(){
										 //console.log($(this).find('td').eq(0).text());
										 var td_manId = $(this).find('td').eq(0);
										 var td_roleName = $(this).find('td').eq(2);
										 var td_roleCode = $(this).find('td').eq(3);
										 var td_operator = $(this).find('td').eq(4);
										 var td_operateTime = $(this).find('td').eq(5);
										 if (td_manId.text() == "${MANID_IN_SESSION}"){
											 td_roleName.text(selroleName);
											 td_roleCode.text(selroleCode);
											 td_operator.text("${MANAGER_IN_SESSION.manId}");
											 td_operateTime.html("<font>"+data.strOpeTime+"</fnot>");
										 }
									 });
									 
									/*  $.messager.show({
		    	   						 title:'密码初始化',
		    	   						 msg:"<span style='color:green;'>"+"密码初始化成功！"+"</span>",
		    	   						showType:'slide'
									 }); */
									 return false;
			 				 	 }else {
									 $.messager.alert("修改角色","<span style='color:red;'>"+"修改角色失败，请稍后重试！"+"</span>","error");
								 }
							 },error : function(){
								 $.messager.alert("系统提示","<span style='color:red;'>"+"系统故障，请稍后重试！"+"</span>","error");
						 	}
							//return false;
						 });   
					 }
					
				 });
			  }
			 
		  }); 
		  /** 取消按钮关闭窗口*/
		  $('#bt_cancel').on('click', function(){
			  $('#iframe', parent.document).css('display', 'none');
			  $('#divDialog', parent.document).parent().css('display', 'none');
			  $('.window-shadow', parent.document).css('display', 'none');
			  $('.window-mask', parent.document).css('display', 'none');
		 });  
		 
	});
</script>
</head>
<body style="background: #F5FAFA;">
	<center>
		<form id="updateRoleForm" action="${ctx}"
			method="post" style="margin-top : 15px">
			<!-- 当前用户的useId -->
			<table class="table-condensed">
				<tbody>
					<tr>
						<td><label>角色标识:</label></td>
						<td><span><input type="radio" name="roleCode" class="in_radio" value="A">A</span>
							<span><input type="radio" name="roleCode" class="in_radio" value="B">B</span>
							<span><input type="radio" name="roleCode" class="in_radio" value="C">C</span>
							<span><input type="radio" name="roleCode" class="in_radio" value="N">N</span>
						</td>
					</tr>
					<tr>
						<td><label>角色名称:</label></td>
						<td><input type="text" id="rolename" name="npwd" value="${roleInfo.roleName}"
							 readonly="readonly" class="form-control" ></td>
					</tr>
					<tr>
						<td><label>角色权责:</label></td>
						<td><textarea id="powerinfo" name="a" style="width:200px;height:50px;background-color:#f0f0f0;border-radius:3px" readonly="readonly">${roleInfo.powerInfo}</textarea></td>
					</tr>
				</tbody>
			</table>
				<div align="center" style="margin-top: 20px;">
				<a id="btn_submit" class="btn btn-info">
				<span class="glyphicon glyphicon-edit"></span>&nbsp;修改</a>
				<!-- <a class="btn btn-danger" href="javascript:window.open('','_parent','');window.close();">
					<span class="glyphicon glyphicon-remove"></span>&nbsp;取消</a> -->
				<button type="button" class="btn btn-danger" id="bt_cancel" >
					<span class="glyphicon glyphicon-remove"></span>&nbsp;取消
				</button>
			</div>
		</form>

	</center>
</body>
</html>
