<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet"
	href="${ctx }/bresources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.datetimepicker.css"/>
<script type="text/javascript"
	src="${ctx }/bresources/jquery/jquery-1.11.0.min.js"></script>
<script src="${ctx}/js/order-statistic.js" type="text/javascript"></script>
<!-- 导入bootStrap的库 -->
<script type="text/javascript"
	src="${ctx}/bresources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ctx}/bresources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ctx}/bresources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/bresources/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${ctx}/bresources/easyUI/easyui.css">
<script type="text/javascript" src="${ctx}/bresources/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/bresources/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/script/datepicker.js" type="text/javascript"></script>
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
<body style="overflow: hidden; width: 98%; height: 100%;" >
   	<!-- 工具按钮区 -->
   	<%@ page isELIgnored="false"%>
			<table class="table-condensed" style="margin: 0 5px;">
					<tbody id="searchBox">
					<tr>
					   <td>
						<input id="datetimepicker2" class="form-control datepicker ui-inputfield ui-widget ui-state-default ui-corner-all hasDatepicker" onclick="WdatePicker()" readonly="readonly" placeholder="请选择查询日期">
						</td>
						<td>	
						<select class="btn btn-default"
							 id="orderTypeSelect" name="order.id">
							<option value="0">==请选择订单类型==</option>
							<option value="1">借贷</option>
							<option value="2">投资</option>
						</select>
						</td>
						<td>	
							<select class="btn btn-default"
								 id="statusSelect" name="job.code">
								<option value="0">==请选择订单状态==</option>
							</select>
						</td>
						<td>	
						<div id="selectOrder" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>&nbsp;查询</div>
					 </td>
					</tr>
					</tbody>
				</table>
 		<div class="panel panel-primary" style="padding-left: 10px;">
 			<div class="panel-heading" style="background-color: #11a9e2;">
				<h3 class="panel-title">订单列表</h3>
			</div>
			<div class="panel-body" >
				<table class="table table-bordered">
					<thead id="table-column">
						<tr style="font-size: 12px;" align="center">
							<th style="text-align: center;">序号</th>
							<th style="text-align: center;">订单日期</th>
							<th style="text-align: center;">订单状态</th>
							<th style="text-align: center;">总金额</th>
							<th style="text-align: center;">总笔数</th>
						</tr>
					</thead>
					<tbody id="show_all_order">
						
					</tbody>
				</table>
				<div style="width: 100%; text-align: center">
					<ul>
						<li>当前第 ## 页&nbsp;&nbsp;&nbsp;共 ## 页 &nbsp;&nbsp;&nbsp;共 ## 条记录</li>
						<li>首页</li>
						<li>上一页</li>
						<li>下一页</li>
						<li>尾页</li>
					</ul>
				</div>
			</div>

		</div>
		
		<div id="divDialog" style="display: none;" >
			 <!-- 放置一个添加用户的界面  -->
			 <iframe id="iframe" frameborder="0" style="width: 100%;height: 100%;"></iframe>
		</div>
  </body>
</html>
