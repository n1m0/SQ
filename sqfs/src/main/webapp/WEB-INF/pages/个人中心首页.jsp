﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
	contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>
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
    <div class="personal-main">
      <link rel="stylesheet" type="text/css" href="css/fileupload.less.css">
      <style type="text/css">
		.ui-fileupload-choose{
			background:none;
			width: 90px; height: 90px;
			border:0px none;
		}
		.ui-icon{
			background:none;
			width:0px;height:0px;
		} 
	</style>
      <div class="pmain-profile">
        <div class="pmain-welcome"> <span class="fl"><span id="outLogin">晚上好，</span>${sqUser.user_name } 喝一杯下午茶，让心情放松一下~</span> <span class="fr">上次登录时间：
          2017-09-11 14:05:07 </span> </div>
        <div class="pmain-user">
          <div class="user-head"> <span id="clickHeadImage" class="head-img" title="点击更换头像">
            <form  method="post" action="">
              <input type="hidden" name="userPhotoUploadForm" value="userPhotoUploadForm">
              <span id="userPhotoUploadForm:photo"><img id="userPhotoUploadForm:photoImage" src="images/touxiang.png" alt="" style="width:88px;height:88px;z-index:0;"> <i class="headframe" style="z-index:0;"></i>-
              <div id="userPhotoUploadForm:shangchuan-btn" class="ui-fileupload ui-widget" style="z-index:0;">
                <div class="ui-fileupload-buttonbar ui-corner-top">
                	<span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left ui-fileupload-choose" role="button">
                	<span class="ui-button-icon-left ui-icon ui-c ui-icon-plusthick"></span>
                	<span class="ui-button-text ui-c"></span>
                  </span>
									<input type="file" id="userPhotoUploadInput"  style="z-index:0;opacity: 0">
                </div>
                <div class="ui-fileupload-content ui-widget-content ui-corner-bottom">
                  <table class="ui-fileupload-files">
                    <tbody>
                    </tbody>
                  </table>
                </div>
              </div>
              </span>
              <input type="hidden" name="javax.faces.ViewState" id="javax.faces.ViewState" value="2696547217205030168:-301641994240890871" autocomplete="off">
            </form>
            </span> <span class="head-icon"> <a href="#"><i title="第三方资金账户未认证" class="headiconbg headicon01"></i></a> <a href="#"><i class="headiconbg headicon2"></i></a> <a href="#"><i class="headiconbg headicon03"></i></a> </span> </div>
          <div class="user-info user-info1">
            <ul>
              <li>用户名<span>${sqUser.user_name }</span></li>
              <li>安全级别<span><i class="safe-level"><i class="onlevel" style="width:40%;"></i></i></span> <a href="#">[低]</a></li>
              <li>您还未开通第三方支付账户，请 <a class="pmain-log" href="#">立即开通</a>以确保您的正常使用和资金安全。 </li>
            </ul>
          </div>
        </div>
        <div class="pmain-money">
          <ul>
            <li class="none">
            	<span>
            		<em>账户总额</em>
            		<i id="zhze" class="markicon"></i>
            		<span class="arrow-show1" style="display:none;">可用余额+待收本息</span>
            		<span class="icon-show1" style="display:none;"></span>
            	</span>
           		<span class="truemoney">
           			<c:choose>
           				<c:when test="${sqUser.personalFund.account_balance != null and sqUser.personalFund.account_balance !=''  }">
           					<i class="f26 fb">${sqUser.personalFund.account_balance }</i>元
           				</c:when>
           				<c:otherwise>
           					<i class="f26 fb">0.00</i>元
           				</c:otherwise>
           			</c:choose>
           		</span>
            </li>
            <li>
            	<span>
            		<em>待收本息</em>
            		<i id="dsbx" class="markicon"></i>
            		<span class="arrow-show2" style="display:none;">未到账的投资项目的本金、利息总额</span>
            		<span class="icon-show2" style="display:none;"></span>
            	</span>
            	<span class="truemoney">
            		<c:choose>
            			<c:when test="${sqUser.personalFund.principalAndAccrualt != null and sqUser.personalFund.principalAndAccrualt !='' }">
           					<i class="f26 fb">${sqUser.personalFund.principalAndAccrualt }</i>元
	           			</c:when>
	           			<c:otherwise>
	           				<i class="f26 fb">0.00</i>元
	           			</c:otherwise>
            		</c:choose>
            	</span>
            </li>
            <li>
            	<span>
            		<em>累计收益</em>
            		<i id="ljsy" class="markicon"></i>
            		<span class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span>
            		<span class="icon-show3" style="display: none;"></span>
            	</span> 
            	<span class="truemoney">
            		<c:choose>
            			<c:when test="${sqUser.personalFund.totalAccrualt != null}">
        					<i class="f26 fb c-pink">${sqUser.personalFund.totalAccrualt }</i> 元
	       				</c:when>
	       				<c:otherwise>
	       					<i class="f26 fb">0.00</i>元
	       				</c:otherwise>
            		</c:choose>
            	</span>
            </li>
          </ul>
        </div>
      </div>
      <script type="text/javascript">
			//<![CDATA[
			       $(function(){
			    	   $("#clickHeadImage").click(function(){
			    		   $(this).find('span').removeClass('ui-state-hover');
			    		   document.getElementById("userPhotoUploadInput").click();
			    	   });
			    	   var safeLevel = "低";
			    	   if(safeLevel=="高"){
			    		   $(".pmain-user .user-info li .safe-level .onlevel").css("background-color","#f1483c");
			    	   }
			    	   
			    	   $("#clickHeadImage span").hover(function(){
			    		   $(this).removeClass('ui-state-hover');
			    	   });
			    	   
			    	   var myDate = new Date();
			    	   var h = myDate.getHours();
			    	   if(h>11 && h<19){
			    	   	 $("#outLogin").html("下午好，");
			    	   }else if(h>18){
			    	   	 $("#outLogin").html("晚上好，");
			    	   }else{
			    	   	 $("#outLogin").html("上午好，");
			    	   }
			       });
			//]]>           
		</script>
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
