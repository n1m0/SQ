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
<link href="css/about.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>
<script type="text/javascript" src="script/common.js"></script>
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
 <li> <a href="trans/loan5/home"  id="gotoLoanPage">我要贷款</a>
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
<!--关于我们-->
<div class="bg">
  <div class="contain" id="tabs" style="margin:0 auto;">
    <div class="text-nav">
      <ul class="clearfix">
        <li> <a class="text-link" href="网站公告/home">网站公告</a> </li>
        <li> <a class="text-link" href="媒体报道/home">媒体报道</a> </li>
        <li> <a class="text-link" href="公司简介/home">公司简介</a> </li>
        <li class="selected"> <a class="text-link" href="管理团队/home">管理团队</a> </li>
        <li> <a class="text-link" href="合作伙伴/home">合作伙伴</a> </li>
        <li> <a class="text-link" href="团队风采/home">团队风采</a> </li>
        <li> <a class="text-link" href="法律政策/home">法律政策</a> </li>
        <li> <a class="text-link" href="法律声明/home">法律声明</a> </li>
        <li> <a class="text-link" href="资费说明/home">资费说明</a> </li>
        <li> <a class="text-link" href="招贤纳士/home">招贤纳士</a> </li>
        <li> <a class="text-link" href="联系我们/home">联系我们</a> </li>
      </ul>
    </div>
    <div class="text-box">
			<div class="text-content" id="text-content">
				<h1 class="title">管理团队</h1>
				<p class="mt20 cn_line">
				SQ金服以金融创新基因吸引了来自国内五百强知名企业的业界精英，目前团队成员年轻朝气、充满活力，热爱新事物，勇于接受新挑战，团队成员有信心和决心，要用人人共享的理念在金融改革的浪潮中乘风破浪，要为普通大众创造财富增值的机会，为诚信经营者提供高效便捷的金融服务。 
				</p>
				<div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
					<div class="img fl" style="width:130px;">
						<img src="images/liubei.jpg" alt="">
					</div>
					<div class="fl" style="width:790px;margin-left:20px;">
						<p>
							<span style="font-size:18px;color:#0aaae1;">刘备</span>
							<span style="color:#0aaae1;"> 联合创始人</span>
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							曾先后在中国农业银行、招商银行、兴业银行担任高管职务，拥有16年的国内大型银行工作经历，对客户信用风险评估、产品定价机制和市场风险管理策略具有深入的研究，风险管理经验十分丰富。  
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							2017年与合伙人共同创建互联网金融服务平台——SQ金服
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							感言：风控的宗旨在于对风险的预知和防范
						</p>
					</div>
				</div>
				<div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
					<div class="img fl" style="width:130px;">
						<img src="images/zhugeliang.jpg" alt="">
					</div>
					<div class="fl" style="width:790px;margin-left:20px;">
						<p>
							<span style="font-size:18px;color:#0aaae1;">诸葛亮</span>
							<span style="color:#0aaae1;"> 联合创始人</span>
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							曾先后在中国农业银行、招商银行、兴业银行担任高管职务，拥有16年的国内大型银行工作经历，对客户信用风险评估、产品定价机制和市场风险管理策略具有深入的研究，风险管理经验十分丰富。  
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							2017年与合伙人共同创建互联网金融服务平台——SQ金服
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							感言：风控的宗旨在于对风险的预知和防范
						</p>
					</div>
				</div>
				<div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
					<div class="img fl" style="width:130px;">
						<img src="images/guanyu.jpg" alt="">
					</div>
					<div class="fl" style="width:790px;margin-left:20px;">
						<p>
							<span style="font-size:18px;color:#0aaae1;">关羽</span>
							<span style="color:#0aaae1;"> 联合创始人</span>
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							曾先后在中国农业银行、招商银行、兴业银行担任高管职务，拥有16年的国内大型银行工作经历，对客户信用风险评估、产品定价机制和市场风险管理策略具有深入的研究，风险管理经验十分丰富。  
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							2017年与合伙人共同创建互联网金融服务平台——SQ金服
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							感言：风控的宗旨在于对风险的预知和防范
						</p>
					</div>
				</div>
				<div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
					<div class="img fl" style="width:130px;">
						<img src="images/zhangfei.jpg" alt="">
					</div>
					<div class="fl" style="width:790px;margin-left:20px;">
						<p>
							<span style="font-size:18px;color:#0aaae1;">张飞</span>
							<span style="color:#0aaae1;"> 联合创始人</span>
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							曾先后在中国农业银行、招商银行、兴业银行担任高管职务，拥有16年的国内大型银行工作经历，对客户信用风险评估、产品定价机制和市场风险管理策略具有深入的研究，风险管理经验十分丰富。  
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							2017年与合伙人共同创建互联网金融服务平台——SQ金服
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							感言：风控的宗旨在于对风险的预知和防范
						</p>
					</div>
				</div>
				<h1 class="title">组织机构</h1><br>
				<p>
					<img src="images/org.png" alt="SQ金服-组织机构" title="SQ金服-组织机构">
				</p>
			</div>
		</div>
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
</body>
</html>
