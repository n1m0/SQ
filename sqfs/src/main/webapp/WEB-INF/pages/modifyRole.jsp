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
	href="${ctx }/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${ctx }/resources/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/jquery/jquery-migrate-1.2.1.min.js"></script>
<!-- 导入bootStrap的库 -->
<script type="text/javascript"
	src="${ctx}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${ctx}/resources/easyUI/easyui.css">
<script type="text/javascript">
	$(function() {

		// 如果有提示就弹出来 
		if ("${tip}") {
			 parent.showTip("${tip}");
		}
	
		/* /** 异步加载部门信息  */
    	$.ajax({
    		url : "${ctx}/identity/dept/getAllDeptsAndJobsAjax.jspx",
    		type : "post",
    		dataType : "json",
    		async : false ,
    		success : function(data){
    		    var depts = data.depts ;
    		    var jobs = data.jobs ;
    		    
    		    $.each(depts , function(){
    		    	$("<option />").val(this.code).html(this.name).appendTo("#deptSelect");
    		    });
    		    
    		    $.each(jobs , function(){
    		    	$("<option />").val(this.code).html(this.name).appendTo("#jobSelect");
    		    });
    			 
    		},error : function(){
    			$.messager.alert("用户提示","加载部门失败了","error");
    		}
    	}); */
		
    	
		 /** 选中部门和职位 */
	   	if("${user.job.code}")$("#jobSelect").val("${user.job.code}");
   		if("${user.dept.id}")$("#deptSelect").val("${user.dept.id}");
   		if("${user.question}")$("#question").val("${user.question}");
   		if("${user.sex}")$("#sex").val("${user.sex}");
		
		
		/**  添加用户，提交表单函数 */
		$("#btn_submit").click(function() {
			// 对表单中所有字段做校验
			var userId = $("#userId");
			var name = $("#name");
			var passWord = $("#password");
			var repwd = $("#repwd");
			var email = $("#email");
			var tel = $("#tel");
			var phone = $("#phone");
			var qqNum = $("#qqNum");
			var answer = $("#answer");
			var msg = "";
			if ($.trim(name.val()) == "") {
				msg += "姓名不能为空!";
				name.focus();
			} else if ($.trim(passWord.val()) == "") {
				msg += "密码不能为空!";
				passWord.focus();
			} else if (!/^\w{6,20}$/.test(passWord.val())) {
				msg += "密码长度必须为6-20之间!";
				passWord.focus();
			} else if (repwd.val() != passWord.val()) {
				msg += "两次输入的密码不一致!";
				repwd.focus();
			} else if ($.trim(email.val()) == "") {
				msg += "邮箱不能为空!";
				email.focus();
			} else if (!/^\w+@\w{2,}\.\w{2,}$/.test(email.val())) {
				msg += "邮箱格式不正确!";
				email.focus();
			} else if ($.trim(tel.val()) == "") {
				msg += "电话号码不能为空!";
				tel.focus();
			// 020-38216920 02034432323  0755
			} else if (!/^0\d{2,3}-?\d{7,8}$/.test(tel.val())) {
				msg += "电话号码格式不正确!";
				tel.focus();
			} else if ($.trim(phone.val()) == "") {
				msg += "手机号码不能为空!";
				phone.focus();
			} else if (!/^1[3|4|5|8]\d{9}$/.test(phone.val())) {
				msg += "手机号码格式不正确!";
				phone.focus();
			} else if ($.trim(qqNum.val()) == "") {
				msg += "QQ号码不能为空!";
				qqNum.focus();
			} else if (!/^\d{5,12}$/.test(qqNum.val())) {
				msg += "QQ号码长度必须在5-12之间!";
				qqNum.focus();
			} else if ($.trim(answer.val()) == "") {
				msg += "密保问题不能为空!";
				answer.focus();
			}
			// 直接提交
			if (msg != "") {
				$.messager.alert("提示", msg, "error");
			} else {
				$("#updateUserForm").submit();
			}
		});
	});
</script>
</head>
<body style="background: #F5FAFA;">
	<center>
		<form id="updateRoleForm" action="${ctx}/identity/user/updateUser.jspx"
			method="post">
			<!-- 当前用户的useId -->
			<input name="userId" value="${user.userId }" type="hidden">
			<table class="table-condensed">
				<tbody>
					<tr>
						<td><label>角色标识:<label></td>
						<td><span><input type="radio" id="password" name="passWord" >S</span>
							<span><input type="radio" id="password" name="passWord" >A</span>
							<span><input type="radio" id="password" name="passWord" >B</span>
							<span><input type="radio" id="password" name="passWord" checked="checked">N</span>
						</td>
					</tr>
					<tr>
						<td><label>角色名称:<label></td>
						<td><input type="text" id="repwd" name="npwd" value="一级管理员"
							 class="form-control" ></td>
					</tr>
					<tr>
						<td><label>角色描述:<label></td>
						<td><textarea name="a" style="width:200px;height:50px;">查看订单、审核订单</textarea></td>
					</tr>
				</tbody>
			</table>
				<div align="center" style="margin-top: 20px;">
				<a id="btn_submit" class="btn btn-info">
				<span class="glyphicon glyphicon-edit"></span>&nbsp;修改</a>
				<button type="reset" class="btn btn-danger">
					<span class="glyphicon glyphicon-remove"></span>&nbsp;重置
				</button>
			</div>
		</form>

	</center>
</body>
</html>
