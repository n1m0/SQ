<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>流程管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet"
	href="bresources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="bresources/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="bresources/jquery/jquery-migrate-1.2.1.min.js"></script>
<!-- 导入bootStrap的库 -->
<script type="text/javascript"
	src="bresources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="bresources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="bresources/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="bresources/easyUI/easyui.css">
<script type="text/javascript" src="bresources/blockUI/jquery.blockUI.js"></script>
<!-- 分页 -->
<script type="text/javascript" src="script/process-page.js"></script>
<style type="text/css">
	ul li{
		line-style: none;
		display: inline-block;
		padding: 1px 1px;
	}
	ul li:nth-child(2n + 1){
    	margin-right:3px;
	}
</style>
</head>
<body style="overflow-y: auto; overflow-x: hidden; width: 98%; height: 100%;" >
   	<!-- 工具按钮区 -->
   	<%@ page isELIgnored="false"%>
	<form class="form-horizontal" 
			action="${ctx }/identity/user/selectUser.jspx" method="post" style="padding-left: 5px;" >
		</form>
 		<div class="panel panel-primary" style="padding-left: 10px;">
 			<div class="panel-heading" style="background-color: #11a9e2;">
				<h3 class="panel-title">流程管理</h3>
			</div>
			<div class="panel-body" >
				<form action="backStage/m/uploadProcessDocument" method="post" enctype="multipart/form-data" id="_submitProcessFile">
				<table class="table table-bordered">
					<thead>
						<tr style="font-size: 12px;" align="center">
							<th style="text-align: center;" colspan="2">添加流程</th>
						</tr>
					</thead>
						<tr id="dataTr_${stat.index}" align="center">
							<td>流程名称:</td>
							<td align="left"><input type="text" name="processDefinitionName"></td>
						</tr>
						<tr id="dataTr_${stat.index}" align="center">
							<td>流程图:</td>
							<td align="left"><input type="file" name="zipDocs"></td>
						</tr>						
						<tr id="dataTr_${stat.index}" align="center">
							<td colspan="2"><input type="reset" value="取消">&nbsp;&nbsp;<input type="submit" value="提交" ></td>
						</tr>
				</table>
				</form>
				<table class="table table-bordered">
					<thead>
						<tr style="font-size: 12px;" align="center" >
							<th style="text-align: center;" colspan="6">流程列表</th>
						</tr>
					</thead>
					<tbody>
						<tr id="dataTr_${stat.index}" align="center">
							<td>部署ID</td>
							<td>流程名称</td>
							<td>发布时间</td>
							<td>版本号</td>
							<td>操作</td>
						</tr>
					</tbody>
					<tfoot id="pd_tf_tr">
						<c:choose>
							<c:when test="${process.size()!=0 }">
								<c:forEach var="dto" items="${process }" >
									<tr align="center">
										<td >${dto.id }</td>
										<td >${dto.name }</td>
										<td >${dto.deploymentTime }</td>
										<td >${dto.version }</td>
										<td >
											<a href="javascript:void(0)" name="del_deployment">删除</a>&nbsp;&nbsp;&nbsp; 
											<a target="_blank" href="<%=basePath %>backStage/m/v/${dto.id }">查看流程图</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
						    	<tr>
									<td style="text-align: center;" colspan="6">暂无发布流程</td>
								</tr>
						    </c:otherwise>
						</c:choose>
					</tfoot>
				</table>
				<div style="width:100%" align="center">
					<ul id="pagination">
						<li>
							共有 ${pdInfo.pages } 页&nbsp;&nbsp;
							当前第 ${pdInfo.currentPage } 页&nbsp;&nbsp;
							共有 ${pdInfo.count } 条记录
						</li>
						<li>
							<c:choose>
				   				<c:when test="${pdInfo.currentPage==1 || pdInfo.currentPage==0}">
				   					首页
				   				</c:when>
				   				<c:otherwise>
				   					<a href="javascript:void(0)" id="first_page">首页</a>
				   				</c:otherwise>
			   				</c:choose> 
						</li>
						<li>
							<c:choose> 
								<c:when test="${pdInfo.currentPage==1 || pdInfo.currentPage==0}">     
									上一页
								</c:when>  					 
								<c:otherwise>     
									  <a href="javascript:void(0)" id="pre_page">上一页</a>
								</c:otherwise> 
							</c:choose>	
						</li>
						<li>
							<c:choose> 
								<c:when test="${pdInfo.currentPage==pdInfo.pages }">    
									下一页
								</c:when>  					 
								<c:otherwise>     
									  <a href="javascript:void(0)" id="next_page">下一页</a>
								</c:otherwise> 
							</c:choose>
						</li>
						<li>
							<c:choose>
								<c:when test="${pdInfo.currentPage==pdInfo.pages }">
									尾页
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0)" id="last_page">尾页</a>
								</c:otherwise>
							</c:choose> 
						</li>
					</ul>    	 	
	    	 		<c:choose>
						<c:when test="${pdInfo.pages==1 || pdInfo.pages==0}">
							<input type="submit" value="GO>>" size="2" disabled="disabled" id="input_go">&nbsp;
	    	 				<input type="text" name="page" size="2" disabled="disabled" id="input_page">&nbsp;页
						</c:when>
						<c:otherwise>
							<input type="submit" value="GO>>" size="2" id="input_go">&nbsp;
	    	 				<input type="text" name="page" size="2" id="input_page">&nbsp;页
						</c:otherwise>
				    </c:choose>
   	 				<input type="hidden" id="input_page_totle_hidden" value="${pdInfo.pages }">
	    	 </div>   
			</div>

		</div>
		
		<div id="divDialog" style="display: none;" >
			 <!-- 放置一个添加用户的界面  -->
			 <iframe id="iframe" frameborder="0" style="width: 60%;height: 60%;"></iframe>
		</div>
  </body>
</html>
