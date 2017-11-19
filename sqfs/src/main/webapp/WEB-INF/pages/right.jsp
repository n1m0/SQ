<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>权限管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet"
	href="resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="resources/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="resources/jquery/jquery-migrate-1.2.1.min.js"></script>
<!-- 导入bootStrap的库 -->
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="resources/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="resources/easyUI/easyui.css">
<script type="text/javascript" src="resources/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript">

</script>
</head>
<body style="overflow: hidden; width: 98%; height: 100%;" >
   	<!-- 工具按钮区 -->
   	<%@ page isELIgnored="false"%>
	<form class="form-horizontal" 
			action="${ctx }/identity/user/selectUser.jspx" method="post" style="padding-left: 5px;" >
		</form>
 		<div class="panel panel-primary" style="padding-left: 10px;">
 			<div class="panel-heading" style="background-color: #11a9e2;">
				<h3 class="panel-title">权限列表</h3>
			</div>
			<div class="panel-body" >
				<table class="table table-bordered">
					<thead>
						<tr style="font-size: 12px;" align="center">
							<th style="text-align: center;">权限名</th>
							<th style="text-align: center;">权限描述</th>
						</tr>
					</thead>
						<tr id="dataTr_${stat.index}" align="center">
							<td>超级管理员</td>
							<td>管理员工权限、查看订单详情</td>
						</tr>
						<tr id="dataTr_${stat.index}" align="center">
							<td>一级管理员</td>
							<td>一审，审核用户借贷和投资订单</td>
						</tr>
						<tr id="dataTr_${stat.index}" align="center">
							<td>二级管理员</td>
							<td>二审，审核一审提交的用户借贷、投资订单</td>
						</tr>
				</table>
				<!-- 分页标签区
				<fkjava:pager pageIndex="${pageModel.pageIndex}"
					pageSize="${pageModel.pageSize}"
					recordCount="${pageModel.recordCount}"
					submitUrl="${ctx}/identity/user/selectUser.jspx?pageIndex={0}&name=${user.name}&phone=${user.phone}&dept.id=${user.dept.id}&job.code=${user.job.code}" /> -->
			</div>

		</div>
		
		<div id="divDialog" style="display: none;" >
			 <!-- 放置一个添加用户的界面  -->
			 <iframe id="iframe" frameborder="0" style="width: 60%;height: 60%;"></iframe>
		</div>
  </body>
</html>
