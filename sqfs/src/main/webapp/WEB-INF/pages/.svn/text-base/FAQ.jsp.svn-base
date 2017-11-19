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
<title>SQ金服</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="css/detail.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet">
<link href="favicon.ico" rel="SHORTCUT ICON">
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>
<script src="script/ablumn.js"></script>
<script src="script/plugins.js"></script>
<script src="script/detail.js"></script>

<!-- 新加入 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">  
<meta baidu-gxt-verify-token="1ccdab5a95c81ee20ce9ac14ac2dde22">
<meta baidu-bsi-verify-token="9bef3b643e53e9fdcd79a456a0d8da79">
<link type="text/css" rel="stylesheet" href="personage/global.css">
<link type="text/css" rel="stylesheet" href="personage/modal.css">
<link type="text/css" rel="stylesheet" href="personage/btn.css">
<link type="text/css" rel="stylesheet" href="personage/icon.css">
<link type="text/css" rel="stylesheet" href="personage/form.css">
<link  rel="shortcut icon" href="https://www.zwdai.com/resource/static/img/favicon.ico" type="image/x-icon">
<link  rel="Bookmark" href="https://www.zwdai.com/resource/static/img/favicon.ico">

<link type="text/css" href="personage/select.css" rel="stylesheet">
<link type="text/css" href="personage/common.css" rel="stylesheet">
<script type="text/javascript" src="personage/hm.js"></script><script type="text/javascript" async="" src="personage/sensorsdata.min.js"></script><script src="personage/jquery.js"></script>
<script type="text/javascript" src="personage/form.js"></script>
<script type="text/javascript" src="personage/modal.js"></script>
<script type="text/javascript" src="personage/layer.js"></script><link type="text/css" rel="stylesheet" href="personage/layer.css" id="layuicss-skinlayercss">
<script type="text/javascript" src="<%=basePath%>bresources/My97DatePicker/WdatePicker.js"> </script>
<link href="personage/jedate.css" rel="stylesheet">
<script type="text/javascript" src="personage/jquery.jedate.js"></script>
<script type="text/javascript">
		function login(){
			$.ajax({
				url:"<%=basePath%>loan/resultMeg",
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.meg=="success"){
						$("#err").html("订单已经存在,不可重复提交!!!");
					}else{
						$("#customperinfo").submit();
					}
				},
				error:function(data){
					alert("error");
				}
			})
			
		}
</script>
<style type="text/css">
	ul li{padding: 4px 4px;}
</style>
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
         <li> <a href="invest/investList" id="gotoInvest" >我要投资</a> </li>
 <li> <a href="trans/loan5/home" id="gotoLoanPage">我要贷款</a>
 <input type="hidden" value="${sessionScope.info.user_checked } " id="user_check_info_flag"> </li>
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

 <div class="b-main f-mt30">
    <div class="main-content">
        <h3 class="title">常见问题</h3>
        <ul>
        	<li>Q: &nbsp;什么是车易贷?</li>
        	<li>A: &nbsp;车易贷是指以抵押汽车登记证方式对符合本产品管理办法的申请个人，用于经营性或消费性的抵押贷款。适用于个人名下能流通和转让的私家车，且车产为正常状态的客户。</li>
        </ul><br>
        <ul>
        	<li>Q: &nbsp;什么是房易贷?</li>
        	<li>A: &nbsp;“房易贷”是指申请人提供自有或第三自然人名下房产作为抵押担保，向红岭创投申请的短期快速融资贷款业务。适用于个人或第三自然人名下房产，且房产状态为正常的个人。</li>
        </ul><br>
        <ul>
        	<li>Q: &nbsp;SQ金服理财收费标准是什么?</li>
        	<li>A: &nbsp;每月将按投资人所持债权的当期期末剩余本金及应收本金之和的一定比例收取,具体费率详见项目详情页面。</li>
        </ul><br>
        <ul>
        	<li>Q: &nbsp;车易贷、房易贷有什么区别?</li>
        	<li>A: &nbsp;车易贷是指以抵押汽车登记证方式对符合本产品管理办法的申请个人，用于经营性或消费性的抵押贷款。适用于个人名下能流通和转让的私家车，且车产为正常状态的客户。
        		   “房易贷”是指申请人提供自有或第三自然人名下房产作为抵押担保，向红岭创投申请的短期快速融资贷款业务。适用于个人或第三自然人名下房产，且房产状态为正常的个人。
        	</li>
        </ul><br>
        
    </div>
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
<script>
$(function(){
   
});
</script>
</body>
</html>
