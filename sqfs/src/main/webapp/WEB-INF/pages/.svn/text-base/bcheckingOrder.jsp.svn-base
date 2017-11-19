<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>My JSP 'index.jsp' starting page</title>  
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
	
	
	<script type="text/javascript" src="script/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#myButton").click(function(){
				var $flag=$("#myComment").val();
				if($flag=="no"){
					$("#myFont").html("请先选择审批意见!").attr({"color":"red","size":1});
				}else{
					$("#myForm").submit();
				}								
			});									
		});	
	</script>
  </head>
  
  <body>
  	<% String back="<<<返回";%>
  		<center>
  			
  			<div style="width:80%;" >
  				<a href="backStage/m/bunviewOrder" style="float:left"><%=back %></a>
  				<table  class="table table-bordered" align="center">
  					<tr bgcolor="#EECFA1" id="dataTr_${stat.index}" align="center"><td colspan="7">订单信息</td></tr>
  					<tr bgcolor="gray" id="dataTr_${stat.index}" align="center"><td>订单号</td><td>借贷人</td><td>借贷金额</td><td>还款金额</td><td>分期数</td><td>借款时间</td><td>审核级别</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>${loan.loan_dd_id }</td><td>${loan.sqUser.t_name }</td><td>${loan.loan_money }</td><td>${(loan.loan_money+loan.repayment.yh_lixi) }</td><td>${loan.repayment.qishu }</td><td><fmt:formatDate value="${loan.loan_date }" pattern="yyyy-MM-dd" /></td><td>${loan.sh_level }</td></tr> 				
  				</table><br><br>  				
  				
  				<table  class="table table-bordered" align="center">
  					<tr bgcolor="#EECFA1" id="dataTr_${stat.index}" align="center"><td colspan="2">借贷人信息审核</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>姓名:</td><td>${loan.sqUser.t_name }</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>电话</td><td>${loan.sqUser.phone }</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>身份证号码:</td><td>${loan.sqUser.id_card }</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>银行卡账号:</td><td>${loan.sqUser.bank_card }</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>常住地:</td><td>${loan.sqUser.x_address }</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>资产裸价:</td><td>${loan.zcInfo.zc_luojia }</td></tr>	
  					<tr id="dataTr_${stat.index}" align="center"><td>评估价:</td><td>${loan.zcInfo.zc_pinggujia }</td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>资产登记证:</td><td><a href="<%=basePath%>loan/load/${loan.zcInfo.zc_djzheng }/pic">下载文件</a></td></tr>
  					<tr id="dataTr_${stat.index}" align="center"><td>资产险证:</td><td><a href="<%=basePath%>loan/load/${loan.zcInfo.zc_xianzheng }/pic">下载文件</a></td></tr>	
  					<tr id="dataTr_${stat.index}" align="center"><td>资产评估证:</td><td><a href="<%=basePath%>loan/load/${loan.zcInfo.zc_pingguzheng }/pic">下载文件</a></td></tr>	
  				</table>
  			
  			   <h5  align="left" style="background-image: url('bpic/111111.png');background-repeat:no-repeat;height:40px;"></h5>
  			   <table border="1px solid gray" style="width: 100%;text-align:center" cellpadding="0" cellspacing="0">
  					<c:if test="${loan.g_id!=null }">
  						<tr bgcolor="#EECFA1"><td>审批人</td><td>管理员级别</td><td>审批意见</td><td>备注</td><td>审批时间</td><td>订单状态</td></tr>
  						<tr><td>${loan.g_id }</td><td>一级审核</td><td>通过</td><td>${loan.remark1 }</td><td><fmt:formatDate value="${loan.sp_time1 }" pattern="yyyy-MM-dd" /></td><td>待二审</td></tr> 				
  					</c:if>
  				</table><br><br>
  				
  				<div style="width:30%;float: left;" align="left" >
  				<form action="backStage/m/checkingOrder" method="post" onsubmit="return  confirm('确认是否提交?')" id="myForm">
  					<input type="hidden" name="loan_dd_id" value="${loan.loan_dd_id}">	
  					<table class="table table-bordered" style="text-align: center;">
  						<tr bgcolor="#EECFA1"><td>审批意见</td><td>备注</td></tr>
  						<tr><td><select name="comment" id="myComment" class="btn btn-default">
  									<option value="no">-请选择-</option>
  									<option value="同意">同意</option>
  									<option value="驳回">驳回</option>
  								</select></td><td><input type="text" name="remark"></td></tr>
  					</table>  				
  					<input type="hidden" value="${loan.loan_money }" name="loanMoney">
  					<input type="hidden" value="${loan.taskid }" name="taskid">	
  					<input type="hidden" value="${loan.g_id }"	name="firstChecker">		
  					<input type="button" value="提交" id="myButton"><font id="myFont"></font>
  				</form> 
  				</div>  								
  			</div>
  		</center>
  </body>
</html>
