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
<title>投资产品详情</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="css/detail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="js/touzi.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>
<script src="script/ablumn.js"></script>
<script src="script/plugins.js"></script>
<!-- <script src="script/detail.js"></script> -->
<link href="css/touzi.css" rel="stylesheet" type="text/css">
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
<!--信息详细-->
<div class="item-detail wrap">
  <div class="breadcrumbs"> <a href="index">首页</a>&gt; <a href="#">散标投资列表</a>&gt; <span class="cur">项目详情</span> </div>
  <div class="item-detail-head clearfix" data-target="sideMenu">
    <div class="hd">
    
    
    <c:if test="${loan.loan_type eq '车易贷' }">
         <a href="infor/home" target="_blank"><i class="icon icon-che" title="车易贷"></i></a><a class="f18" href="infor/home" title="赵女士长安福特福克斯汽车质押贷款4万元" target="_blank">${loan.loan_name }</a></li>
     </c:if>
          	<c:if test="${loan.loan_type eq '房易贷' }">
          		  <a href="infor/home" target="_blank"><i class="icon icon-fang" title="房易贷"></i></a><a class="f18" href="infor/home" title="赵女士长安福特福克斯汽车质押贷款4万元" target="_blank">${loan.loan_name }</a></li>
          	</c:if>
    
    
    
    
   <!--   <i class="icon icon-che" title="车易贷"></i> -->
      
    </div>
    <div class="bd clearfix">
      <div class="data">
        <ul>
          <li> <span class="f16">借款金额</span><br>
            <span class="f30 c-333" id="account">${loan.loan_money }</span>元 </li>
          <li class="relative"><span class="f16">年利率</span><br>
          <input id="lilv" type="hidden" value="${loan.rate.rate_num_i*100}"> 
            <span class="f30 c-orange">${loan.rate.rate_num_i*100 }% </span> </li>
          <li><span class="f16">借款期限</span><br>
            <span class="f30 c-333" id="qixian">${loan.rate.hk_time }</span>个月 </li>
          <li><span class="c-888">借款编号：</span>${loan.loan_num }</li>
          <li><span class="c-888">发标日期：</span><fmt:formatDate value="${loan.release_date }" pattern="yyyy-MM-dd"/></li>
          <li><span class="c-888">保障方式：</span>100%本息垫付</li>
          <li><span class="c-888">还款方式：</span>${loan.hk_type}</li>
          <li><span class="c-888">需还本息：</span> ${loan.repayment.yh_benjin+loan.repayment.yh_lixi }元 </li>
          <li><span class="c-888">借款用途：</span>${loan.loan_use}</li>
          <li class="colspan"> <span class="c-888 fl">投标进度：</span>
            <div class="progress-bar fl"> <span style="width:${loan.yitou/loan.loan_money*100 }%"></span> </div>
            <span class="c-green">${loan.yitou/loan.loan_money*100 }%</span> </li>
          <li> <span class="c-888">可投资范围：</span> <span id="account_range"> ${loan.min_money }元~
            ${loan.loan_money-loan.yitou }元 </span> </li>
        </ul>
      </div>
      <c:if test="${loan.cd_state eq '筹款中' }">
      <div id="touzidiv" >
		<form action="invest/add" method="post" id="liji" onsubmit="return checkSubmit()">
			<input type="hidden" name="loan_dd_id" value="${loan.loan_dd_id }"/>
            <input type="hidden" name="tz_state" value="${loan.dd_state }"/>
            <input type="hidden" id="sytzje" value="${loan.loan_money-loan.yitou } " name="sytzje"/>
            <input type="hidden" id="minMoney" value="${loan.min_money }"/>
            <input type="hidden" id="loanUser" value="${info.t_name }"/>
            <input type="hidden" id="token" name="token" value="${token}"/>
            <input type="hidden" name="accrualt" id="accru"/>
			<table cellpadding="0" cellspacing="0px"   style="line-height:60px; ">
				<tr>
					<td width="7%">账户余额:<span id="yue">${info.account_balance }</span>元</td>
					<td  width="5%"><a href="trans/PersonalCenter/Recharge/${info.user_id }/2"><span id="chongzhi">[充值]</span></a></td>
				</tr>
				<tr>
					<td>投资金额:<input id="tzje" type="text" name="tz_money" onmouseout="huodeshouyi()"/></td>
				</tr>
				<tr>
					<td>预计利息收益:<span id="shouyi">0.00元</span></td>
				</tr>
				<tr>
					<td align="center"><font color="red" id="err" ></font></td>
				</tr>
				<tr>
				
					<td align="center">
						<input type="hidden" value="${sessionScope.info.user_checked } " id="user_check_info_flag"> 
						<input id="lijitouzi" type="submit" class="button green" value="立即投资" onclick="return _doInvest();"/>
					</td>
				</tr>
			</table>
		</form>
		</div>
      </c:if>
		
		
       </div>
  </div>
      
      
      <!-- <div class="mod-right mod-status">
        <div class="inner">
          <div class="text"> 待还本息：<span class="f24 c-333">40,400.00</span>元<br>
            剩余期限：<span class="f24 c-333">29天</span> <br>
            下期还款日： <span class="f20 c-333">2017-10-13</span> </div>
          <i class="icon icon-status icon-status2"></i> </div> 
      </div> -->
  
  <div class="item-detail-body clearfix mrt30 ui-tab">
    <div class="ui-tab-nav hd"> <i class="icon-cur" style="left: 39px;"></i>
      <ul>
        <li class="nav_li active" id="nav_1"><a href="javascript:;">借款信息</a></li>
        <li class="nav_li" id="nav_2"><a href="javascript:;">投资记录</a> <i class="icon icon-num1" style="margin-left: -15px;"> <span id="tender_times">23</span> <em></em> </i> </li>
        <li class="nav_li" id="nav_3"><a href="javascript:;">还款列表</a></li>
      </ul>
    </div>
    <div class="bd">
      <div class="ui-tab-item active" style="display: block;">
        <div class="borrow-info">
          <dl class="item">
            <dt>
              <h3>借款人介绍</h3>
            </dt>
            <dd>
              <div class="text">
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 借款人信息介绍：</p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 借款人${loan.sqUser.t_name }，<span><fmt:formatDate value="${loan.sqUser.birthDate }" pattern="yyyy"/></span>年出生，${loan.sqUser.education }学历，${loan.sqUser.hy_status }，户籍地址为${loan.sqUser.h_address }，现居住于${loan.sqUser.x_address }.</p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 借款人工作情况：</p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> ${loan.sqUser.t_name }为${loan.sqUser.w_position }，月收入<span>${loan.sqUser.m_income }</span>元，收入居住稳定。</p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 借款人资产介绍：</p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> ${loan.sqUser.t_name }有<span>1</span>辆全款长安福特福克斯汽车。</p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 详细资金用途：</p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> ${loan.loan_use }</p>
              </div>
            </dd>
          </dl>
          <dl class="item">
            <dt>
              <h3>审核信息</h3>
            </dt>
            <dd>
              <div class="verify clearfix">
                <ul>
                  <li><i class="icon icon-4"></i><br>
                    身份证</li>
                  <li><i class="icon icon-5"></i><br>
                    户口本</li>
                  <li><i class="icon icon-6"></i><br>
                    结婚证</li>
                  <li><i class="icon icon-7"></i><br>
                    工作证明</li>
                  <li><i class="icon icon-8"></i><br>
                    工资卡流水</li>
                  <li><i class="icon icon-9"></i><br>
                    收入证明</li>
                  <li><i class="icon icon-10"></i><br>
                    征信报告</li>
                  <li><i class="icon icon-11"></i><br>
                    亲属调查</li>
                  <li><i class="icon icon-19"></i><br>
                    资产证</li>
                  <li><i class="icon icon-20"></i><br>
                    资产登记证</li>
                  <li><i class="icon icon-21"></i><br>
                    资产登记发票</li>
                  <li><i class="icon icon-22"></i><br>
                    资产交强险</li>
                  <li><i class="icon icon-23"></i><br>
                    资产商业保险</li>
                  <li><i class="icon icon-24"></i><br>
                    资产评估认证</li>
                </ul>
              </div>
            </dd>
          </dl>
          <dl class="item">
            <dt>
              <h3>风控步骤</h3>
            </dt>
            <dd>
              <div class="text">
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 调查：风控部对借款人各项信息进行了全面的电话征信，一切资料真实可靠。<span></span> </p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 抵押物：${loan.zcInfo.zc_name }，资产牌号：<span> ${loan.zcInfo.zc_code } </span>，资产购买于<span><fmt:formatDate value="${loan.zcInfo.zc_date }" pattern="yyyy"/></span>年，裸价<span>${loan.zcInfo.zc_luojia }</span>元，评估价<span>${loan.zcInfo.zc_pinggujia }</span>元。 </p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 权证：已办理相关手续等。 </p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 担保：质押物担保。 </p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 结论：客户因${loan.loan_use }，申请贷款。借款人居住稳定，收入来源可靠，经风控综合评估，同意放款<span>${loan.loan_money }</span>元。 </p>
                <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 保障：借款逾期<span>48</span>小时内，易贷风险准备金先行垫付。 </p>
              </div> 
              <div class="step clearfix">
                <ul>
                  <li><i class="icon icon-1"></i>资料审核</li>
                  <li><i class="icon icon-2"></i>实地调查</li>
                  <li><i class="icon icon-3"></i>资产评估</li>
                  <li class="no"><i class="icon icon-4"></i>发布借款</li>
                </ul>
              </div>
              <div class="conclusion f16"> 结论：经风控部综合评估， <span class="c-orange">同意放款${loan.loan_money }元；</span> <i class="icon icon-status icon-status1"></i> </div>
            </dd>
          </dl>
          <dl class="item">
            <dt>
              <h3>权证信息</h3>
            </dt>
            <dd>
              <div class="warrant"> <span class="f14 c-888">（注：为保护借款人的个人隐私信息，实物材料对部分信息进行了隐藏处理）</span>
                <div class="album" id="album">
                  <div class="album-show">
                    <div class="loading" style="display: none;"></div>
                    <img src="images/news.jpg"> </div>
                  <div class="album-thumb"> <a href="javascript:;" class="btn btn-prev"></a> <a href="javascript:;" class="btn btn-next"></a>
                    <div style="visibility: visible; overflow: hidden; position: relative; z-index: 2; left: 0px; width: 1070px;" class="container" id="albumThumb">
                      <ul style="margin: 0px; padding: 0px; position: relative; list-style-type: none; z-index: 1; width: 1926px; left: 0px;">
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                        <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </dd>
          </dl>
        </div>
      </div>
      <form action="<%=basePath%>invest/getInvestsListByLoanId" method="post" id="fy">
				<input type="hidden" name="currentPage" id="currentPage" value="<%=PageUtil.currentPage%>">
				<input type="hidden" name="totalPage" id="totalPage" value="<%=PageUtil.totalPage%>">
				<input type="hidden" name="loan_dd_id"  value="${loan.loan_dd_id }">
	</form>
      
      <div class="ui-tab-item" style="display: none;">
        <div class="repayment-list"> 目前投标总额：<span class="c-orange">${loan.loan_money }元</span>&nbsp;&nbsp;
          剩余投标金额：<span class="c-orange"> ${loan.loan_money-loan.yitou }元</span>
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
              <tr>
                <th>投标人</th>
                <th>投标金额</th>
                <th>投标时间</th>
                <th>投标方式</th>
              </tr>
            </tbody>
            <tbody id="repayment_content">
            <c:forEach items="${investsList}" var="n" varStatus="sta">
	            <tr>
	                <td>${n.sqUser.user_name }</td>
	                <td><span class="c-orange">￥${n.tz_money }</span></td>
	                <td><fmt:formatDate value="${n.tz_time }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	                <td>自动</td>
	              </tr> 
            </c:forEach>
            </tbody>
            <tfoot>
              <tr class="page-outer">
                <td colspan="4" align="center">
                   <div class="pagination clearfix mrt30"> 
	                   <span class="page">
		                   <a href="javascript:firstPage()" onclick="">首页</a>
		                   <a href="javascript:upPage()" onclick="">上一页</a>&nbsp;
		                   <a href="javascript:nextPage()"onclick="#">下一页</a>
		                   <a href="javascript:lastPage()" onclick="#">尾页</a>&nbsp;
		                   <em>当前第<%=PageUtil.currentPage%>页&nbsp;</em>
		                   <em>共<%=PageUtil.totalPage%>页&nbsp;</em>
	                   </span>
	        			 跳转至&nbsp;&nbsp;<input type="text" id="jump" name="currentPage" value="<%=PageUtil.currentPage%>">&nbsp;&nbsp;页
					   <input type="button" value="GO" onclick="jumpTo()" />
     			   </div>
                </td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
      <div class="ui-tab-item" style="display: none;">
        <div class="repayment-list"> 已还本息：<span class="c-orange">${loan.repayment.yh_bx }元</span>&nbsp;&nbsp;
          待还本息：<span class="c-orange">${loan.repayment.yh_benjin+loan.repayment.yh_lixi-loan.repayment.yh_bx }元</span>&nbsp;&nbsp;(待还本息因算法不同可能会存误差，实际金额以到账金额为准！)
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
              <tr>
            
                <th>期数</th>
                <th>应还本金</th>
                <th>应还利息</th>
                <th>应还本息</th>
                <th>还款状态</th>
              </tr>
              <tr>
                <td>${loan.repayment.qishu }</td>
                <td>${loan.repayment.yh_benjin }元</td>
                <td>${loan.repayment.yh_lixi }元</td>
                <td>${loan.repayment.yh_benjin+loan.repayment.yh_lixi }0元</td>
                <td>${loan.cd_state }</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
			function jumpTo(){
				var pag=$("#jump").val();
				if(pag>=1&&pag<=<%=PageUtil.totalPage%>){
					location.href="<%=basePath%>invest/getInvestsListByLoanId?currentPage="+pag;
				}else{
					alert("输入信息有误,请重新输入");
				}
			} 
		
			function nextPage() {
				var currentPage=$("#currentPage").val();
				var totalPage=$("#totalPage").val();
				currentPage=parseInt(currentPage);
				totalPage=parseInt(totalPage);
				if(currentPage>=totalPage){
					alert("当前已经是最后一页");
				}else{
					$("#currentPage").val(currentPage+1);
					$("#fy").submit();
				}
				
			}
			function upPage() {
				var currentPage=$("#currentPage").val();
				currentPage=parseInt(currentPage);
				if(currentPage<=1){
					alert("当前已经是第一页");
				}else{
					$("#currentPage").val(currentPage-1);
					$("#fy").submit();
				}
			}
			function firstPage() {
					$("#currentPage").val(1);
					$("#fy").submit();
			}
			function lastPage() {
				var totalPage=$("#totalPage").val();
				totalPage=parseInt(totalPage);
					$("#currentPage").val(totalPage);
					$("#fy").submit();
			}
</script>
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
        <dd><a href="invest/investList">我要投资</a><a href="我要借款/home">我要借款</a></dd>
      </dl>
      <dl>
        <dt>帮助中心</dt>
        <dd><a href="帮助中心/home">新手入门</a><a href="个人中心首页/home">我的账户</a></dd>
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
<script type="text/javascript">
$(document).ready(function(){
	var process = $('.c-green').text();
	if('100.00%' == process) {
		$("#touzidiv").css('display', 'none');
	}
});
</script>
</body>
</html>
