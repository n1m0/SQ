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
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<style>
/*上下滚动*/
#scrollDiv {
	width: 400px;
	height: 30px;
	line-height: 30px;
	overflow: hidden;
}
#scrollDiv li {
	height: 30px;
	padding-left: 10px;
}
</style>
<script type="text/javascript">
// 上下滚动
function AutoScroll(obj) {
    $(obj).find("ul:first").animate({
        marginTop: "-25px"
    },
    500,
    function() {
        $(this).css({
            marginTop: "0px"
        }).find("li:first").appendTo(this);
    });
}
$(document).ready(function() {
    var myar = setInterval('AutoScroll("#scrollDiv")', 3000);
    $("#scrollDiv").hover(function() {
        clearInterval(myar);
    },
    function() {
        myar = setInterval('AutoScroll("#scrollDiv")', 3000)
    }); //当鼠标放上去的时候，滚动停止，鼠标离开的时候滚动开始
});
</script>
</head>
<body>
<header>
<a  href = "infor.jsp"></a>
  <div class="header-top min-width">
    <div class="container fn-clear"> <strong class="fn-left">咨询热线：400-668-6698<span class="s-time">服务时间：9:00 - 18:00</span></strong>
      <ul class="header_contact">
        <li class="c_1"> <a class="ico_head_weixin" id="wx"></a>
          <div class="ceng" id="weixin_xlgz" style="display: none;">
            <div class="cnr"> <img src="images/code.png"> </div>
            <b class="ar_up ar_top"></b> <b class="ar_up_in ar_top_in"></b> </div>
        </li>
        <li class="c_2"><a href="index" target="_blank" title="官方QQ" alt="官方QQ"><b class="ico_head_QQ"></b></a></li>
        <li class="c_4"><a href="index" target="_blank" title="新浪微博" alt="新浪微博"><b class="ico_head_sina"></b></a></li>
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
		          <div class="">当前用户${sessionScope.info.user_name }</div>
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
        <li> <a href="invest/investList" id="gotoInvest">我要投资</a> </li>
        <li> 
        	<a href="trans/loan5/home" id="gotoLoanPage">我要贷款</a>
       		 <input type="hidden" value="${sessionScope.info.user_checked } " id="user_check_info_flag"> 
        </li>
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
<!--banner-->
<div class="flexslider">
  <ul class="slides">
    <li style="background-image: url(images/banner8.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="index" target="_blank"></a></li>
    <li style="background-image: url(images/banner4.png); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="index" target="_blank"></a></li>
    <li style="background-image: url(images/banner.png); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="index" target="_blank"></a></li>
    <li style="background-image: url(images/banner3.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="index" target="_blank"></a></li>
  	<li style="background-image: url(images/banner5.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="index" target="_blank"></a></li>
    <li style="background-image: url(images/banner7.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="index" target="_blank"></a></li>
  </ul>
</div>
<script src="script/jquery.flexslider-min.js"></script>
<script>
$(function(){
    $('.flexslider').flexslider({
        directionNav: true,
        pauseOnAction: false
    });
    //产品列表滚动
    var pLength = $('.pListContentBox > li').length;
    var cishu = pLength-4;
    var n = 0;
    $('.pListContentBox').css({'width':pLength*245+'px'});
    if(pLength>4){
        $('.pListRight').addClass('curr');
    }
    $('.pListRight').on('click',function(){
        if(cishu>0){
            //alert('1');
            n++;
            cishu--;
            $('.pListContentBox').animate({'left':'-'+n*244+'px'},500);
            if(cishu==0){
                $('.pListRight').removeClass('curr');
            }
            if(n>0){
                $('.pListLeft').addClass('curr');
            }
        }
    });
    $('.pListLeft').on('click',function(){
        if(n>0){
            n--;
            cishu++;
            $('.pListContentBox').animate({'left':'-'+n*244+'px'},500);
            if(n==0){
                $('.pListLeft').removeClass('curr');
            }
            if(cishu>0){
                $('.pListRight').addClass('curr');
            }
        }
    });
    //alert(pLength);
});
</script>
<script type="text/javascript">
var gaintop;
$(function(){
	gaintop = $(".login_float").css("top");
	$(".login_float").css("top",-695);
	$(".login_float").show();
	$(".login_float").animate({top: gaintop,opacity:1},800);
    $(".login_float").animate({top: '-=12px',opacity:1},200);
    $(".login_float").animate({top: gaintop,opacity:1},200);
    $(".login_float").animate({top: '-=6px',opacity:1},200);
    $(".login_float").animate({top: gaintop,opacity:1},200);
    $(".login_float").animate({top: '-=2px',opacity:1},100);
    $(".login_float").animate({top: gaintop,opacity:1},100);
});

</script>
<div class="new-announcement">
  <div class="new-announcement-title">最新公告</div>
  <div class="new-announcement-content">
    <div id="scrollDiv">
      <ul style="margin-top: 0px;">
        <li><a class="black-link" href="网站公告/home" target="_blank"> 2017年11月16日还款公告</a></li>
        <li><a class="black-link" href="公司公告详细1/home" target="_blank"> 2018年元旦放假公告</a></li>
      </ul>
    </div>
    
  </div>
  <a class="more" href="网站公告/home">更多</a> </div>
  
  
  
  
  
<div class="feature"> <a class="fea1" href="index"> <i></i>
  <h3>高收益</h3>
  <span>年化收益率最高达“20%<br>
  50元起投，助您轻松获收益</span> </a> <a class="fea2" href="index"> <i></i>
  <h3>安全理财</h3>
  <span>100%本息保障<br>
  实物质押，多重风控审核</span> </a> <a class="fea3" href="index"> <i></i>
  <h3>随时赎回</h3>
  <span>两步赎回您的资金<br>
  最快当日到账</span> </a> <a class="fea4" href="index"> <i></i>
  <h3>随时随地理财</h3>
  <span>下载手机客户端<br>
  随时随地轻松理财</span> </a> </div>
<!--中间内容-->
<div class="main clearfix mrt30" data-target="sideMenu">
  <div class="wrap">
    <div class="page-left fn-left">
      <div class="mod-borrow">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-ttyx"></i>推荐项目</h2>
          <div class="fn-right f14 c-888">常规发标时间每天<span class="c-555">10:00，13:00和20:00</span>，其余时间根据需要随机发</div>
        </div>
        <div class="bd">
          <div class="des"><span class="fn-left">期限1-29天，期限短，收益见效快</span><a href="invest/investList" class="fn-right">查看更多&gt;&gt;</a></div>
          
          <div class="borrow-list">
           <ul>
           	<c:forEach items="${loanList}" var="n" varStatus="sta"  begin="0" end ="1">
              <li>
              	<c:if test="${n.loan_type eq '车易贷' }">
	          		<div class="title"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-che" title="车易贷"></i></a><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" class="f18" title="金女士车辆质押借款1万元" target="_blank">${n.loan_name }</a></div>
               </c:if>
	          	<c:if test="${n.loan_type eq '房易贷' }">
	          		<div class="title"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-fang" title="房易贷"></i></a><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" class="f18" title="金女士车辆质押借款1万元" target="_blank">${n.loan_name }</a></div>
               </c:if>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${n.loan_money }</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${n.rate.rate_num_i*100 }% </span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${n.rate.hk_time }</span>个月</td>
                      <td><div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb5">
                              <div class="show-bar">  ${n.yitou/n.loan_money*100 }% </div>
                            </div>
                          </div>
                        </div></td>
                      <td align="right"><a class="ui-btn btn-gray" href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }">${n.cd_state }</a> </td>
                    </tr>
                  </tbody>
                </table>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-yyyz"></i>政信贷</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">61.37万次</span>&nbsp;&nbsp;&nbsp;平均满标时间：<span class="c-555">1小时24分11秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"><span class="fn-left">期限1-12月，收益更高</span><a href="invest/investList" class="fn-right">查看更多&gt;&gt;</a></div>
          <div class="borrow-list">
          	 <ul>
           	<c:forEach items="${loanList}" var="n" varStatus="sta"  begin="2" end ="3">
              <li>
              	<c:if test="${n.loan_type eq '车易贷' }">
	          		<div class="title"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-che" title="车易贷"></i></a><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" class="f18" title="金女士车辆质押借款1万元" target="_blank">${n.loan_name }</a></div>
               </c:if>
	          	<c:if test="${n.loan_type eq '房易贷' }">
	          		<div class="title"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-fang" title="房易贷"></i></a><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" class="f18" title="金女士车辆质押借款1万元" target="_blank">${n.loan_name }</a></div>
               </c:if>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${n.loan_money }</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${n.rate.rate_num_i*100 }% </span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${n.rate.hk_time }</span>个月</td>
                      <td><div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb5">
                              <div class="show-bar">  ${n.yitou/n.loan_money*100 }% </div>
                            </div>
                          </div>
                        </div></td>
                      <td align="right"><a class="ui-btn btn-gray" href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }">${n.cd_state }</a> </td>
                    </tr>
                  </tbody>
                </table>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-nnyy"></i>实时变现</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">8.35万次</span>&nbsp;&nbsp;&nbsp;平均满标时间：<span class="c-555">1小时41分19秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"> <span class="fn-left">期限12-60月，打理更加容易</span><a href="invest/investList" class="fn-right">查看更多&gt;&gt;</a></div>
          <div class="borrow-list">
            <ul>
           	<c:forEach items="${loanList}" var="n" varStatus="sta"  begin="4" end ="5">
              <li>
              	<c:if test="${n.loan_type eq '车易贷' }">
	          		<div class="title"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-che" title="车易贷"></i></a><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" class="f18" title="金女士车辆质押借款1万元" target="_blank">${n.loan_name }</a></div>
               </c:if>
	          	<c:if test="${n.loan_type eq '房易贷' }">
	          		<div class="title"><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" target="_blank"><i class="icon icon-fang" title="房易贷"></i></a><a href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }" class="f18" title="金女士车辆质押借款1万元" target="_blank">${n.loan_name }</a></div>
               </c:if>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${n.loan_money }</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${n.rate.rate_num_i*100 }% </span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${n.rate.hk_time }</span>个月</td>
                      <td><div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb5">
                              <div class="show-bar">  ${n.yitou/n.loan_money*100 }% </div>
                            </div>
                          </div>
                        </div></td>
                      <td align="right"><a class="ui-btn btn-gray" href="invest/getInvestsListByLoanId?loan_dd_id=${n.loan_dd_id }">${n.cd_state }</a> </td>
                    </tr>
                  </tbody>
                </table>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="page-right fn-right" style="top: 0px;">
      <div class="mod-risk-tip"><i class="icon icon-tip"></i><a href="index" class="c-orange">收益与风险并存，请理性选择平台</a></div>
      <div class="mod mod-notice mrt20">
        <div class="hd">
          <h3>网站公告</h3>
          <a href="网站公告/home" class="fn-right">更多&gt;</a></div>
        <div class="bd">
          <div class="article-list clearfix">
            <ul>
              <li><a href="index" title="关于“金融产品”产品的说明">关于“金融产品”产品的说明</a><span class="date">11-15</span></li>
              <li><a href="index" title="2015年9月10日发标预告">2017年9月10日发标预告</a><span class="date">11-10</span></li>
              <li><a href="index" title="关于P2P理财平台新系统升级的公告">关于P2P理财平台新系统***</a><span class="date">11-02</span></li>
              <li><a href="index" title="关于债权贷新规调整实施的公告">关于债权贷新规调整实施的公告</a><span class="date">10-25</span></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod mod-rank clearfix ui-tab mrt20">
        <div class="hd">
          <h3>排行榜</h3>
          <div class="ui-tab-nav"> <i class="icon icon-cur"></i>
            <ul>
              <li class="active">收益</li>
              <li>投资</li>
            </ul>
            <a href="网站公告/home" class="fn-right">更多&gt;</a> </div>
        </div>
        <div class="bd">
          <div class="ui-tab-cont">
            <div class="ui-tab-item active">
              <ul class="rank-list">
                <li><span class="fl"><em class="n1">01</em>gz******</span><span class="fr">￥1,115,461.07</span></li>
                <li><span class="fl"><em class="n2">02</em>米克******</span><span class="fr">￥1,003,890.04</span></li>
                <li><span class="fl"><em class="n3">03</em>灵儿******</span><span class="fr">￥895,618.71</span></li>
                <li><span class="fl"><em class="n4">04</em>li******</span><span class="fr">￥795,154.06</span></li>
                <li><span class="fl"><em class="n5">05</em>豆芽******</span><span class="fr">￥747,154.44</span></li>
              </ul>
            </div>
            <div class="ui-tab-item">
              <ul class="rank-list">
                <li><span class="fl"><em class="n1">01</em>黄世******</span><span class="fr">￥78,714,974.00</span></li>
                <li><span class="fl"><em class="n2">02</em>一诺******</span><span class="fr">￥58,428,720.00</span></li>
                <li><span class="fl"><em class="n3">03</em>hj******</span><span class="fr">￥57,844,191.00</span></li>
                <li><span class="fl"><em class="n4">04</em>老马******</span><span class="fr">￥38,808,064.00</span></li>
                <li><span class="fl"><em class="n5">05</em>写意******</span><span class="fr">￥31,341,159.00</span></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="mod mod-report ui-tab clearfix mrt20">
        <div class="hd">
          <div class="ui-tab-nav"> <i class="icon icon-cur"></i>
            <ul>
              <li class="active"><a href="javascript:;">媒体报道</a></li>
              <li class=""><a href="javascript:;">理财知识</a></li>
            </ul>
          </div>
        </div>
        <div class="bd">
          <div class="ui-tab-cont">
            <div class="ui-tab-item active">
              <div class="headlines"> <img src="images/news1.jpg"> <a title="平台遭遇P2P滑稽抄袭" target="_blank" href="index">平台遭遇P2P滑稽抄袭</a><br>
                <span class="des">抄袭者居然把被抄袭者的名字一起抄下来，这样的乌龙抄袭你见过没...</span> </div>
              <div class="article-list">
                <ul>
                  <li>[凤凰网]<a href="index" title="平台携手哈工大关爱毕节留守儿童" target="_blank">平台携手哈工大关爱毕节留守儿童</a></li>
                  <li>[21CN财经]<a href="index" title="接受网贷之家专访" target="_blank">接受网贷之家专访</a></li>
                  <li>[和讯网]<a href="index" title="受邀参加中国财经峰会 斩获行业最具品牌影响力等两项大奖" target="_blank">受邀参加中国财经峰会 斩获行业最具品牌影响力等两项大奖</a></li>
                </ul>
              </div>
            </div>
            <div class="ui-tab-item">
              <div class="article-list">
                <ul>
                  <li>[<a href="index">P2P网贷</a>]<a href="index" title="随着互联网金融的快速发展，越来越多的人开始加入到p2p网贷投资行列，作为一种相对来说还比较新兴的理财产品" target="_blank"> 合肥p2p网贷哪家好，投资新人该如何选择p2p网贷平台</a></li>
                  <li>[<a href="index">外汇</a>]<a href="index" title="投资者应知道，外汇交易市场是一个保证金交易市场，投资者可以利用外汇保证金交易进行更有收益空间的交易" target="_blank"> 什么是外汇保证金交易有哪些方式</a></li>
                  <li>[<a href="index">外汇</a>]<a href="index" title="很多的投资者都听说过外汇保证金交易，他们都知道该交易方式可以让投资者有机会进行更有收益空间的交易" target="_blank"> 外汇保证金交易开户有什么样的具体优势呢？</a></li>
                  <li>[<a href="index">保险理财</a>]<a href="index" title="保险理财因为其特殊性而对人员专业知识、道德标准以及人生阅历提出了较高要求。但是我国的保险业人才还存在很多问题" target="_blank"> 保险公司存在的人才需求问题</a></li>
                  <li>[<a href="index">保险理财</a>]<a href="index" title="保险理财的专业人士缺乏已经成为我国保险公司个人理财业务发展的一大瓶颈，保险公司的员工要能够成为一个好的客户经理" target="_blank"> 保险理财产品销售人员需要具备的基本素质</a></li>
                  <li>[<a href="index">外汇</a>]<a href="index" title="外货期货也叫货币期货，所谓期货自然与现货有着明显的区别，外汇期货除了价格表现形式上与现货有所差异之外，外汇期货交易是用一种货币按照汇率兑换成另一种货币的期货合约" target="_blank"> 什么是外汇期货及其套利形式介绍</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="mrt20 mod"> <a href="计算器1/home"><img src="images/pic_home_js.jpg" width="300" height="80" alt="收益计算器" class="pic"></a></div>
    </div>
  </div>
</div>
<script src="script/index.js"></script>
<div class="partners wrap clearfix mrb30">
  <div class="partners-inner ui-tab">
    <div class="hd">
      <div class="ui-tab-nav"> <i class="icon icon-cur" style="left: 151px;"></i>
        <ul>
          <li class=""><a href="index">合作机构</a></li>
          <li class="active"><a href="index">友情链接</a></li>
        </ul>
      </div>
    </div>
    <div class="bd">
      <div class="ui-tab-cont">
        <div class="ui-tab-item active">
          <div class="img-scroll">
            <div class="container">
              <ul>
                <li><img src="images/logo_sbcvc.png" width="152" height="52" alt="软银"></li>
                <li><img src="images/logo_abc.png" width="152" height="52" alt="农业银行"></li>
                <li><img src="images/logo_wdzj.png" width="152" height="52" alt="网贷之家"></li>
                <li><img src="images/logo_baidu.png" width="152" height="52" alt="百度"></li>
                <li><img src="images/logo_aqb.png" width="152" height="52" alt="安全宝"></li>
                <li><img src="images/logo_gds.png" width="152" height="52" alt="万国数据"></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="ui-tab-item">
          <div class="links"> <a target="_blank" href="http://www.wd361.com">网贷互联</a> <a target="_blank" href="http://www.bjzq.com.cn">北京证券网</a> <a target="_blank" href="http://v.yidai.com/">易贷微理财</a> <a target="_blank" href="http://www.wangdaicaifu.com">P2P</a> <a target="_blank" href="http://www.wangdaibangshou.com">网贷帮手</a> <a target="_blank" href="https://www.okcoin.cn">比特币网</a> <a target="_blank" href="http://www.p2p110.com">网贷110</a> <a target="_blank" href="http://www.zcmall.com">招财猫理财</a> </div>
        </div>
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
          <div class="ft-serv-handle clearfix"><a class="icon-hdSprite icon-ft-sina a-move a-moveHover" title="SQ金服新浪微博" target="_blank" href="index"></a><a class="icon-hdSprite icon-ft-qqweibo a-move a-moveHover" title="SQ金服腾讯微博" target="_blank" href="index"></a><a class="icon-ft-qun a-move a-moveHover" title="SQ金服QQ群" target="_blank" href="index"></a><a class="icon-hdSprite icon-ft-email a-move a-moveHover mrn" title="SQ金服email" target="_blank" href="mailto:xz@yirenbao.com"></a></div>
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
    <div class="ft-approve clearfix"><a class="icon-approve approve-0 fadeIn-2s" target="_blank" href="index"></a><a class="icon-approve approve-1 fadeIn-2s" target="_blank" href="index"></a><a class="icon-approve approve-2 fadeIn-2s" target="_blank" href="index"></a><a class="icon-approve approve-3 fadeIn-2s" target="_blank" href="index"></a></div>
    <div class="ft-identity">©2017 SQ金服 All rights reserved&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;广东省SQ金服投资管理有限公司&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.miitbeian.gov.cn/">粤ICP备12345678号-1</a></div>
  </div>
</div>
</body>
</html>
