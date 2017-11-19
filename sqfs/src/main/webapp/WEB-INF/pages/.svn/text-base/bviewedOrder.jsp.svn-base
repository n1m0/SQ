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
	
	
	
	<script type="text/javascript" src="<%=basePath%>/bresources/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="script/jquery.min.js"></script>
	<script type="text/javascript">
		function gogo(){
			var currentPage=$("#pageNum").val();
			currentPage = currentPage * 1;
			var totalPage=$("#totalPage").html();
			totalPage = totalPage * 1;
			var likeorderid=$("#likeorderid").val();
			var startTime=$("#startTime").val();
			var endTime=$("#endTime").val();			
			var comment=$("#comment option:selected").val(); 
			
			if(currentPage>totalPage||currentPage<=0){
				alert("请输入正确的页码!");
			}else{
				window.location.href="backStage/m/bviewedOrder?currentPage="+currentPage+"&likeResearch.likeorderid="+likeorderid+"&likeResearch.startTime="+startTime+"&likeResearch.endTime="+endTime+"&likeResearch.comment="+comment
			}
		}
		
		$(function(){
			$("#myButton").click(function(){
				var starTime=$("#startTime").val();
				var endTime=$("#endTime").val();
				if(startTime!=null&&startTime!=""&&endTime!=null&&endTime!=""){
					if(starTime>endTime){
						$("#myFont").html("开始日期不能大于结束日期")
					}else{
						$("#myForm").submit();
					}
				}else{
					$("#myForm").submit();
				}
			});			
		})						
	</script>
  </head>
  
  <body >
   		<center>
   		<%String logo=">>GO"; %>
   			<div style="width: 60%">
   			<div style="width: 100%" align="left">
   			<form action="backStage/m/bviewedOrder" method="post" id="myForm" class="form-horizontal" style="padding-left: 5px;">
			<table class="table-condensed">
				<tr><td>借贷人:</td><td><input type="text" id="likeorderid" name="likeResearch.likeorderid" size="15" value="${viewedSearch.likeorderid }" class="form-control"></td></tr>
				<tr>
					<td>订单日期:</td><td><input type="text" id="startTime" name="likeResearch.startTime" size="15" id="startTime" onclick="WdatePicker()" readonly="readonly"
					value="<fmt:formatDate value="${viewedSearch.startTime }" pattern="yyyy-MM-dd"/>" 
					placeholder="请选择开始日期" class="form-control"></td>
					<td><input type="text" name="likeResearch.endTime"  size="15" class="form-control" onclick="WdatePicker()" readonly="readonly" value="<fmt:formatDate value="${viewedSearch.endTime }" pattern="yyyy-MM-dd" />" id="endTime" placeholder="请选择结束日期"></td>
				</tr>
				<tr><td>审核意见:</td><td>
				<select name="likeResearch.comment" class="btn btn-default" id="comment">
				<option >请选择</option>			
					<c:if test="${viewedSearch.comment=='同意' }">
						<option value="同意" selected="selected">同意</option>
						<option value="驳回" >驳回</option>
					</c:if>
					<c:if test="${viewedSearch.comment=='驳回' }">
						<option value="驳回" selected="selected">驳回</option>
						<option value="同意" >同意</option>
					</c:if>
					
					<c:if test="${empty viewedSearch.comment }">
						<option value="驳回" >驳回</option>
						<option value="同意" >同意</option>
					</c:if>
				</select></td>
				<tr>
					<td><input type="button" value="搜索" id="myButton" class="btn btn-info"></td>
					<td><font color="red" size="1" id="myFont"></font></td>
				</tr>
			</table>
			</form>
			</div>
		
   			
   			<h5 align="left" style="background-image: url('bpic/unviewlist.png');background-repeat:no-repeat;height:40px;"></h5>
   			<div class="panel panel-primary" align="center">
		<table style="border:1px solid black; width:100%;text-align: center;" cellpadding="1px" cellspacing="1px" class="panel-title">
			<tr bgcolor="#EECFA1"><td>序号</td><td>借贷人</td><td>订单时间</td><td>借贷金额</td><td>审批意见</td><td>审批时间</td><td>订单详情</td></tr>
			<c:forEach items="${loans }"  var="loan" varStatus="str">
				<tr>
				<td>${str.index+1}</td>
				<td>${loan.t_name}</td>
				<td><fmt:formatDate value="${loan.loan_date }" pattern="yyyy-MM-dd" /></td>
				<td>${loan.loan_money }</td>
				<td>${loan.dd_state }</td>
				<td><fmt:formatDate value="${loan.sp_time1 }" pattern="yyyy-MM-dd" /></td>
				<td><a href="backStage/m/orderDetail/${loan.loan_dd_id }">查看</a></td>
				</tr>
			</c:forEach>
		</table>
			<!-- 分页 -->
			<div align="center">
			共有 <font id="totalPage">${checkedOrders.totalPage }</font>页&nbsp;&nbsp;&nbsp;
	   			当前第 ${checkedOrders.currentPage } 页&nbsp;&nbsp;&nbsp;
	   			共有 ${checkedOrders.totalSize } 条记录
	   			
	   			<c:choose> 
					<c:when test="${checkedOrders.currentPage==1}">     
						首页
					</c:when>  					 
					<c:otherwise>     
						 <a href="backStage/m/bviewedOrder?currentPage=1&likeResearch.likeorderid=${viewedSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${viewedSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${viewedSearch.endTime }" pattern="yyyy-MM-dd"/>&likeResearch.comment=${viewedSearch.comment}" >首页</a>
					</c:otherwise> 
				</c:choose>
											
				 
				 <c:choose> 
					<c:when test="${checkedOrders.currentPage==1 }">    
						上一页 
					</c:when>  					 
					<c:otherwise>
						  <a href="backStage/m/bviewedOrder?currentPage=${checkedOrders.currentPage-1 }&likeResearch.likeorderid=${viewedSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${viewedSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${viewedSearch.endTime }" pattern="yyyy-MM-dd"/>&likeResearch.comment=${viewedSearch.comment}">上一页</a>
					</c:otherwise> 
				</c:choose>	
				 
				 
								
				<c:choose> 
					<c:when test="${checkedOrders.currentPage==checkedOrders.totalPage }">    
						下一页 
					</c:when>  					 
					<c:otherwise>
						  <a href="backStage/m/bviewedOrder?currentPage=${checkedOrders.currentPage+1 }&likeResearch.likeorderid=${viewedSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${viewedSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${viewedSearch.endTime }" pattern="yyyy-MM-dd"/>&likeResearch.comment=${viewedSearch.comment}">下一页</a>
					</c:otherwise> 
				</c:choose>	 	    	 	
	    	 	
	    	 	<c:choose> 
					<c:when test="${checkedOrders.currentPage==checkedOrders.totalPage}">     
						尾页
					</c:when>  					 
					<c:otherwise>     
						 <a href="backStage/m/bviewedOrder?currentPage=${checkedOrders.totalPage }&likeResearch.likeorderid=${viewedSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${viewedSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${viewedSearch.endTime }" pattern="yyyy-MM-dd"/>&likeResearch.comment=${viewedSearch.comment}">尾页</a>&nbsp;&nbsp;
					</c:otherwise> 
				</c:choose>
	    	 		
	    	 	<input type="text" id="pageNum" size="1" >
	    	 	<a href="javascript:gogo()"><%=logo%></a> 
				</div>
			</div>
			</div>		
   		</center>	
  </body>
</html>
