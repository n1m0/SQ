<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
	contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- c标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><!-- fmt标签 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SQ金服/登录页面</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link href="css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script src="script/denglu.js" type="text/javascript"></script>
<!--  <link href="bcss/base.css" rel="stylesheet">-->
<link href="bcss/login.css" rel="stylesheet">
</head>
<body>
<header>
  <div class="header-top min-width">
    <div class="container fn-clear"> <strong class="fn-left">咨询热线：400-668-6698<span class="s-time">服务时间：9:00 - 18:00</span></strong>
      <ul class="header_contact">
        <li class="c_1"> <a class="ico_head_weixin" id="wx"></a>
          <div class="ceng" id="weixin_xlgz" style="display: none;">
            <div class="cnr"> <img src="images/code.png"> </div>
            <b class="ar_up ar_top"></b> <b class="ar_up_in ar_top_in"></b> </div>
        </li>
        <li class="c_2"><a href="#" target="_blank" title="官方QQ" alt="官方QQ"><b class="ico_head_QQ"></b></a></li>
        <li class="c_4"><a href="#" target="_blank" title="新浪微博" alt="新浪微博"><b class="ico_head_sina"></b></a></li>
      </ul>
      <ul class="fn-right header-top-ul">
        <li> <a href="index" class="app">返回首页</a> </li>
        <c:choose>
        	<c:when test="${sessionScope.info==null }">
        		<li>
		          <div class=""><a href="register/home" class="c-orange" title="免费注册">免费注册</a></div>
		        </li>
		        <li>
		          <div class=""><a href="login/home" class="js-login" title="登录">登录</a></div>
		        </li>
        	</c:when>
        	<c:otherwise>
        		<li>
		          <div class="">欢迎 ${sessionScope.info.user_name } 登录</div>
		        </li>
		        <li><a href="user/logout">注销</a></li>
        	</c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
  <div class="header min-width">
    <div class="container">

      <div class="fn-left logo"> <a class="" href="index"> <img src="images/logo.png"  title=""> </a> </div>

      <ul class="top-nav fn-clear">

        <li class="on"> <a href="index">首页</a> </li>
        <li> <a href="invest/investList" class="">我要投资</a> </li>
        <li> <a href="trans/loan3/home" class="">我要贷款</a> </li>
        <li> <a href="帮助中心/home">安全保障</a> </li>
        <c:choose>
        	<c:when test="${sessionScope.info.user_id==null }">
        		<li class="top-nav-safe"> <a href="trans/PersonalCenter/getPensonalInformation/52555">我的账户</a> </li>
        	</c:when>
        	<c:otherwise>
        		<li class="top-nav-safe"> <a href="trans/PersonalCenter/getPensonalInformation/${sessionScope.info.user_id }">我的账户</a> </li>
        	</c:otherwise>
        </c:choose>
        <li> <a href="公司简介/home">关于我们</a> </li>

      </ul>
    </div>
  </div>
</header>
<!--登录-->
<%
		//读取cookie ,得到数组
		Cookie[] cookies = request.getCookies();
		//循环数组，从中取值
		String phone1 = "";
		String pwd1 = "";
		if (cookies != null && cookies.length > 0) {
			for (Cookie s : cookies) {
				if ("phone".equals(s.getName())) {
					phone1 = s.getValue();
					//phone = URLDecoder.decode(phone, "utf-8");
				} else if ("pwd".equals(s.getName())) {
					pwd1 = s.getValue();
				}
			}
		}
	%>
<div class="wrap">
 <form id="LonginForm" name="LonginForm" action="user/login" method="post">
	<div class="tdbModule loginPage">
		<div class="registerTitle">用户登录</div>
		<div class="registerCont">
		<p><p>
			<ul>
				 <!--  <li class="error">
				    <span id="prrintInfo" data-info=""><span></span></span>
			    </li> -->
				<li>
					<span class="dis">手机号码：</span>
					
					<input class="input" type="text"  name="phone" value="<%=phone1 %>" id="phone" maxlength="24" tabindex="1" autocomplete="off">
				    <a id="sssdfasdfas" href="register/home" class="blue">注册用户</a>
				    
				    <span id="prrintInfo" ><span></span></span>
				</li>
	                
				<li>
				   <span class="dis">密码：</span>&nbsp;<input class="input" type="password" value="<%=pwd1 %>" name="d_pwd" id="password" maxlength="24" tabindex="1" autocomplete="off">  
				   <a href="alterPassword/home" id="pawHide" class="blue">忘记密码</a>
				   
				   <span id="pwdInfo" ><span></span></span>
				</li>
				<li> <span class="dis">验证码：</span>
          			<input type="text" id="jpgVerify" class="input input1 _yanzhengma" name="yzm" maxlength="4" tabindex="1">
          			<img id="vimgs" alt="" src="createCode">
          			<!--  <img src="user/image" alt="验证码" style="cursor:pointer;" id="yzm" class="valign">--> <a class="look blue _changeCapcherButton" id="vimg" href="javascript:void(0);" >看不清？换一张</a> 
          			
          			<span class="info" id="jpgVerifys" ></span> </li>
				<li class="agree">
			          <input name="protocol" id="protocol" type="checkbox" value="" checked="checked">
			        	我同意《<a href="#" target="_black">SQ金服安全协议</a>》 <span id="protocolAlt" data-info="请查看协议">请查看协议</span></li>
				<li class="agree"> 
					  <input type="checkbox" name="baocun" value="1" id="baocun"  />保存密码
					
				</li>
				<li class="btn"> 
					 <input type="button" class="radius1" value="立即登录" id="submitBtn" > 
					<!--<input type="submit" class="radius1" value="立即登录" id="submitBtn">-->
					<span class="info" id="but" ></span>
				</li>
			</ul>
		</div>
	</div>
 </form>
</div>
<!--网站底部-->
<div id="footer" class="ft">
  <div class="ft-inner clearfix">
    <div class="ft-helper clearfix">
      <dl>
        <dt>关于我们</dt>
        <dd><a href="公司简介/home">公司简介</a><a href="管理团队/home">管理团队</a><a href="网站公告/home">网站公告</a></dd>
      </dl>
      <dl>
        <dt>相关业务</dt>
        <dd><a href="invest/investList">我要投资</a><a href="trans/loan/home">我要借款</a></dd>
      </dl>
      <dl>
        <dt>帮助中心</dt>
        <dd><a href="帮助中心/home">新手入门</a><c:choose>
        	<c:when test="${sessionScope.info.user_id==null }">
        		 <a href="trans/PersonalCenter/getPensonalInformation/52555">我的账户</a> 
        	</c:when>
        	<c:otherwise>
        		 <a href="trans/PersonalCenter/getPensonalInformation/${sessionScope.info.user_id }">我的账户</a> 
        	</c:otherwise>
        </c:choose></dd>

      </dl>
      <dl>
        <dt>联系我们</dt>
        <dd><a href="联系我们/home">联系我们</a></dd>
      </dl>
    </div>
    <div class="ft-service">
      <dl>
        <dd>
          <p><strong>400-660-1268</strong><br>
            工作日 9:00-22:00<br>
            官方交流群:<em>12345678</em><br>
            工作日 9:00-22:00 / 周六 9:00-18:00<br>
          </p>
          <div class="ft-serv-handle clearfix"><a class="icon-hdSprite icon-ft-sina a-move a-moveHover" title="SQ金服新浪微博" target="_blank" href="#"></a><a class="icon-hdSprite icon-ft-qqweibo a-move a-moveHover" title="SQ金服腾讯微博" target="_blank" href="#"></a><a class="icon-ft-qun a-move a-moveHover" title="SQ金服QQ群" target="_blank" href="#"></a><a class="icon-hdSprite icon-ft-email a-move a-moveHover mrn" title="SQ金服email" target="_blank" href="mailto:xz@yirenbao.com"></a></div>
        </dd>
      </dl>
    </div>
    <div class="ft-wap clearfix">
      <dl>
        <dt>官方二维码</dt>
        <dd><span class="icon-ft-erweima"><img src="images/code.png" style="display: inline;"></span></dd>
      </dl>
    </div>
  </div>
  <div class="ft-record">
    <div class="ft-approve clearfix"><a class="icon-approve approve-0 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-1 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-2 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-3 fadeIn-2s" target="_blank" href="#"></a></div>
    <div class="ft-identity">©2017 SQ金服 All rights reserved&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;广东省SQ金服投资管理有限公司&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.miitbeian.gov.cn/">粤ICP备12345678号-1</a></div>
  </div>
</div>
</body>



<script type="text/javascript">
$(function(){
	 // 等文档加载完成以后再执行本脚本 
	 // 给验证码绑定点击事件 
	 // vimg 
	 $("#vimg").click(function(){
		 $("#vimgs").attr("src","createCode?timer="+new Date().getTime());
	 }).mouseover(function(){
		  $("#vimgs").css("cursor","pointer");
	 });
	//获取cookie
	 function getCookie(nameCookie) {
		 var aCookie = document.cookie;
		 for (var i=0; i < aCookie.length; i++)
		 {
		 var aCrumb = aCookie[i].split("=");
		 if (sName == aCrumb[0])
		 return unescape(aCrumb[1]);
		 }
	 }

});

</script>
</html>
