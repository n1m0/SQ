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
<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script src="script/user.js" type="text/javascript"></script>


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
<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
    <div class="credit-ad"><img src="images/clist1.jpg" width="1200" height="96"></div>
    <div id="personal-left" class="personal-left">
      <ul>
        <li class="pleft-cur"><span><a href="trans/PersonalCenter/getPensonalInformation/${sqUser.user_id }"><i class="dot dot1"></i>账户总览</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="trans/PersonalCenter/getMoneyRecord/${sqUser.user_id }">资金记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="trans/PersonalCenter/getDepositsHistory/${sqUser.user_id }">投资记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="trans/PersonalCenter/getReturnedMoneyPlan/${sqUser.user_id }">回款计划</a></span></li>
        <li class=""><span><a href="trans/PersonalCenter/OpenThirdParty/${sqUser.user_id }"><i class="dot dot02"></i>开通第三方</a> </span> </li>
        <li><span><a href="trans/PersonalCenter/Recharge/${sqUser.user_id }/2"><i class="dot dot03"></i>充值</a></span></li>
        <li class=""><span><a href="trans/PersonalCenter/Withdraw/${sqUser.user_id }/2"><i class="dot dot04"></i>提现</a></span></li>
        <li><span><a href="trans/PersonalCenter/accountSetting/${sqUser.user_id }"><i class="dot dot09"></i>账户设置</a></span></li>
      </ul>
    </div>
    <style type="text/css">
		.invest-tab .on  a{color:#fff;}
	</style>
    <div class="personal-main">
      <div class="personal-investnote">
        <h3><i>投资记录</i></h3>
        <div class="investnote-money"> <span><b class="fb">累计投资</b><br>
          <i>${sqUser.personalFund.totalPrincipal }</i> 元 </span> <span><b class="fb">累计收益</b><br>
          <i class="c-pink">${sqUser.personalFund.totalAccrualt }</i> 元 </span> <span><b class="fb">待收本金</b><br>
          <i>${sqUser.personalFund.principalToBeCollected }</i> 元 </span> <span class="none"><b class="fb">待收收益</b><br>
          <i>${sqUser.personalFund.accrualtToBeCollected }</i> 元 </span> </div>
        <form id="form" name="form" method="post" action="">
          <script type="text/javascript">clearPage = function() {PrimeFaces.ab({source:'form:j_idt82',formId:'form',process:'form:j_idt82',params:arguments[0]});}</script>
          <span id="form:dataTable">
          <div class="invest-tab">
            <ul>
              <li class="on" id="bid"><span>投标中</span></li>
              <li class="" id="returnedMoney"><span>回款中</span></li>
              <li class="" id="finished"><span>已结束</span></li>
            </ul>
          </div>
          <script type="text/javascript">
		       $(function(){
		    	   $("#bid").click(function(){
		    		   $("#bid").attr("class","on");
		    		   $("#investnote-list1").css("display","block");
		    		   $("#returnedMoney").attr("class","");
		    		   $("#investnote-list2").css("display","none");
		    		   $("#finished").attr("class","");
		    		   $("#investnote-list3").css("display","none");
		    	   });
		    	   $("#returnedMoney").click(function(){
		    		   $("#bid").attr("class","");
		    		   $("#investnote-list1").css("display","none");
		    		   $("#returnedMoney").attr("class","on");
		    		   $("#investnote-list2").css("display","block");
		    		   $("#finished").attr("class","");
		    		   $("#investnote-list3").css("display","none");
		    	   });
		    	   $("#finished").click(function(){
		    		   $("#bid").attr("class","");
		    		   $("#investnote-list1").css("display","none");
		    		   $("#returnedMoney").attr("class","");
		    		   $("#investnote-list2").css("display","none");
		    		   $("#finished").attr("class","on");
		    		   $("#investnote-list3").css("display","block");
		    	   });
		       });
		</script>
          <div class="investnote-list">
            <div class="investnote-contitle"> <span class="investnote-w1 fb">交易时间</span> <span class="investnote-w2 fb">项目</span> <span class="investnote-w3 fb">状态</span> <span class="investnote-hbw4 fb">我的投资</span> <span class="investnote-hbw5 fb">我的收益</span> <span class="investnote-hbw6 fb">操作</span> </div>
            <ul id="investnote-list1" style="display: block;">
            	<c:forEach items="${sqUser.invests }" var="invests">
					<c:choose>
						<c:when test="${invests.tz_state=='投标中' }">
						<li><span class="investnote-w1"><fmt:formatDate value="${invests.tz_time }" pattern="yyyy-MM-dd"/></span>
							<span class="investnote-w2">${invests.loan.loan_name }</span>
							<span class="investnote-w3">${invests.tz_state }</span>
							<span class="investnote-hbw4">${invests.tz_money }</span>
							<span class="investnote-hbw5">${invests.accrualt }</span>
							<span class="investnote-hbw6"><a href="trans/PersonalCenter/deleteInvest/${sqUser.user_id }/${invests.tz_dd_id}">删除</a></span></li>
						</c:when>
					</c:choose>
            	</c:forEach>
            </ul>
            <ul id="investnote-list2" style="display: none;">
            	<c:forEach items="${sqUser.invests }" var="invests">
					<c:choose>
						<c:when test="${invests.tz_state=='回款中' }">
						<li><span class="investnote-w1"><fmt:formatDate value="${invests.tz_time }" pattern="yyyy-MM-dd"/></span>
							<span class="investnote-w2">${invests.loan.loan_name }</span>
							<span class="investnote-w3">${invests.tz_state }</span>
							<span class="investnote-hbw4">${invests.tz_money }</span>
							<span class="investnote-hbw5">${invests.accrualt }</span>
							<span class="investnote-hbw6"><a href="trans/PersonalCenter/deleteInvest/${sqUser.user_id }/${invests.tz_dd_id}" onclick="return confirm('确认删除？')">删除</a></span></li>
						</c:when>
					</c:choose>
            	</c:forEach>
            </ul>
            <ul id="investnote-list3" style="display: none;">
            	<c:forEach items="${sqUser.invests }" var="invests">
					<c:choose>
						<c:when test="${invests.tz_state=='已结束' }">
						<li><span class="investnote-w1"><fmt:formatDate value="${invests.tz_time }" pattern="yyyy-MM-dd"/></span>
							<span class="investnote-w2">${invests.loan.loan_name }</span>
							<span class="investnote-w3">${invests.tz_state }</span>
							<span class="investnote-hbw4">${invests.tz_money }</span>
							<span class="investnote-hbw5">${invests.accrualt }</span>
							<span class="investnote-hbw6"><a href="trans/PersonalCenter/deleteInvest/${sqUser.user_id }/${invests.tz_dd_id}">删除</a></span></li>
						</c:when>
					</c:choose>
            	</c:forEach>
            </ul>
          </div>
          </span>
        </form>
        <!--<div style=" width:760px;height:200px;padding-top:100px; text-align:center;color:#d4d4d4; font-size:16px;">
								 <img src="images/nondata.png" width="60" height="60"><br><br>
								   暂无投资记录</div>-->
      </div>
    </div>
    
    <div class="clear"></div>
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
