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
			currentPage=currentPage*1;
			var totalPage=$("#totalPage").html();
			totalPage=totalPage*1;
			var likeorderid=$("#likeorderid").val();
			var startTime=$("#startTime").val();
			var endTime=$("#endTime").val();
			if(currentPage>totalPage||currentPage<=1){
				alert("请输入正确的页码!");
			}else{
			window.location.href="backStage/m/bunviewOrder?currentPage="+currentPage+"&likeResearch.likeorderid="+likeorderid+"&likeResearch.startTime="+startTime+"&likeResearch.endTime="+endTime
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
<body style="overflow: hidden; width: 98%; height: 100%;">
	<center>
			<%String logo=">>GO"; %>
			<div style="width: 60%">
			<div style="width: 100%" align="left">
				<form action="backStage/m/bunviewOrder" method="post" id="myForm" class="form-horizontal" style="padding-left: 5px;">
					<table class="table-condensed">				
						
						<tr>
							<td>订单号:</td><td><input type="text" id="likeorderid" name="likeResearch.likeorderid" size="15" value="${unviewSearch.likeorderid}" class="form-control"></td>
						</tr>
						
						<tr>						
							<td>订单日期:</td><td><input type="text" name="likeResearch.startTime" size="15" 
							value="<fmt:formatDate value="${unviewSearch.startTime }" pattern="yyyy-MM-dd"/>" 
							 onclick="WdatePicker()" readonly="readonly" id="startTime" class="form-control" placeholder="请选择开始日期"></td>
							 <td><input type="text" name="endTime" size="15"  onclick="WdatePicker()" 
							 value="<fmt:formatDate value="${unviewSearch.endTime }" pattern="yyyy-MM-dd" />" 
							 readonly="readonly"  name="likeResearch.endTime" id="endTime" class="form-control" placeholder="请选择结束日期">
							 </td>
						 </tr>
						
						 <tr>
							<td>
							<button type="button"  id="myButton" class="btn btn-info">搜索</button>
							</td>
							<td><font color="red" size="1px" id="myFont"></font></td>
						</tr>
									 						
						
					</table>
				</form>
			</div>
			
		<h5 align="left" style="background-image: url('bpic/unviewlist.png');background-repeat:no-repeat;height:40px;"></h5>
		<div style="width: 100%" align="center" class="panel panel-primary" style="padding-left: 10px;">
			<table style="border:1px solid black; width:100%;text-align: center;" cellpadding="1px" cellspacing="1px" class="panel-title">
				
				<tr bgcolor="#EECFA1"><td>序号</td><td>订单号</td><td>订单时间</td><td>借贷金额</td><td>审批</td><td>审批级别</td></tr>
				
				<c:choose >  
	        		<c:when test="${not empty loans }"> 
		        		<c:forEach items="${loans}"  var="loan" varStatus="str">
							<tr>
							<td>${str.index+1}</td>
							<td>${loan.t_name}</td>
							<td><fmt:formatDate value="${loan.loan_date }" pattern="yyyy-MM-dd" /></td>
							<td>${loan.loan_money }</td>
							<td><a href="backStage/m/uncheckOrderDetail/${loan.loan_dd_id }">开始审批</a></td>							
							<td>${loan.sh_level}</td>
							</tr>
						</c:forEach>
	        		</c:when>
	        		<c:otherwise>  
	               		<tr><td colspan="6"><font color="red">暂时没有需要审核的订单</font></td><tr> 
	            	</c:otherwise>  
	        	</c:choose>	
			</table>
		</div>
			<!-- 分页 -->
			<div style="width: 100%">
				共有<font id="totalPage">${unviewOrders.totalPage }</font> 页&nbsp;&nbsp;
	   			当前第 ${unviewOrders.currentPage } 页&nbsp;&nbsp;
	   			共有 ${unviewOrders.totalSize } 条记录
	   			
	   				
	   			<c:choose> 
					<c:when test="${unviewOrders.currentPage ==1||unviewOrders.currentPage==0}">     
						首页  
					</c:when>  					 
					<c:otherwise>     
						 <a href="backStage/m/bunviewOrder?currentPage=1&likeResearch.likeorderid=${unviewSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${unviewSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${unviewSearch.endTime }" pattern="yyyy-MM-dd"/>">首页</a>
					</c:otherwise> 
				</c:choose>	
	   				   														
				<c:choose> 
					<c:when test="${unviewOrders.currentPage ==1||unviewOrders.currentPage==0}">     
						上一页   
					</c:when>  					 
					<c:otherwise>     
						  <a href="backStage/m/bunviewOrder?currentPage=${unviewOrders.currentPage-1 }&likeResearch.likeorderid=${unviewSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${unviewSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${unviewSearch.endTime }" pattern="yyyy-MM-dd"/>" >上一页</a>
					</c:otherwise> 
				</c:choose>
								
				<c:choose> 
					<c:when test="${unviewOrders.currentPage==unviewOrders.totalPage }">    
						下一页 
					</c:when>  					 
					<c:otherwise>     
						  <a href="backStage/m/bunviewOrder?currentPage=${unviewOrders.currentPage+1 }&likeResearch.likeorderid=${unviewSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${unviewSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${unviewSearch.endTime }" pattern="yyyy-MM-dd"/>">下一页</a>
					</c:otherwise> 
				</c:choose>	 	    	 	
	    	 		    	 		    	 	
	    	 	<c:choose> 
					<c:when test="${unviewOrders.currentPage==unviewOrders.totalPage }">    
						尾页
					</c:when>  					 
					<c:otherwise>     
	    	 			<a href="backStage/m/bunviewOrder?currentPage=${unviewOrders.totalPage }&likeResearch.likeorderid=${unviewSearch.likeorderid}&likeResearch.startTime=<fmt:formatDate value="${unviewSearch.startTime }" pattern="yyyy-MM-dd"/>&likeResearch.endTime=<fmt:formatDate value="${unviewSearch.endTime }" pattern="yyyy-MM-dd"/>">尾页</a>
					</c:otherwise> 
				</c:choose>	 
	    	 	    	 		
	    	 		<input type="text" id="pageNum" size="1">    	 		    	 			    	 	
	    	 	<a href="javascript:gogo()"><%=logo%></a>
	    	 	
	    	 </div>   
		</div>
	</center>	
  </body>
</html>
