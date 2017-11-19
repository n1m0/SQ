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
<script type="text/javascript" src="js/loan-order-check.js"></script>
<script type="text/javascript" src="js/user-check-1.0.1.js"></script>
<!-- <script type="text/javascript" src="js/jquery-city.js"></script> -->
<script type="text/javascript" src="script/common.js"></script>
<script src="script/ablumn.js"></script>
<script src="script/plugins.js"></script>
<script src="script/detail.js"></script>
<script type="text/javascript" src="<%=basePath%>bresources/My97DatePicker/WdatePicker.js"> </script>

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
<script type="text/javascript" src="personage/hm.js"></script>
<script type="text/javascript" async="" src="personage/sensorsdata.min.js"></script>
<script type="text/javascript"
	src="bresources/easyUI/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="bresources/easyUI/easyui.css">
<script type="text/javascript" src="bresources/blockUI/jquery.blockUI.js"></script>
<!-- <script src="personage/jquery.js"></script> -->
<script type="text/javascript" src="personage/form.js"></script>
<script type="text/javascript" src="personage/modal.js"></script>
<script type="text/javascript" src="personage/layer.js"></script>
<link type="text/css" rel="stylesheet" href="personage/layer.css" id="layuicss-skinlayercss">
<link href="personage/jedate.css" rel="stylesheet">
<script type="text/javascript" src="personage/jquery.jedate.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css" />
 -->
<!-- <script type="text/javascript" src="js/jquery.cityselect.js"></script> -->
<script type="text/javascript">
	$(function(){
		var a=$("#idcard").val();
		if(a==null || a==""){
			location.href="个人中心-开通第三方/home";
		}
		var b=$("#times").html();
		var c=$("#birthDate").val(b);
	})
	
</script>
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

<!-- S  -->
 <div class="b-main f-mt30">
    <div class="main-content">
    <form action="loan/updateSqUser" method="POST" id="submitPersonalInfo">
        <h3 class="title">个体工商户基础信息</h3>
        <div class="title-2">
         	   个人基础信息
        </div>
            <input type="hidden" name="ProjectTypeId" value="3">
            <div class="u-form">
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>用户名</label> <input name="username" type="text" readonly="readonly" value="${info.user_name }">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                     		<label>真实姓名</label> <input id="tname" name="t_name" type="text" readonly="readonly" value="${info.t_name }">
                     		<input type="hidden" value="${sessionScope.info.user_id }" id="user_id_info"/>
                        </div>
                    </div>
                </div>
                
                <div class="rol">
               		 <div class="col-50">
                        <div>
                            <label>证件号码</label> <input id="idcard" name="certif_id" type="text" readonly="readonly" value="${info.id_card }">
                        </div>
                        <p class="msgnav"></p>
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
                            <label>出生日期</label>&nbsp;<input name="birthDate1" id="birthDate" type="text" readonly="readonly">   
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                       
                        <div>
                            <label>邮箱</label> <input name="email" id="email" type="text" value="${info.email }" readonly="readonly">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>银行卡号</label> <input name="bank_card" id="bank_card"  type="text" value="">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                         <div>
  							 <label>性别</label>  <select name="sex"  id="sex" >
                                <option value="男">男 </option>
                                <option value="女">女</option>
                            </select>
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
                                <option value="初中">初中 </option>
                                <option value="高中">高中</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                        <p class="msgnav"></p>
                    </div>
                </div>
            </div>
<!-- E  -->            
          <input type="hidden" name="user_id" value="${info.user_id }">
            <div class="title-2">家庭情况</div>
            <div class="u-form">
	            <div class="rol">
	                    <div class="col-50">
	                        <div>
			                    <label>婚姻状况</label>
			                    <select name="hy_status" id="hy_status"  >
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
	                            <label>月收入</label> <input name="m_income" id="m_income"  class="mydatepicker" type="text" value="${info.m_income }">
	                        </div>
	                        <p class="msgnav"></p>
	                    </div>
	            </div>
                <div class="more-select" id="city">
                    <label>户籍所在地</label>
                    <select class="select" name="province1" id="s1">
                    <option value="请选择省">请选择省</option><option value="北京市">北京市</option><option value="天津市">天津市</option><option value="上海市">上海市</option><option value="重庆市">重庆市</option><option value="河北省">河北省</option><option value="山西省">山西省</option><option value="内蒙古">内蒙古</option><option value="辽宁省">辽宁省</option><option value="吉林省">吉林省</option><option value="黑龙江省">黑龙江省</option><option value="江苏省">江苏省</option><option value="浙江省">浙江省</option><option value="安徽省">安徽省</option><option value="福建省">福建省</option><option value="江西省">江西省</option><option value="山东省">山东省</option><option value="河南省">河南省</option><option value="湖北省">湖北省</option><option value="湖南省">湖南省</option><option value="广东省">广东省</option><option value="广西">广西</option><option value="海南省">海南省</option><option value="四川省">四川省</option><option value="贵州省">贵州省</option><option value="云南省">云南省</option><option value="西藏">西藏</option><option value="陕西省">陕西省</option><option value="甘肃省">甘肃省</option><option value="青海省">青海省</option><option value="宁夏">宁夏</option><option value="新疆">新疆</option><option value="香港">香港</option><option value="澳门">澳门</option><option value="台湾省">台湾省</option></select>
                    <select class="select" name="city1" id="s2">
					<option value="请选择市">请选择市</option><option value="西安市" selected="selected">西安市</option><option value="延安市">延安市</option><option value="铜川市">铜川市</option><option value="渭南市">渭南市</option><option value="咸阳市">咸阳市</option><option value="宝鸡市">宝鸡市</option><option value="汉中市">汉中市</option><option value="榆林市">榆林市</option><option value="安康市">安康市</option><option value="商洛市">商洛市</option></select>
					<select class="select" name="town1" id="s3">
					<option value="请选择区/县">请选择区/县</option><option value="莲湖区">莲湖区</option><option value="新城区">新城区</option><option value="碑林区">碑林区</option><option value="灞桥区">灞桥区</option><option value="未央区">未央区</option><option value="雁塔区">雁塔区</option><option value="阎良区">阎良区</option><option value="临潼区">临潼区</option><option value="长安区">长安区</option><option value="蓝田县">蓝田县</option><option value="蓝关镇">蓝关镇</option><option value="周至县" selected="selected">周至县</option><option value="二曲镇">二曲镇</option><option value="户县">户县</option><option value="甘亭镇">甘亭镇</option><option value="高陵县">高陵县</option><option value="鹿苑镇">鹿苑镇</option></select>
                </div>
                <p class="msgnav"></p>
                <div class="more-select" id="city1">
                    <label>当前居住地址</label>
						<select class="select" name="province" id="s1">
                    <option value="请选择省">请选择省</option><option value="北京市">北京市</option><option value="天津市">天津市</option><option value="上海市">上海市</option><option value="重庆市">重庆市</option><option value="河北省">河北省</option><option value="山西省">山西省</option><option value="内蒙古">内蒙古</option><option value="辽宁省">辽宁省</option><option value="吉林省">吉林省</option><option value="黑龙江省">黑龙江省</option><option value="江苏省">江苏省</option><option value="浙江省">浙江省</option><option value="安徽省">安徽省</option><option value="福建省">福建省</option><option value="江西省">江西省</option><option value="山东省">山东省</option><option value="河南省">河南省</option><option value="湖北省">湖北省</option><option value="湖南省">湖南省</option><option value="广东省">广东省</option><option value="广西">广西</option><option value="海南省">海南省</option><option value="四川省">四川省</option><option value="贵州省">贵州省</option><option value="云南省">云南省</option><option value="西藏">西藏</option><option value="陕西省">陕西省</option><option value="甘肃省">甘肃省</option><option value="青海省">青海省</option><option value="宁夏">宁夏</option><option value="新疆">新疆</option><option value="香港">香港</option><option value="澳门">澳门</option><option value="台湾省">台湾省</option></select>
                    <select class="select" name="city" id="s2">
					<option value="请选择市">请选择市</option><option value="西安市" selected="selected">西安市</option><option value="延安市">延安市</option><option value="铜川市">铜川市</option><option value="渭南市">渭南市</option><option value="咸阳市">咸阳市</option><option value="宝鸡市">宝鸡市</option><option value="汉中市">汉中市</option><option value="榆林市">榆林市</option><option value="安康市">安康市</option><option value="商洛市">商洛市</option></select>
					<select class="select" name="town" id="s3">
					<option value="请选择区/县">请选择区/县</option><option value="莲湖区">莲湖区</option><option value="新城区">新城区</option><option value="碑林区">碑林区</option><option value="灞桥区">灞桥区</option><option value="未央区">未央区</option><option value="雁塔区">雁塔区</option><option value="阎良区">阎良区</option><option value="临潼区">临潼区</option><option value="长安区">长安区</option><option value="蓝田县">蓝田县</option><option value="蓝关镇">蓝关镇</option><option value="周至县" selected="selected">周至县</option><option value="二曲镇">二曲镇</option><option value="户县">户县</option><option value="甘亭镇">甘亭镇</option><option value="高陵县">高陵县</option><option value="鹿苑镇">鹿苑镇</option></select>
                </div>
                <p class="msgnav"></p>
            </div>
            <div class="u-btn btn-center">
                <input type="submit" id="but" value="提交">
            </div>
        </form>
    </div>
</div>              
<!-- <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script> -->
<script type="text/javascript" src="js/address.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	$.initialize({
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
