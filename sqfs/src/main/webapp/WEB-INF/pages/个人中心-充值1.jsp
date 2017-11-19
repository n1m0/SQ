﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
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
<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
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
        <li class=""><span><a href="trans/PersonalCenter/OpenThirdParty/${sqUser.user_id}"><i class="dot dot02"></i>开通第三方</a> </span> </li>
        <li><span><a href="trans/PersonalCenter/Recharge/${sqUser.user_id }/2"><i class="dot dot03"></i>充值</a></span></li>
        <li class=""><span><a href="trans/PersonalCenter/Withdraw/${sqUser.user_id }/2"><i class="dot dot04"></i>提现</a></span></li>
        <li><span><a href="trans/PersonalCenter/accountSetting/${sqUser.user_id }"><i class="dot dot09"></i>账户设置</a></span></li>
      </ul>
    </div>
    <label id="typeValue" style="display:none;"> </label>
    <script>
		$(function(){
		    $('.quick-tit').click(function(){
		      
		      $(this).addClass('pay-cur');
		      $(this).siblings().removeClass('pay-cur');
		      $('.quick-main').show();
		      $('.online-main').hide();
		      
		      $(".pay-tipcon").hide();
		      $(".pay-tipcon2").show();

		    })

		    $('.online-tit').click(function(){
		      
		      $(this).addClass('pay-cur');
		      $(this).siblings().removeClass('pay-cur');
		      $('.quick-main').hide();
		      $('.online-main').show();

		      $(".pay-tipcon2").hide();
		      $(".pay-tipcon").show();
		    })
	  });
		//<![CDATA[
			function showSpan(op){
				$("body").append("<div id='mask'></div>");
				$("#mask").addClass("mask").css("display","block");
	
				$("#"+op).css("display","block");
			}
	
			function displaySpan(op){
				$("#mask").css("display","none");
				$("#"+op).css("display","none");
			}
		//]]>
		</script>
    <script>
			//<![CDATA[
			function checkRecharge() {
				var moneyRegex="^(([1-9]+[0-9]*)|((([1-9]+[0-9]*)|0)\\.[0-9]{1,2}))$";
				var money = $("#recharge\\:actualMoney").val();
				var nullFlag=(money=="")||money<=0;
				var numberFlag=isNaN(money);
				//如果输入为空
				if(nullFlag)
				{
					var $span = "<em></em>请输入金额";
					$("#actualMoneyErrorDiv")/home($span);
					return false;
				}
				else
				{
					$("#actualMoneyErrorDiv")/home("");
				}
				//如果输入的不是数字
				if(numberFlag)
				{
					var $span = "<em></em>请输入数字</span>";
					$("#actualMoneyErrorDiv")/home($span);
					return false;
				}
				else
				{
					$("#actualMoneyErrorDiv")/home("");
				}
				//输入金额是否合法
				var moneyPattern = new RegExp(moneyRegex);
		    	var legalFlag=moneyPattern.test(money);
				if(!legalFlag)
				{
					var $span = "<em></em>金额必须大于0且为整数或小数，小数点后不超过2位</span>";
					$("#actualMoneyErrorDiv")/home($span);
					return false;		
				}
				else
				{
					$("#actualMoneyErrorDiv")/home("");
				}
				return true;
			}
			function validateAgree()
			{
				var $checkname=$("#bank-check").children("b").hasClass("selected");
				if(!($checkname))
				{
					return false;
				}
				else
				{
					return true;		
				}
			}
			function getShowPayVal(){
				var rechargeFlag=checkRecharge();
				var agreeFlag=validateAgree();
				flag=rechargeFlag&&agreeFlag;
				$("#recharge\\:rechargeWay").val($("#showpay")/home());
				var bankProtocol = $("#bankProtocol").attr('class');
				if(!bankProtocol)
				{
					$("#bankProtocol_message").show();
					 return false;
				}
				return flag;
			}
			
			
			function amount(th){
			    var regStrs = [
			        ['^0(\\d+)$', '$1'], //禁止录入整数部分两位以上，但首位为0
			        ['[^\\d\\.]+$', ''], //禁止录入任何非数字和点
			        ['\\.(\\d?)\\.+', '.$1'], //禁止录入两个以上的点
			        ['^(\\d+\\.\\d{2}).+', '$1'] //禁止录入小数点后两位以上
			    ];
			    for(i=0; i<regStrs.length; i++){
			        var reg = new RegExp(regStrs[i][0]);
			        th.value = th.value.replace(reg, regStrs[i][1]);
			    }
			    if(th.value>9999999.99){
			    	th.value = th.value.substr(0,th.value.length-1);
			    }
			}

			//验证输入银行卡号的合法性
			function checkBankCardNo() {
				//$("#form\\:defaultBankName").text("");
				var cardNo = $("#form\\:bankCardNo").val(); 
				var reg = /^\d{16,19}$/g; // 以19位数字开头，以19位数字结尾 
				if( !reg.test(cardNo) ) 
				{ 
					//$(".info2-bank").css({"display":"none"});
				    var $span = "<em></em>银行卡号输入错误";
				    $("#bankCardError")/home($span);
					return false;		
				} else{
					//$(".info2-bank").css({"display":"block"});
					$("#bankCardError")/home("");
				}
				return true;
			}
			function checkBank() {
				$("#form\\:defaultBankName").text("");
				var cardNo = $("#form\\:bankCardNo").val(); 
				var reg = /^\d{16,19}$/g; // 以19位数字开头，以19位数字结尾 
				if( !reg.test(cardNo) ) 
				{ 
					$(".info2-bank").css({"display":"none"});
					return false;		
				} else{
					$(".info2-bank").css({"display":"block"});
				}
				return true;
			}

			function validateAgree2()
			{
				var $checkname=$("#bank-check2").children("b").hasClass("selected");
				if(!($checkname))
				{
					showSpan('alert-tyht');
					return false;
				}
				else
				{
					return true;		
				}
			}
			
			function checkRecharge1() {
				var moneyRegex="^(([1-9]+[0-9]*)|((([1-9]+[0-9]*)|0)\\.[0-9]{1,2}))$";
				var money = $("#form\\:actualMoney1").val();
				var nullFlag=(money=="")||money<=0;
				var numberFlag=isNaN(money);
				//如果输入为空
				if(nullFlag)
				{
					var $span = "<em></em>请输入充值金额";
					$(".quick-error")/home($span);
					return false;
				}
				else
				{
					$(".quick-error")/home("");
				}
				//如果输入的不是数字
				if(numberFlag)
				{
					var $span = "<em></em>请输入数字";
					$(".quick-error")/home($span);
					return false;
				}
				else
				{
					$(".quick-error")/home("");
				}
				//输入金额是否合法
				var moneyPattern = new RegExp(moneyRegex);
		    	var legalFlag=moneyPattern.test(money);
				if(!legalFlag)
				{
					var $span = "<em></em>金额必须大于0且为整数或小数，小数点后不超过2位";
					$(".quick-error")/home($span);
					return false;		
				}
				else
				{
					$(".quick-error")/home("");
				}

				if(parseInt(money) > 50000){
					var $span = "<em></em>充值金额超过50000元";
					$(".quick-error")/home($span);
					return false;
				}else
				{
					$(".quick-error")/home("");
				}
				return true;
			}

			function getShowPayVal1(){
				var money = $("#form\\:actualMoney1").val();
				money = money * 1;
				if(money < 0) {
					confirm('充值金额必须大于0!');
					return false;
				}
				var rechargeFlag=checkRecharge1();
				var bankCardFlag = checkBankCardNo();
				var agreeFlag=validateAgree2();
				var payflag=rechargeFlag && bankCardFlag && agreeFlag;
				var defaultBankName = $("#form\\:defaultBankName").text();
				if(defaultBankName.replace(/(^\s*)|(\s*$)/g, "")=="此银行暂不支持"){
					var $span = "<em></em>此银行暂不支持";
					$(".quick-error3")/home($span);
					return false;
				}
				return payflag;
			}

			function checkRecharge2() {
				var moneyRegex="^(([1-9]+[0-9]*)|((([1-9]+[0-9]*)|0)\\.[0-9]{1,2}))$";
				var money = $("#form2\\:actualMoney2").val();
				var nullFlag=(money=="")||money<=0;
				var numberFlag=isNaN(money);
				//如果输入为空
				if(nullFlag)
				{
					var $span = "<em></em>请输入充值金额";
					$("#quick-error2")/home($span);
					return false;
				}
				else
				{
					$("#quick-error2")/home("");
				}
				//如果输入的不是数字
				if(numberFlag)
				{
					var $span = "<em></em>请输入数字";
					$("#quick-error2")/home($span);
					return false;
				}
				else
				{
					$("#quick-error2")/home("");
				}
				//输入金额是否合法
				var moneyPattern = new RegExp(moneyRegex);
		    	var legalFlag=moneyPattern.test(money);
				if(!legalFlag)
				{
					var $span = "<em></em>金额必须大于0且为整数或小数，小数点后不超过2位";
					$("#quick-error2")/home($span);
					return false;		
				}
				else
				{
					$("#quick-error2")/home("");
				}

				if(parseInt(money) > 50000){
					var $span = "<em></em>充值金额超过50000元";
					$("#quick-error2")/home($span);
					return false;
				}else
				{
					$("#quick-error2")/home("");
				}
				return true;
			}

			function getShowPayVal2(){
				var rechargeFlag=checkRecharge2();
				var agreeFlag=validateAgree2();
				var payflag=rechargeFlag && agreeFlag;
				return payflag;
			}

			
			$(document).ready(function(){
				  if("false"=='true'){
					 showSpan("alert-ClickDialog");
				  } 
				  if("false"=='true'){
						 showSpan("alert-unbindMsgDialog");
					  } 
			 });
			//]]>
		</script>
    <div class="personal-main">
      <div class="personal-pay">
        <h3><i>充值</i></h3>
        <div class="quick-pay-wrap">
          <h4> <span class="quick-tit pay-cur"><em>快捷支付</em></span></h4>
          <form id="form" name="form" method="post" action="trans/PersonalCenter/Recharge/${sqUser.user_id }/1" >
            <div class="quick-main">
              <div class="fl quick-info">
                <div class="info-1"> <span class="info-tit">充值金额</span> <span class="info1-input">
                  <input id="form:actualMoney1" type="text" name="money" class="pay-money-txt" maxlength="10" >
                  <em>元</em> </span> <span class="quick-error"> </span> </div>
                <div class="info-2"> <span class="info-tit">银行卡号</span> <span class="info2-input">
                  <input id="form:bankCardNo" type="text" name="bankCard" class="tx-txt">
                  <em class="info2-bank" style="display: none;">
                  <label id="form:defaultBankName" style="font-size:16px;"> </label>
                  </em> </span> <span class="quick-error3" id="bankCardError"></span> </div>
                <div class="bank-check" id="bank-check2"> <b class="selected" id="bankProtocol1"></b><span class="bank-agree">我同意并接受<a href="公司简介/home" target="_blank">《SQ金服投资咨询与管理服务电子协议》</a></span> <span class="error" id="bankProtocol_message" style="display:none;margin-top:-3px;">请同意协议内容！</span> </div>
                <input type="submit" name="" value="充值" class="btn-paycz" onclick="return getShowPayVal1()">
              </div>
            </div>
          </form>
          
          <div class="pay-tipcon" style="display:none;"> <b>充值提示：</b><br>
            1．SQ金服充值过程免费，不向用户收取任何手续费。<br>
            2．为了您的账户安全，请在充值前进行身份认证、手机绑定以及交易密码设置。<br>
            3．您的账户资金将通过丰付支付第三方平台进行充值。<br>
            4．请注意您的银行卡充值限制，以免造成不便。<br>
            5．如果充值金额没有及时到账，请联系客服—400-999-8850 </div>
          <div class="pay-tipcon2"> <b>温馨提示：</b><br>
            1. 投资人充值过程全程免费，不收取任何手续费。<br>
            2. 为防止套现，所充资金必须经投标回款后才能提现。<br>
            3. 使用快捷支付进行充值，可能会受到不同银行的限制，如需大额充值请使用网银充值进行操作。<br>
            4. 充值/提现必须为银行借记卡，不支持存折、信用卡充值。<br>
            5. 严禁利用充值功能进行信用卡套现、转账、洗钱等行为，一经发现，将封停账号30天。<br>
            6. 充值期间，请勿关闭浏览器，待充值成功并返回首页后，所充资金才能入账，如有疑问，请联系客服。<br>
            7. 充值需开通银行卡网上支付功能，如有疑问请咨询开户行客服。<br>
          </div>
        </div>
      </div>
      <div class="alert-450 alert-h220" id="alert-rechargeFailture" style="display:none;">
        <div class="alert-title">
          <h3>登录网上银行充值</h3>
          <span class="alert-close" onclick="displaySpan('alert-rechargeFailture')"></span></div>
        <div class="alert-main">
          <form id="rechargeFailtureForm">
            <p class="msg1"><i class="no-icon"></i><i class="msgtxt">充值失败</i>您可以：<a href="#"><font color="#28A7E1">选择其他银行充值</font></a>或查看<a href="#"><font color="#28A7E1">充值帮助</font></a></p>
          </form>
        </div>
      </div>
      <div class="clear"></div>
      <div class="alert-400 alert-h220" id="alert-ClickDialog" style="display:none;">
        <div class="alert-title">
          <h3>消息</h3>
        </div>
        <div class="alert-main">
          <p class="msg4"> </p>
          <p class="msg-a"><a class="btn-ok btn-145" onclick="displaySpan('alert-ClickDialog')" href="#">关 闭</a></p>
        </div>
      </div>
      <div class="alert-400 alert-h220" id="alert-unbindMsgDialog" style="display:none;">
        <div class="alert-title">
          <h3>消息</h3>
        </div>
        <div class="alert-main">
          <p class="msg4"> </p>
          <p class="msg-a"><a class="btn-ok btn-145" onclick="displaySpan('alert-unbindMsgDialog')" href="#">关 闭</a></p>
        </div>
      </div>
      <script type="text/javascript">
	        $("#recharge\\:actualMoney").val("单笔大于0元");
	        var value = "单笔大于0元";
	        $("#recharge\\:actualMoney").focus(
					   function(){
						   	$(this).css({"font-size":"24px","font-weight":"bold","font-family":"Arial","border":"1px solid #0caffe"});
						   if($("#recharge\\:actualMoney").val() == value) { 
							   	$("#recharge\\:actualMoney").val("")
								$(this).css({"font-size":"24px","font-weight":"bold","font-family":"Arial"});
						   }
						}).blur(
						function(){
						   $(this).css("border","1px solid #D0D0D0");
						   if($("#recharge\\:actualMoney").val() == "") {
							  $("#recharge\\:actualMoney").val("单笔大于0元").css("color", "#D0D0D0");
							   	$(this).css({"color":"#D0D0D0","font-size":"14px","font-weight":"normal"});
					}
				})
			
			$("#form\\:actualMoney1").val("单笔大于0元");
	        $("#form\\:actualMoney1").focus(
					   function(){
						   	$(this).css({"font-size":"24px","font-weight":"bold","font-family":"Arial","border":"1px solid #0caffe", "height":"38px"});
						   if($("#form\\:actualMoney1").val() == value) { 
							   	$("#form\\:actualMoney1").val("");
								$(this).css({"font-size":"24px","font-weight":"bold","font-family":"Arial", "height":"38px"});
						   }
						}).blur(
						function(){
						   $(this).css("border","1px solid #D0D0D0");
						   if($("#form\\:actualMoney1").val() == "") {
							  $("#form\\:actualMoney1").val("单笔大于0元").css("color", "#D0D0D0");
							  $(this).css({"color":"#D0D0D0","font-size":"14px","font-weight":"normal", "height":"38px"});
					}
				})
				
			$("#form2\\:actualMoney2").val("单笔大于0元");
	        $("#form2\\:actualMoney2").focus(
					   function(){
						   	$(this).css({"font-size":"24px","font-weight":"bold","font-family":"Arial","border":"1px solid #0caffe", "height":"38px"});
						   if($("#form2\\:actualMoney2").val() == value) { 
							   	$("#form2\\:actualMoney2").val("")
								$(this).css({"font-size":"24px","font-weight":"bold","font-family":"Arial", "height":"38px"});
						   }
						}).blur(
						function(){
						   $(this).css("border","1px solid #D0D0D0");
						   if($("#form2\\:actualMoney2").val() == "") {
							  $("#form2\\:actualMoney2").val("单笔大于0元").css("color", "#D0D0D0");
							   	$(this).css({"color":"#D0D0D0","font-size":"14px","font-weight":"normal", "height":"38px"});
					}
				})
				
				function keyUpcheck()
				{
					$(this).css({"font-size":"24px","font-weight":"bold","font-family":"Arial"});
				}

	        $("#form\\:bankCardNo").val("请输入银行卡号");
	        var cardValue = "请输入银行卡号";
	        $("#form\\:bankCardNo").focus(
					   function(){
						   	$(this).css({"font-size":"14px","font-weight":"bold","font-family":"Arial","border":"1px solid #0caffe", "color": "rgb(75, 73, 72)"});
						   if($("#form\\:bankCardNo").val() == cardValue) { 
							   	$("#form\\:bankCardNo").val("")
								$(this).css({"font-size":"14px","font-weight":"bold","font-family":"Arial"});
						   }
						}).blur(
						function(){
						   $(this).css("border","1px solid #D0D0D0");
						   if($("#form\\:bankCardNo").val() == "") {
							  $("#form\\:bankCardNo").val("请输入银行卡号").css("color", "#D0D0D0");
							   	$(this).css({"color":"#D0D0D0","font-size":"14px","font-weight":"normal"});
					}
				})
			</script>
      <div class="alert-450" id="alert-tyht" style="display:none;">
        <div class="alert-title">
          <h3>提示信息</h3>
          <span class="alert-close" onclick="displaySpan('alert-tyht')"></span></div>
        <div class="alert-main" style="margin-bottom: 35px;margin-left: 25px;">
          <p class="msg4"> 你需要阅读并同意《SQ金服金融投资咨询与管理服务电子协议》 </p>
        </div>
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
<script src="script/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="script/datepicker.js" type="text/javascript"></script>
</body>
</html>
