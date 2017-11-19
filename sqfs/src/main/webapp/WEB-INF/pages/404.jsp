<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css" />	
  </head>
  <body>
		<div class="newfinno-con"></div>

<div class="tips">
	<h2 class="b-text">矮油~~您访问的页面不在地球上...</h2>
	<p class="m-box">
		<span class="m-text">休息一下,去17素材逛逛看吧。</span>
		<a class="back-index" href="index">返回首页</a>
	</p>
</div>
  </body>
</html>
