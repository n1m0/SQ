<%@page import="redis.clients.jedis.Jedis"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>SQ 金服后台管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link href="${ctx }/bcss/base.css" rel="stylesheet">
    <link href="${ctx }/bcss/login.css" rel="stylesheet">
    <link href="${ctx }/bresources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx }/bresources/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx }/bresources/jquery/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/bresources/bootstrap/js/bootstrap.min.js"></script>
     <script type="text/javascript" src="${ctx }/bresources/easyUI/jquery.easyui.min.js"></script>
     <script type="text/javascript" src="${ctx }/bresources/easyUI/easyui-lang-zh_CN.js"></script>
     <link rel="stylesheet" href="${ctx }/bresources/easyUI/easyui.css">
	 <script type="text/javascript">
		 $(function(){
			 // 等文档加载完成以后再执行本脚本 
		 	 // 给验证码绑定点击事件 
		 	 // vimg 
		 	 $("#vimg").click(function(){
		 		 $(this).attr("src","${ctx}/createCode?timer="+new Date().getTime());
		 	 }).mouseover(function(){
		 		  $(this).css("cursor","pointer");
		 	 });
			 
			 /** 回车键事件  
			   event :事件源,代表按下的那个按键 
			 */
			 $(document).keydown(function(event){
				 if(event.keyCode == 13){
					 $("#login_id").trigger("click");
				 }
			 });
			 
			 /** 1.异步登录功能  */
			 $("#login_id").bind("click",function(){
				 var manId = $("#manId").val();
				 var passWord = $("#passWord").val();
				 var vcode = $("#vcode").val();
				 // 定义一个校验结果 
				 var msg = "";
				 if(!/^\w{2,20}$/.test(manId)){
					 msg = "登录名必须是2-20个的字符";
				 }else if(!/^\w{6,20}$/.test(passWord)){
					 msg = "密码必须是6-20个的字符";
				 }else if(!/^\w{4}$/.test(vcode)){
					 msg = "验证码格式不正确";
				 }
				 if(msg!=""){
					 // 校验失败了 
					 $.messager.alert("登录提示","<span style='color:red;'>"+msg+"</span>","error");
					 return ; // 结束程序 
				 }
				 var params = $("#loginForm").serialize();
				
				 /** 发起异步请求登录 */
				 $.ajax({
					 url:"${ctx}/backStage/blogin",
					 type: "post",
					 dataType : "json",
					 data : params ,
					 async : true ,  
					 success : function(data){
						 if(data.status == 1){
							  /** 跳转到主界面上去  */
							  window.location = "${ctx}/backStage/m/bmain";
						 }else{
							 $("#vimg").trigger("click");
							 $.messager.alert("登录提示","<span style='color:red;'>"+data.tip+"</span>","error");
						 }
						
					 },error : function(){
						 $.messager.alert("登录提示","<span style='color:red;'>您登陆失败了</span>","error");
					 }
				 });
					 
			 });
			 
		 
		 })
	 
	 </script>
</head> 
<body>
	<%@ page isELIgnored="false"%>
	<% String name="";
		String pwd="";
		Cookie[] cookies=request.getCookies();
		if(cookies!=null){
			for(Cookie cookie:cookies){
			if("manId".equals(cookie.getName())){
				name=URLDecoder.decode(name=cookie.getValue(),"utf-8");
			}
			if("passWord".equals(cookie.getName())){
				pwd=cookie.getValue();
			}
			}
		}%>
	<div class="login-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="logo"></span>
			<!-- <span class="split"></span> -->
			<!-- <span class="sys-name">智能办公平台</span> -->
		</div>
	</div>
	<div class="login-bd">
		<div class="bd-inner">
			<div class="inner-wrap">
				<div class="lg-zone">
					<div class="lg-box">
						<div class="panel-heading" style="background-color: #11a9e2;">
							<h3 class="panel-title" style="color: #FFFFFF;font-style: italic;"><marquee scrollamount="4" direction="left" >管理员登录</marquee></h3>
						</div>
						<form id="loginForm">
						   <div class="form-horizontal" style="padding-top: 20px;padding-bottom: 0px; padding-left: 20px;">
								
								<div class="form-group" style="padding: 5px;">
									<div class="col-md-11">
										<input class="form-control" id="userId" name="manId" type="text" value="<%=name %>"  placeholder="请输入用户名">
									</div>
								</div>
				
								<div class="form-group" style="padding: 5px;">
									<div class="col-md-11">
										<input  class="form-control"  id="passWord" name="passWord" type="password"  value="<%=pwd %>"  placeholder="请输入密码">
									</div>
								</div>
				
								<div class="form-group" style="padding: 5px;">
									<div class="col-md-11">
										<div class="input-group">
										<input class="form-control " id="vcode" name="vcode" type="text" placeholder="请输入验证码">
										<span class="input-group-addon" id="basic-addon2"><img id="vimg" alt="" src="${ctx}/createCode"></span>
										</div>
									</div>
								</div>
				
						</div>
							<div class="tips clearfix">
											<label><input type="checkbox" checked="checked" value="saveUserInfo" name="saveUserInfo">记住用户名</label>
											<!-- <a href="javascript:;" class="register">忘记密码？</a> -->
										</div>
							<div class="enter">
								<a href="javascript:;" id="login_id" class="purchaser" >登录</a>
								<a href="javascript:;" class="supplier" onClick="javascript:window.location='${ctx}/backStage/'">重 置</a>
							</div>
						</form>
					</div>
				</div>
				<div class="lg-poster"></div>
			</div>
	</div>
	</div>
	<div class="login-ft">
		<div class="ft-inner">
			<div class="about-us">
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">法律声明</a>
				<a href="javascript:;">服务条款</a>
				<a href="javascript:;">联系方式</a>
			</div>
			<div class="address">
			地址：深圳市龙华区建设路,淘金地电子商务孵化基地B座406
			&nbsp;邮编：510000&nbsp;&nbsp;
			Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2016&nbsp;SQ金服-轻松理财，乐享收益&nbsp;版权所有</div>
			<div class="other-info">
			建议使用火狐、谷歌浏览器，不建议使用IE浏览器！</div>
		</div>
	</div>
  </body>
</html>
