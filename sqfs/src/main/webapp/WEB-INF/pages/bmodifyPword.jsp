<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta name="Keywords" content="keyword1,keyword2,keyword3" />
<meta name="Description" content="网页信息的描述" />
<meta name="Author" content="fkjava.org" />
<meta name="Copyright" content="All Rights Reserved." />
<link href="${ctx}/bfkjava.ico" rel="shortcut icon" type="image/x-icon" />
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
		
		/**必须先输入正确的登录密码*/
		$("#password").focus();
		/**首先校验用户输入当前密码是否正确*/
		$("#password").blur(function(){
			if ($(this).val() != ""){
			var pword= $("#password");
				if (${MANAGER_IN_SESSION.passWord} != pword.val() ){
				$("#fPwd").html("你输入的密码不正确，请重新输入！");
				pword.focus();
				} else $("#fPwd").html("");
			}
		});
		
		/**如果新密码有输入判断密码格式*/
		$("#newPwd").blur(function(){
			var pword= $("#newPwd");
			if (pword.val() != ""){
				if (!/^\w{6,20}$/.test(pword.val())) {
					$("#fnewPwd").html("密码长度必须为6-20之间!");
					pword.focus();
				} else if(/^\w{6,20}$/.test(pword.val())){
					$("#fnewPwd").html("");
					$("#fcPwd").html("");
				}
			}
		});
		
		/**输入确认密码前先输入新密码*/
		$("#confirmpwd").focus(function(){
			if ($("#newPwd").val() == ""){
				$("#fcPwd").html("请先输入您的新密码！");
				$("#newPwd").focus();
			} 
		});
		/**验证确认密码是否与新密码一致*/
		$("#confirmpwd").blur(function(){
			if ($("#newPwd").val() != "" && $(this).val() != $("#newPwd").val()){
				$("#fcPwd").html("确认密码与新密码不一致！");
				//$(this).focus();
			} else $("#fcPwd").html("");
		});
		
		/**提交验证，异步请求修改*/
		 $("#btn_submit").bind("click",function(){
			 var password= $("#password").val();
			 var newPwd= $("#newPwd").val();
			 var confirmpwd= $("#confirmpwd").val();
			 
			 var fPwd= $("#fPwd").html();
			 var fnewPwd= $("#fnewPwd").html();
			 var fcPwd= $("#fcPwd").html();
			
			// 定义一个校验结果 
			 var msg = "";
			 if (fPwd != "" || fnewPwd != "" || fcPwd != ""){
				 msg = "您输入的信息不完整！";
				// alert("success");
			 }else if(password == ""){
				 msg = "当前密码不为空！";
			 }else if(newPwd == ""){
				 msg = "新密码不为空！";
			 }else if(confirmpwd == ""){
				 msg = "确认密码不为空！";
			 }
			 if(msg!=""){
				 // 信息不完整
				 $.messager.alert("密码修改提示","<span style='color:red;'>"+msg+"</span>","error");
				 return false; 
			 } 
			 
			 var params = $("#updatePwordForm").serialize();
			 /** 发起异步请求添加管理员 */
			 $.ajax({
				 url:"${ctx}/backStage/man/updatePword",
				 type: "post",
				 dataType : "json",
				 data : params ,
				 async : false ,  
				 success : function(data){
					 if (data.status == 0){
						/*  $.messager.show({
								title:'修改密码',
								msg:"<span style='color:green;'>"+data.tip+"</span>",
								showType:'slide'
						}); */
						$.messager.alert("修改密码","<span style='color:green;' >"+"修改密码成功，请重新登录！"+"</span>","info",function(){
							parent.location.href = "${ctx}/backStage/m/logout";
						});
					 }else {
						 $.messager.alert("修改密码","<span style='color:red;'>"+"修改密码失败！"+"</span>","error");
					 } 
				 },error : function(){
					 $.messager.alert("修改密码","<span style='color:red;'>系统故障，稍后重试！</span>","error");
					 return false;
				 }
			 });
		 });
	});	
</script>
</head>
<body style="background: #F5FAFA;">
	<center>
		<form id="updatePwordForm" Style="margin-top : 20px">
			<!-- 当前用户的useId -->
			<input name="manId" value="${MANAGER_IN_SESSION.manId }" type="hidden">
			<table class="table-condensed">
				<tbody>
					<tr>
						<td><label>当前密码:</label></td>
						<td width="220px"><input type="password" id="password" name="passWord"
							 class="form-control" placeholder="请输入您的登录密码"><font id="fPwd" size="2" color="red"></font></td>
					</tr>
					<tr>
						<td><label>新密码:</label></td>
						<td><input type="password" id="newPwd" name="nPword" 
							 class="form-control" placeholder="请输入您的新密码"><font id="fnewPwd" size="2" color="red"></font></td>
					</tr>
					<tr>
						<td><label>确认密码:</label></td>
						<td><input type="password" id="confirmpwd" name="repwd" 
							 class="form-control" placeholder="请输入您的确认密码"><font id="fcPwd" size="2" color="red"></font></td>
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
