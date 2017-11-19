<%@page import="com.sqfs.utils.PageUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
	contentType="text/html; charset=utf-8" %>
<%@ page import="com.sqfs.utils.PageUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>
<script type="text/javascript" src="js/list.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script type="text/javascript">
function jumpTo(){
	var pag=$("#jump").val();
	if(pag>=1&&pag<=<%=PageUtil.totalPage%>){
		location.href="<%=basePath%>invest/investList?currentPage="+pag;
	}else{
		alert("输入信息有误,请重新输入");
	}
} 
</script>
<style type="text/css">
		td{
			text-align: center;
		}
		#jump {width: 30px;text-align: center;}
		#sele {width: 30px;text-align: center;}
        .butto:focus {
            outline: none;
            border-color: #9ecaed;
            box-shadow: 0 0 10px #9ecaed;
        }

        .button{
            padding: 0 16px;
            -webkit-appearance: none;
            background: #859ab4;
            border: none;
            border-radius: 2px;
            color: #fff;
            cursor: pointer;
            height: 26px;
            font-family: 'Open Sans', sans-serif;
            font-size: 1.1em;
            letter-spacing: 0.05em;
            text-align: center;
            text-transform: uppercase;
            transition: background 0.3s ease-in-out;
            width: 87px;
        }
        .button:hover {
            background: #738fb2;
        }
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
<!--列表-->
<div class="page-filter wrap">
  <div class="breadcrumbs"><a href="index">首页</a>&gt;<span class="cur">散标投资列表</span></div>
  <div class="invest-filter" data-target="sideMenu">
    <div class="filter-inner clearfix">
			<form action="<%=basePath%>invest/investList" method="post" id="fy">
				<input type="hidden" name="currentPage" id="currentPage" value="<%=PageUtil.currentPage%>">
				<input type="hidden" name="totalPage" id="totalPage" value="<%=PageUtil.totalPage%>">
				<%-- 书名:<input type="text" name="name" value="${name }">
				类型:<input type="text" name="tName" value="${tName }"> --%>
				      <div class="filter-item">
				        <div class="hd">
				          <h3>筛选投资项目</h3><input id="sousuo" type="button" class="button" value="搜索" onclick="firstPage()">
				        </div>
				        <div class="bd">
				          <dl>
				            <dt>项目类型</dt>
				            <dd>
				              <ul>
				                <li class="n1"><input type="radio" name="loan_type" value="不限" id="post_type_" checked="checked">不限</li>
				                <li class="n2"><input type="radio" name="loan_type" value="车易贷" id="post_type_car">车易贷</li>
				                <li class="n3"><input type="radio" name="loan_type" value="房易贷"  id="post_type_house">房易贷</li>
				              </ul>
				            </dd>
				          </dl>
				          <dl>
				            <dt>年利率</dt>
				            <dd>
				              <ul>
				              <li class="n1"><input type="radio" name="rate_num_i" value="rate0" id="borrow_interestrate_" checked="checked">不限</li>
				              <li class="n2"><input type="radio" name="rate_num_i"  value="rate1" id="borrow_interestrate_1" >6%及以下</li>
				              <li class="n3"><input type="radio" name="rate_num_i" value="rate2" id="borrow_interestrate_2" >7%-9%</li>
				              <li class="n4"><input type="radio" name="rate_num_i" value="rate3" id="borrow_interestrate_3" >9%-11%</li>
				              <li class="n5"><input type="radio" name="rate_num_i" value="rate4"  id="borrow_interestrate_4" >12%及以上</li>
				              </ul>
				            </dd>
				          </dl>
				          <dl>
				            <dt>期限</dt>
				            <dd>
				              <ul >
				              	<li class="n1"><input type="radio" name="rate_id" value="val0" id="spread_month_" checked="checked">不限</li>
				              <li class="n2"><input type="radio" name="rate_id" value="val1" id="spread_month_1" >1个月及以下</li>
				              <li class="n3"><input type="radio" name="rate_id" value="val2" id="spread_month_2" >2-3个月</li>
				              <li class="n4"><input type="radio" name="rate_id" value="val3" id="spread_month_3" >4-6月</li>
				              <li class="n5"><input type="radio" name="rate_id" value="val4" id="spread_month_4" >7-11月</li>
				              <li class="n6"><input type="radio" name="rate_id"  value="val5" id="spread_month_5" >12个月及以上</li>
				              </ul>
				            </dd>
				          </dl>
				        </div>
				      </div>

<input id="type1" type="hidden" value="${loan_type}"> 
<input id="type2" type="hidden" value="${rate_num_i}"> 
<input id="type3" type="hidden" value="${rate_id}"> 
</form> 
      <div class="common-problem">
        <h3>常见问题</h3>
        <ul>
          <li><a href="<%=basePath %>c/faq">什么是车易贷？</a></li>
          <li><a href="<%=basePath %>c/faq">什么是房易贷？</a></li>
          <li><a href="<%=basePath %>c/faq">SQ金服理财收费标准</a></li>
          <li><a href="<%=basePath %>c/faq">车易贷、房易贷有什么区别？</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="invest-list mrt30 clearfix">
    <div class="hd">
      <h3>投资列表</h3>
      <div class="count">
        <ul>
          <li class="line">散标投资交易金额&nbsp;&nbsp;<span class="f20 bold">73.54亿元</span></li>
          <li>累计赚取收益&nbsp;&nbsp;<span class="f20 bold">2.52亿元</span></li>
        </ul>
      </div>
    </div>
    <div class="bd">
      <div class="invest-table clearfix">
        <div class="title clearfix">
          <ul>
            <li class="col-330">借款标题</li>
            <li class="col-180"><a href="javascript:url('order','account_up');" class="">借款金额</a> </li>
            <li class="col-110"><a href="javascript:url('order','apr_up');" class="">年利率</a> </li>
            <li class="col-150"><a href="javascript:url('order','period_up');" class="">借款期限</a> </li>
            <li class="col-150">还款方式</li>
            <li class="col-120"><a href="javascript:url('order','scale_up');" class="">借款进度</a></li>
            <li class="col-120-t">操作</li>
          </ul>
        </div>
      <!------------投资列表-------------->
		<div class="item">
		<c:forEach items="${loanList}" var="n" varStatus="sta">
          <ul>
          	<c:if test="${n.loan_type eq '车易贷' }">
          		  <li class="col-330 col-t"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-che" title="车易贷"></i></a><a class="f18" href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" title="赵女士长安福特福克斯汽车质押贷款4万元" target="_blank">${n.loan_name }</a></li>
          	</c:if>
          	<c:if test="${n.loan_type eq '房易贷' }">
          		  <li class="col-330 col-t"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-fang" title="房易贷"></i></a><a class="f18" href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" title="赵女士长安福特福克斯汽车质押贷款4万元" target="_blank">${n.loan_name }</a></li>
          	</c:if>
            <li class="col-180"><span class="f20 c-333">${n.loan_money }</span>元</li>
            <li class="col-110 relative"><span class="f20 c-orange">${n.rate.rate_num_i*100 }%</span></li>
            <li class="col-150"> <span class="f20 c-333">${n.rate.hk_time }</span>个月 </li>
            <li class="col-150">${n.hk_type}</li>
            <li class="col-120">
              <div class="circle">
                <div class="left progress-bar">
                  <div class="progress-bgPic progress-bfb10">
                    <div class="show-bar"> ${n.yitou/n.loan_money*100 }% </div>
                  </div>
                </div>
              </div>
            </li>
            <li class="col-120-2"> <a class="ui-btn btn-gray" href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" >${n.cd_state }</a> </li>
          </ul>
		</c:forEach>
 	</div>
        <!------------上一页,下一页,跳转-------------->
      </div>
      <div class="pagination clearfix mrt30"> <span class="page"><a href="javascript:firstPage()" onclick="">首页</a><a href="javascript:upPage()" onclick="">上一页</a>&nbsp;<a href="javascript:nextPage()"onclick="#">下一页</a><a href="javascript:lastPage()" onclick="#">尾页</a>&nbsp;
       <em>当前第<%=PageUtil.currentPage%>页&nbsp;</em>
      <em>共<%=PageUtil.totalPage%>页&nbsp;</em></span>
        	 跳转至&nbsp;&nbsp;<input type="text" id="jump" name="currentPage" value="${currentPage }">&nbsp;&nbsp;页
				<input type="button" value="GO" onclick="jumpTo()" />
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
