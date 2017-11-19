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
<script src="script/ablumn.js"></script>
<script src="script/plugins.js"></script>
<script src="script/detail.js"></script>

<!-- 新加入 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">  


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
<link href="personage/jedate.css" rel="stylesheet">
<script type="text/javascript" src="personage/jquery.jedate.js"></script>
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>

<!--  <link rel="stylesheet" type="text/css" href="css/main.css" />-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.cityselect.js"></script>


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
        <li> <a href="index/home" class="app">返回首页</a> </li>
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
      <div class="fn-left logo"> <a class="" href="index/home"> <img src="images/logo.png"  title=""> </a> </div>
      <ul class="top-nav fn-clear">
        <li class="on"> <a href="index/home">首页</a> </li>
         <li> <a href="invest/investList" id="gotoInvest" >我要投资</a> </li>
 <li> <a href="trans/loan5/home"  id="gotoLoanPage">我要贷款</a>
 <input type="hidden" value="${sessionScope.info.userCheck } " id="user_check_info_flag"> </li>
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
        <h3 class="title">个体工商户基础信息</h3>
        <div class="title-2">
            个人基础信息
        </div>
            <input type="hidden" name="ProjectTypeId" value="3">
            <div class="u-form">
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>用户名</label> <input name="user_name" type="text" readonly="readonly" value="${info.user_name }">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>性别</label> <input name="sex" type="text" readonly="readonly" value="${info.sex }">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>真实姓名</label> <input name="t_name" type="text" readonly="readonly" value="${info.t_name }">
                        </div>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>证件类型</label> <input name="certif_tp" type="text" readonly="readonly" value="大陆居民身份证">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>证件号码</label> <input name="certif_id" type="text" readonly="readonly" value="${info.id_card }">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>出生日期</label> <label><fmt:formatDate value="${info.birthDate }" pattern="YYYY-MM-dd"/></label>   
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>银行卡号</label> <input name="bank_card" id="bank_card"  type="text" value="${info.bank_card }">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>邮箱</label> <input name="email" id="email" type="text" value="${info.email }">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>QQ号</label> <input  maxlength="15" id="" onkeyup="this.value=this.value.replace(/\D/g,&#39;&#39;)" onafterpaste="this.value=this.value.replace(/\D/g,&#39;&#39;)" type="text" value=""> <i>选填</i>
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                       <label>教育程度</label>
                            <select name="education"  id="education" >
                            	<option value="${info.education }">${info.education }</option>
                            	<option value="">请选择</option>
                                <option value="初中">初中 </option>
                                <option value="高中">高中</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
            </div>
            
            
          <form action="loan/updateSqUser" method="POST" enctype="multipart/form-data">
            <div class="title-2">家庭情况</div>
            <div class="u-form">
	            <div class="rol">
	                    <div class="col-50">
	                        <div>
			                    <label>婚姻状况</label>
			                    <select name="hy_status" id="hy_status"  >
			                    	<option value="${info.hy_status }" selected="selected">${info.hy_status }</option>
			                    	<option value="">请选择</option>
			                        <option value="已婚">已婚</option>
			                        <option value="单身">单身</option>
			                        <option value="离异">离异</option>
			                        <option value="丧偶">丧偶</option>
			                        <option value="丧偶">未婚</option>
			                    </select>
		                    </div>
		                   		 <p class="msgnav"></p>
		                    </div>
			            <div class="col-50">
			                <div>
	                            <label>紧急联系人</label> <input name="jj_name" id="jj_name" type="text" value="${info.jj_name }">
	                        </div>
	                        <p class="msgnav"></p>
	                    </div>  
			                    
                </div>
                
            <div class="rol">
	                    <div class="col-50">
	                        <div>
			                    <label>紧急联系人电话</label>
			                    <input name="jj_name_phone" type="text" id="jj_name_phone"  value="${info.jj_name_phone }">
			                </div>
			                    <p class="msgnav"></p>
			             </div>
			             <div class="col-50">
	                        <div>
	                            <label>和紧急联系人的关系</label> <input name="jj_name_rela" id="jj_name_rela" type="text" value="${info.jj_name_rela }">
	                        </div>
	                        <p class="msgnav"></p>
	                    </div>  
			                    
                </div>
                
                 <div class="rol">
	                   
	                    <div class="col-50">
	                        <div>
	                        	<label>工作职位</label> <input name="w_position" maxlength="50" id="w_position" type="text" value="${info.w_position }">
			                </div>
			                    <p class="msgnav"></p>
			             </div>
			             <div class="col-50">
	                        <div>
	                            <label>月收入</label> <input name="m_income" id="m_income" readonly="" class="mydatepicker" type="text" value="${info.m_income }">
	                        </div>
	                        <p class="msgnav"></p>
	                    </div>
	            </div>
                <div class="more-select" id="city">
                    <label>户籍所在地</label>
                     <select id="hu_pro_id" name="h_address" class="prov" onchange="getcity(&#39;hu_pro_id&#39;,&#39;hu_city_id&#39;)">
                   		 <option value="">请选择</option>
                    </select>
                    <select id="hu_city_id" name="HU_city_id" class="city" disabled="disabled" onchange="getdist(&#39;hu_city_id&#39;,&#39;hu_dist_id&#39;)">
                    	 <option value="">请选择</option>
                    </select>
                    <select id="hu_dist_id" name="HU_dist_id" class="dist" disabled="disabled">
                    	<option value="">请选择</option>
                    </select>
                </div>
                <p class="msgnav"></p>
                <div class="more-select" id="city1">
                    <label>当前居住地址</label>

                    <select id="ju_pro_id" name="x_address" class="prov" onchange="getcity(&#39;ju_pro_id&#39;,&#39;ju_city_id&#39;)">
                        <option value="">请选择</option>
                    </select>

                    <select id="ju_city_id" name="JU_city_id" class="city" disabled="disabled" onchange="getdist(&#39;ju_city_id&#39;,&#39;ju_dist_id&#39;)">
                        <option value="">请选择</option>
                    </select>

                    <select id="ju_dist_id" name="JU_dist_id" class="dist" disabled="disabled">
                        <option value="">请选择</option>
                    </select>
                </div>
                <p class="msgnav"></p>
            </div>
            <div class="u-btn btn-center">
                <input type="submit" id="but" value="下一步">
            </div>
        </form>
    </div>
</div>              
<script type="text/javascript">
	$(function(){
		$("#city").citySelect({
			nodata:"none",
			required:false
		}); 
	});
	$(function(){
		$("#city1").citySelect({
			nodata:"none",
			required:false
		}); 
		
		
		
	});
	
	
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
        <dd><a href="trans/list/home">我要投资</a><a href="trans/loan/home">我要借款</a></dd>
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
