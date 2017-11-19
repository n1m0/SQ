<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="jquery1.8/jquery-1.8.0.min.js"></script>
  </head>
  
  <body>
  <%@ page contentType="text/html;charset=gbk" %> 
<%@ page language="java" import="java.sql.*" errorPage="" %> 

<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>用户登录</title> 
<script language="javascript"> 
function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
</script> 
</head> 
<body> 
<table width="256" border="0" cellpadding="0" cellspacing="0"> 
<!--DWLayoutTable--> 
<form action="validate.jsp" method="post" name="loginForm"> 
<tr> 
<td width="118" height="22" valign="middle" align="center"><input type="text" name="rand" size="15"></td> 
<td width="138" valign="middle" align="center"><img alt="code..." name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"></td> 
</tr> 
<tr> 
<td height="36" colspan="2" align="center" valign="middle"><a href="javascript:loadimage();"><font class=pt95>看不清点我</font></a></td> 
</tr> 
<tr> 
<td height="36" colspan="2" align="center" valign="middle"><input type="submit" name="login" value="提交"></td> 
</tr> 
</form> 
</table> 
</body> 
</html>
  </body>
   		

