<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
	contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<!-- saved from url=(0037)https://www.zwdai.com/customperinfo/3 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个体工商户基础信息</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">  
<meta baidu-gxt-verify-token="1ccdab5a95c81ee20ce9ac14ac2dde22">
<meta baidu-bsi-verify-token="9bef3b643e53e9fdcd79a456a0d8da79">
<link type="text/css" rel="stylesheet" href="../personage/global.css">
<link type="text/css" rel="stylesheet" href="../personage/modal.css">
<link type="text/css" rel="stylesheet" href="../personage/btn.css">
<link type="text/css" rel="stylesheet" href="../personage/icon.css">
<link type="text/css" rel="stylesheet" href="../personage/form.css">
<link  rel="shortcut icon" href="https://www.zwdai.com/resource/static/img/favicon.ico" type="image/x-icon">
<link  rel="Bookmark" href="https://www.zwdai.com/resource/static/img/favicon.ico">

<link type="text/css" href="../personage/select.css" rel="stylesheet">
<link type="text/css" href="../personage/common.css" rel="stylesheet">
<script type="text/javascript" src="../personage/hm.js"></script><script type="text/javascript" async="" src="../personage/sensorsdata.min.js"></script><script src="../personage/jquery.js"></script>
<script type="text/javascript" src="../personage/form.js"></script>
<script type="text/javascript" src="../personage/modal.js"></script>
<script type="text/javascript" src="../personage/layer.js"></script><link type="text/css" rel="stylesheet" href="../personage/layer.css" id="layuicss-skinlayercss">

    <link href="../personage/jedate.css" rel="stylesheet">
    <script type="text/javascript" src="../personage/jquery.jedate.js"></script>
</head>
<body>




<!--[if lte IE 8]><p style="text-align: center;padding: 10px 0;color: red;font-size: 18px;">您的浏览器版本过旧，为了您的安全请升级到高版本浏览器，可以安装chrome或者FireFox，如您有360浏览器请选择急速模式</p><![endif]-->
<div class="t-bar">
    <div class="f-pwc">
        <div class="f-fl">
            <span>客服电话：400-852-2220</span>
            <span style="margin-left: 20px;">公测版</span>
        </div>
        <div class="user f-fr">
            <div class="f-fl" style="margin-right: 20px;">
                <a href="https://cs.zwdai.com/im/client.php?locale=zh-cn" style="margin-right: 20px;" target="_blank" onclick="if(navigator.userAgent.toLowerCase().indexOf(&#39;opera&#39;) != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open(&#39;https://cs.zwdai.com/im/client.php?locale=zh-cn&amp;url=&#39;+escape(document.location.href)+&#39;&amp;referrer=&#39;+escape(document.referrer), &#39;webim&#39;, &#39;toolbar=0,scrollbars=0,location=0,status=1,menubar=0,width=640,height=480,resizable=1&#39;);this.newWindow.focus();this.newWindow.opener=window;return false;">在线客服</a>
                <a href="https://www.zwdai.com/help?id=43">帮助中心</a>
            </div>
            
            
            <!-- 登入后 -->
            <div class="f-fl"> 131****1357</div>
            <a href="https://www.zwdai.com/logout" class="f-fl f-ml15">退出</a>
            <div class="f-fl" id="usernav">
                <a href="https://www.zwdai.com/account" class="topaccountlink">
                    <span class="f-fl">账户中心</span><i class="icon upward-icon f-fl"></i></a>
                <div class="users" style="left: 1103.5px;">
                    <ul>
                        <li><a href="https://www.zwdai.com/recharge">充值</a></li>
                        <li><a href="https://www.zwdai.com/withdrawcash">提现</a></li>
                        <li><a href="https://www.zwdai.com/account/backlend">我的投资</a></li>
                        <li><a href="https://www.zwdai.com/account/myloan">我的借款</a></li>
                    </ul>
                </div>
            </div>
            
            <a href="https://www.zwdai.com/user/msg" class="f-fl">消息</a>
            
  
            
        </div>
    </div>
</div>
<div class="tab-bar">

    <div class="f-pwc f-oh">
        <a href="https://www.zwdai.com/" class="f-fl">
            
            <img src="../personage/logo-zwjr.png" class="logo" height="60" alt="籽微金融" title="籽微金融-籽因有你成就小微">
        </a>
        
        <ul class="f-fr">
            <li id="m-lv1-10054">
                <a href="https://www.zwdai.com/">首页</a>
                <div class="tablist" style="display: none;">
                    <div class="body"></div>
                </div>
            </li>
            <li id="m-lv1-10001">
                <a href="https://www.zwdai.com/project/list">我要投资</a>
                <div class="tablist" style="display: none;">
                    <div class="body">
        
                        
                    </div>
                </div>
            </li>

            <li id="m-lv1-10006">
                <a href="https://www.zwdai.com/loan/list">我要借款</a>
                <div class="tablist" style="display: none;">
                    <div class="body"></div>
                </div>
            </li>
            <li id="m-lv1-10055">
                <a href="https://www.zwdai.com/sign_guarantee">我要担保</a>
                <div class="tablist" style="display: none;">
                    <div class="body"></div>
                </div>
            </li>
            <li id="m-lv1-10011">
                <a href="https://www.zwdai.com/guide/lend">新手指引</a>
                <div class="tablist" style="display: none;">
                    <div class="body">
                        <a href="https://www.zwdai.com/guide/lend">
                            <div id="m-lv2-10016">投资引导</div>
                        </a>
                        <a href="https://www.zwdai.com/guide/loan">
                            <div id="m-lv2-10017">借款引导</div>
                        </a>
                        <a href="https://www.zwdai.com/guide/guarantor">
                            <div id="m-lv2-10018">担保人引导</div>
                        </a>
                        <a href="https://www.zwdai.com/guide/netloan">
                            <div id="m-lv2-10019">网贷知识普及</div>
                        </a>
                    </div>
                </div>
            </li>
            <li id="m2-lv1-10011">
                <a href="https://www.zwdai.com/disclosure/company">信息披露</a>
            </li>
            <li id="m-lv1-10009">
                <a href="https://www.zwdai.com/account/lend">我的账户</a>
                <div class="tablist" style="display: none;">
                    <div class="body">
                        <a href="https://www.zwdai.com/account/lend">
                            <div id="m-lv2-10010">投资账户</div>
                        </a>
                        <a href="https://www.zwdai.com/account/loan">
                            <div id="m-lv2-10011">借款账户</div>
                        </a>
                    </div>
                </div>
            </li>
  
        </ul>
    </div>
</div>
<div class="b-main f-mt30">
    <div class="main-content">
        <h3 class="title">个体工商户基础信息</h3>
        <div class="title-2">
            个人基础信息
        </div>
        <form id="customperinfo" action="https://www.zwdai.com/customperinfo" method="POST" novalidate="novalidate">
            <input type="hidden" name="ProjectTypeId" value="3">
            <div class="u-form">
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>用户名</label> <input name="userName" type="text" readonly="readonly" value="AU131****1357">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>真实姓名</label> <input name="realName" type="text" readonly="readonly" value="秦**">
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
                            <label>证件号码</label> <input name="certif_id" type="text" readonly="readonly" value="420***********2510">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>身份证明有效期</label> <input name="idValidDate" readonly="" class="mydatepicker" type="text" value="">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>个体工商户名称</label> <input name="customerName" maxlength="50" type="text" value="">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>营业执照注册号</label> <input name="businesslicenseno" maxlength="50" type="text" value="">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>地区</label>
                            <select name="nationality">
                                <option value="">请选择</option>
                                
                                <option value="0">中国大陆
                                </option>
                                
                                <option value="1">香港
                                </option>
                                
                                <option value="2">澳门
                                </option>
                                
                                <option value="3">台湾
                                </option>
                                
                            </select>
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>性别</label>
                            <select name="gender" id="gender">
                                <option value="">请选择</option>
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select>
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>邮箱</label> <input name="email" type="text" readonly="readonly" value="">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>出生日期</label> <input name="birthday" readonly="" class="mydatepicker" type="text" value="">
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div class="rol">
                    <div class="col-50">
                        <div>
                            <label>QQ号</label> <input name="qqNumber" maxlength="15" onkeyup="this.value=this.value.replace(/\D/g,&#39;&#39;)" onafterpaste="this.value=this.value.replace(/\D/g,&#39;&#39;)" type="text" value=""> <i>选填</i>
                        </div>
                        <p class="msgnav"></p>
                    </div>
                    <div class="col-50">
                        <div>
                            <label>教育程度</label>
                            <select name="education" type="text" value="">
                                <option value="">请选择</option>
                                
                                <option value="0">初中
                                </option>
                                
                                <option value="1">高中
                                </option>
                                
                                <option value="2">本科
                                </option>
                                
                                <option value="3">硕士
                                </option>
                                
                                <option value="4">博士
                                </option>
                                
                                <option value="5">其他
                                </option>
                                
                            </select>
                        </div>
                        <p class="msgnav"></p>
                    </div>
                </div>
                <div name="BusinessAddress">
                    <div class="more-select">
                        <label>经营地址</label>
                        
                        <select id="pro_id" name="Pro_id" onchange="getcity(&#39;pro_id&#39;,&#39;city_id&#39;)">
                            <option value="">请选择</option>
                            
                            
                            <option value="110000">北京市
                            </option>
                            
                            <option value="430000">湖南省
                            </option>
                            
                            <option value="440000">广东省
                            </option>
                            
                            <option value="450000">广西壮族自治区
                            </option>
                            
                            <option value="460000">海南省
                            </option>
                            
                            <option value="500000">重庆市
                            </option>
                            
                            <option value="510000">四川省
                            </option>
                            
                            <option value="520000">贵州省
                            </option>
                            
                            <option value="530000">云南省
                            </option>
                            
                            <option value="540000">西藏自治区
                            </option>
                            
                            <option value="610000">陕西省
                            </option>
                            
                            <option value="620000">甘肃省
                            </option>
                            
                            <option value="630000">青海省
                            </option>
                            
                            <option value="640000">宁夏回族自治区
                            </option>
                            
                            <option value="420000">湖北省
                            </option>
                            
                            <option value="410000">河南省
                            </option>
                            
                            <option value="370000">山东省
                            </option>
                            
                            <option value="120000">天津市
                            </option>
                            
                            <option value="130000">河北省
                            </option>
                            
                            <option value="140000">山西省
                            </option>
                            
                            <option value="150000">内蒙古自治区
                            </option>
                            
                            <option value="210000">辽宁省
                            </option>
                            
                            <option value="220000">吉林省
                            </option>
                            
                            <option value="230000">黑龙江省
                            </option>
                            
                            <option value="310000">上海市
                            </option>
                            
                            <option value="320000">江苏省
                            </option>
                            
                            <option value="330000">浙江省
                            </option>
                            
                            <option value="340000">安徽省
                            </option>
                            
                            <option value="350000">福建省
                            </option>
                            
                            <option value="360000">江西省
                            </option>
                            
                            <option value="650000">新疆维吾尔自治区
                            </option>
                            
                        </select>

                        
                        <select id="city_id" name="City_id" onchange="getdist(&#39;city_id&#39;,&#39;dist_id&#39;)">
                            <option value="">请选择</option>
                        </select>

                        
                        <select id="dist_id" name="Dist_id">
                            <option value="">请选择</option>
                        </select>

                        <input type="text" value="" name="businessAddress" maxlength="50" placeholder="请填写详细地址"><span class="add-guarantor">增加经营地址</span>
                    </div>
                    <p class="msgnav"></p>
                </div>
                <div name="BusinessAddress" style="display:none" id="businessAddress2">
                    <div class="more-select">
                        <label>经营地址</label>
                        
                        <select id="pro_id1" name="Pro_id1" onchange="getcity(&#39;pro_id1&#39;,&#39;city_id1&#39;)">
                            <option value="">请选择</option>
                            
                            
                            <option value="110000">北京市
                            </option>
                            
                            <option value="430000">湖南省
                            </option>
                            
                            <option value="440000">广东省
                            </option>
                            
                            <option value="450000">广西壮族自治区
                            </option>
                            
                            <option value="460000">海南省
                            </option>
                            
                            <option value="500000">重庆市
                            </option>
                            
                            <option value="510000">四川省
                            </option>
                            
                            <option value="520000">贵州省
                            </option>
                            
                            <option value="530000">云南省
                            </option>
                            
                            <option value="540000">西藏自治区
                            </option>
                            
                            <option value="610000">陕西省
                            </option>
                            
                            <option value="620000">甘肃省
                            </option>
                            
                            <option value="630000">青海省
                            </option>
                            
                            <option value="640000">宁夏回族自治区
                            </option>
                            
                            <option value="420000">湖北省
                            </option>
                            
                            <option value="410000">河南省
                            </option>
                            
                            <option value="370000">山东省
                            </option>
                            
                            <option value="120000">天津市
                            </option>
                            
                            <option value="130000">河北省
                            </option>
                            
                            <option value="140000">山西省
                            </option>
                            
                            <option value="150000">内蒙古自治区
                            </option>
                            
                            <option value="210000">辽宁省
                            </option>
                            
                            <option value="220000">吉林省
                            </option>
                            
                            <option value="230000">黑龙江省
                            </option>
                            
                            <option value="310000">上海市
                            </option>
                            
                            <option value="320000">江苏省
                            </option>
                            
                            <option value="330000">浙江省
                            </option>
                            
                            <option value="340000">安徽省
                            </option>
                            
                            <option value="350000">福建省
                            </option>
                            
                            <option value="360000">江西省
                            </option>
                            
                            <option value="650000">新疆维吾尔自治区
                            </option>
                            
                        </select>

                        
                        <select id="city_id1" name="City_id1" onchange="getdist(&#39;city_id1&#39;,&#39;dist_id1&#39;)">
                            <option value="">请选择</option>
                        </select>

                        
                        <select id="dist_id1" name="Dist_id1">
                            <option value="">请选择</option>
                        </select>

                        <input type="text" value="" id="businessAddressEx1" maxlength="50" name="businessAddressEx1" placeholder="请填写详细地址"><span class="delete-guarantor" name="2" data-p="pro_id1" data-c="city_id1" data-d="dist_id1">删除经营地址</span>
                    </div>
                    <p class="msgnav"></p>
                </div>
                <div name="BusinessAddress" style="display:none" id="businessAddress3">
                    <div class="more-select">
                        <label>经营地址</label>
                        
                        <select id="pro_id2" name="Pro_id2" onchange="getcity(&#39;pro_id2&#39;,&#39;city_id2&#39;)">
                            <option value="">请选择</option>
                            
                            
                            <option value="110000">北京市
                            </option>
                            
                            <option value="430000">湖南省
                            </option>
                            
                            <option value="440000">广东省
                            </option>
                            
                            <option value="450000">广西壮族自治区
                            </option>
                            
                            <option value="460000">海南省
                            </option>
                            
                            <option value="500000">重庆市
                            </option>
                            
                            <option value="510000">四川省
                            </option>
                            
                            <option value="520000">贵州省
                            </option>
                            
                            <option value="530000">云南省
                            </option>
                            
                            <option value="540000">西藏自治区
                            </option>
                            
                            <option value="610000">陕西省
                            </option>
                            
                            <option value="620000">甘肃省
                            </option>
                            
                            <option value="630000">青海省
                            </option>
                            
                            <option value="640000">宁夏回族自治区
                            </option>
                            
                            <option value="420000">湖北省
                            </option>
                            
                            <option value="410000">河南省
                            </option>
                            
                            <option value="370000">山东省
                            </option>
                            
                            <option value="120000">天津市
                            </option>
                            
                            <option value="130000">河北省
                            </option>
                            
                            <option value="140000">山西省
                            </option>
                            
                            <option value="150000">内蒙古自治区
                            </option>
                            
                            <option value="210000">辽宁省
                            </option>
                            
                            <option value="220000">吉林省
                            </option>
                            
                            <option value="230000">黑龙江省
                            </option>
                            
                            <option value="310000">上海市
                            </option>
                            
                            <option value="320000">江苏省
                            </option>
                            
                            <option value="330000">浙江省
                            </option>
                            
                            <option value="340000">安徽省
                            </option>
                            
                            <option value="350000">福建省
                            </option>
                            
                            <option value="360000">江西省
                            </option>
                            
                            <option value="650000">新疆维吾尔自治区
                            </option>
                            
                        </select>

                        
                        <select id="city_id2" name="City_id2" onchange="getdist(&#39;city_id2&#39;,&#39;dist_id2&#39;)">
                            <option value="">请选择</option>
                        </select>

                        
                        <select id="dist_id2" name="Dist_id2">
                            <option value="">请选择</option>
                        </select>

                        <input type="text" id="businessAddressEx2" maxlength="50" name="businessAddressEx2" placeholder="请填写详细地址" value=""><span class="delete-guarantor" name="3" data-p="pro_id2" data-c="city_id2" data-d="dist_id2">删除经营地址</span>
                    </div>
                    <p class="msgnav"></p>
                </div>
            </div>
            <div class="title-2">家庭情况</div>
            <div class="u-form">
                <div>
                    <label>婚姻状况</label>
                    <select name="marriageTypeId">
                        <option value="">请选择</option>
                        
                        <option value="1">已婚
                        </option>
                        
                        <option value="3">单身
                        </option>
                        
                        <option value="4">离异
                        </option>
                        
                        <option value="5">丧偶
                        </option>
                        
                    </select>
                </div>
                <p class="msgnav"></p>
                <div>
                    <label>住房条件</label>
                    <select name="houseTypeId">
                        <option value="">请选择</option>
                        
                        <option value="0">自有
                        </option>
                        
                        <option value="1">租用
                        </option>
                        
                    </select>
                </div>
                <p class="msgnav"></p>
                <div class="more-select">
                    <label>户籍所在地</label>
                    <select id="hu_pro_id" name="HU_pro_id" onchange="getcity(&#39;hu_pro_id&#39;,&#39;hu_city_id&#39;)">
                        <option value="">请选择</option>
                        
                        <option value="110000">北京市
                        </option>
                        
                        <option value="430000">湖南省
                        </option>
                        
                        <option value="440000">广东省
                        </option>
                        
                        <option value="450000">广西壮族自治区
                        </option>
                        
                        <option value="460000">海南省
                        </option>
                        
                        <option value="500000">重庆市
                        </option>
                        
                        <option value="510000">四川省
                        </option>
                        
                        <option value="520000">贵州省
                        </option>
                        
                        <option value="530000">云南省
                        </option>
                        
                        <option value="540000">西藏自治区
                        </option>
                        
                        <option value="610000">陕西省
                        </option>
                        
                        <option value="620000">甘肃省
                        </option>
                        
                        <option value="630000">青海省
                        </option>
                        
                        <option value="640000">宁夏回族自治区
                        </option>
                        
                        <option value="420000">湖北省
                        </option>
                        
                        <option value="410000">河南省
                        </option>
                        
                        <option value="370000">山东省
                        </option>
                        
                        <option value="120000">天津市
                        </option>
                        
                        <option value="130000">河北省
                        </option>
                        
                        <option value="140000">山西省
                        </option>
                        
                        <option value="150000">内蒙古自治区
                        </option>
                        
                        <option value="210000">辽宁省
                        </option>
                        
                        <option value="220000">吉林省
                        </option>
                        
                        <option value="230000">黑龙江省
                        </option>
                        
                        <option value="310000">上海市
                        </option>
                        
                        <option value="320000">江苏省
                        </option>
                        
                        <option value="330000">浙江省
                        </option>
                        
                        <option value="340000">安徽省
                        </option>
                        
                        <option value="350000">福建省
                        </option>
                        
                        <option value="360000">江西省
                        </option>
                        
                        <option value="650000">新疆维吾尔自治区
                        </option>
                        
                    </select>

                    <select id="hu_city_id" name="HU_city_id" onchange="getdist(&#39;hu_city_id&#39;,&#39;hu_dist_id&#39;)">
                        <option value="">请选择</option>
                    </select>

                    <select id="hu_dist_id" name="HU_dist_id">
                        <option value="">请选择</option>
                    </select>
                    <input type="text" id="registryAddress" maxlength="50s" name="registryAddress" placeholder="请填写详细地址" value="">
                </div>
                <p class="msgnav"></p>
                <div class="more-select">
                    <label>房产地址</label>

                    <select id="ju_pro_id" name="JU_pro_id" onchange="getcity(&#39;ju_pro_id&#39;,&#39;ju_city_id&#39;)">
                        <option value="">请选择</option>
                        
                        <option value="110000">北京市
                        </option>
                        
                        <option value="430000">湖南省
                        </option>
                        
                        <option value="440000">广东省
                        </option>
                        
                        <option value="450000">广西壮族自治区
                        </option>
                        
                        <option value="460000">海南省
                        </option>
                        
                        <option value="500000">重庆市
                        </option>
                        
                        <option value="510000">四川省
                        </option>
                        
                        <option value="520000">贵州省
                        </option>
                        
                        <option value="530000">云南省
                        </option>
                        
                        <option value="540000">西藏自治区
                        </option>
                        
                        <option value="610000">陕西省
                        </option>
                        
                        <option value="620000">甘肃省
                        </option>
                        
                        <option value="630000">青海省
                        </option>
                        
                        <option value="640000">宁夏回族自治区
                        </option>
                        
                        <option value="420000">湖北省
                        </option>
                        
                        <option value="410000">河南省
                        </option>
                        
                        <option value="370000">山东省
                        </option>
                        
                        <option value="120000">天津市
                        </option>
                        
                        <option value="130000">河北省
                        </option>
                        
                        <option value="140000">山西省
                        </option>
                        
                        <option value="150000">内蒙古自治区
                        </option>
                        
                        <option value="210000">辽宁省
                        </option>
                        
                        <option value="220000">吉林省
                        </option>
                        
                        <option value="230000">黑龙江省
                        </option>
                        
                        <option value="310000">上海市
                        </option>
                        
                        <option value="320000">江苏省
                        </option>
                        
                        <option value="330000">浙江省
                        </option>
                        
                        <option value="340000">安徽省
                        </option>
                        
                        <option value="350000">福建省
                        </option>
                        
                        <option value="360000">江西省
                        </option>
                        
                        <option value="650000">新疆维吾尔自治区
                        </option>
                        
                    </select>

                    <select id="ju_city_id" name="JU_city_id" onchange="getdist(&#39;ju_city_id&#39;,&#39;ju_dist_id&#39;)">
                        <option value="">请选择</option>
                    </select>

                    <select id="ju_dist_id" name="JU_dist_id">
                        <option value="">请选择</option>
                    </select>
                    <input type="text" value="" name="liveAddress" maxlength="50" placeholder="请填写详细地址"> <i>选填</i>
                </div>
                <p class="msgnav"></p>
                <div>
                    <label>居住电话</label> <input name="livemobile" maxlength="13" type="text" value=""> <i>选填</i>
                </div>
                <p class="msgnav"></p>
                <div>
                    <label>入住年数</label> <input name="liveYear" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,&#39;&#39;)" onafterpaste="this.value=this.value.replace(/[^0-9]/g,&#39;&#39;)" type="text" value="">
                </div>
                <p class="msgnav"></p>
            </div>
            <div class="u-btn btn-center">
                <input type="submit" value="下一步">
            </div>
        </form>
    </div>
</div>


<div class="footer">
    <div class="top">
        <div class="f-pwc row footer-wt">
            <div class="about-us">
                <dl>
                    <dt><span>关于我们</span></dt>
                    <dd><a href="https://www.zwdai.com/disclosure/company">公司简介</a></dd>
                    <dd><a href="https://www.zwdai.com/disclosure/team">管理团队</a></dd>
                    <dd><a href="https://www.zwdai.com/disclosure/company#brand">品牌故事</a></dd>
                    <dd><a href="https://www.zwdai.com/disclosure/contact">联系我们</a></dd>
                </dl>
            </div>
            <div class="security">
                <dl>
                    <dt><span>安全保障</span></dt>
                    <dd><a href="https://www.zwdai.com/disclosure/security#money">资金保障</a></dd>
                    <dd><a href="https://www.zwdai.com/disclosure/security#risk">风控保障</a></dd>
                    <dd><a href="https://www.zwdai.com/disclosure/security#network">网络安全保障</a></dd>
                    <dd><a href="https://www.zwdai.com/disclosure/security#gain">利益保障</a></dd>
                </dl>
            </div>
            <div class="help">
                <dl>
                    <dt><span>帮助中心</span></dt>
                    <dd><a href="https://www.zwdai.com/help?id=44">充值提现</a></dd>
                    <dd><a href="https://www.zwdai.com/help?id=43">投资流程</a></dd>
                    <dd><a href="https://www.zwdai.com/help?id=45">借款流程</a></dd>
                    <dd><a href="https://www.zwdai.com/help?id=46">资费说明</a></dd>
                </dl>
            </div>
            <div class="customer-service" style="margin-left: 150px;">
                <dl>
                    <dd><span>客服热线:400-852-2220</span></dd>
                    <dd><span>工作时间：周一至周五8:00-20:00</span></dd>
                    <dd><span>借贷有风险，投资需谨慎!</span></dd>
                </dl>
            </div>
            <div class="ercode">
                <dl>
                    <dt style="text-align: center;"><span>扫描二维码下载APP</span></dt>
                    <dd>
                        <div class="appcode">
                            <div class="app">
                                <p>iOS</p>
                                <p><img src="../personage/ios.png" alt="籽微金融app IOS版下载二维码"></p>
                            </div>
                            <div class="app">
                                <p>Android</p>
                                <p><img src="../personage/android.png" alt="籽微金融app安卓版下载二维码"></p>
                            </div>
                        </div>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
    
    
        <div class="friendship-link" style="min-height: 10px;">
            <div class="f-pwc" style="height: 3px;">
                <div class="linkcontent">
                </div>
            </div>
        </div>
    
    <div class="bottom">
        <div class="f-pwc">
            <div class="f-fs13 icp">
                <span>上海融旌金融信息服务有限公司 Copyright © zwdai.com  All Rights Reserved</span><span style="margin-left: 50px;">沪ICP备17011115号-1</span>
                
                <span>
                    <a key="58086b9defbfb014cc22162b" logo_size="124x47" logo_type="business" href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.zwdai.com&amp;at=business" rel="nofollow" target="_blank"><script src="../personage/aq_auth.js"></script><b id="aqLogoEFKDH" style="display: none;"></b><img src="../personage/hy_124x47.png" alt="安全联盟认证" width="124" height="47" style="border: none;"></a>
                    <a id="___szfw_logo___" href="https://credit.szfw.org/CX20161027027025801531.html" target="_blank" rel="nofollow"><img src="../personage/sf.png" style="background-color: #fff" border="0"></a>
                    <script type="text/javascript">(function(){document.getElementById('___szfw_logo___').oncontextmenu = function(){return false;}})();</script>
                    
                    <script src="../personage/seallogo.dll" rel="nofollow"></script><a href="https://ss.knet.cn/verifyseal.dll?sn=e16102131011264952jmbw000000&amp;ct=df&amp;a=1&amp;pa=0.1271327673845295" target="_blank" kx_type="缩放式" style="display:inline-block;position:relative;width:89px;height:32px;"><img src="../personage/cnnic.png" height="32" width="89" h="32" w="89" onmouseover="showFull(this)" onmouseout="showMin(this)" style="left:0;position:absolute;top:0;border:none;"></a> 
                    <a id="_pingansec_bottomimagelarge_p2p" href="http://si.trustutn.org/info?sn=405170216000566898683&amp;certType=4" rel="nofollow" target="_blank"><img src="../personage/p2p_official_large.jpg"></a>
                </span>
            </div>
        </div>
    </div>
</div>
<script src="../personage/lang.js"></script>
<script>
    $(".navigation").find("a").each(function () {
        if ($(this).text() == "收益计算器") {
            $(this).attr("linkurl", $(this).attr("href")).removeAttr("href");
            $(this).on("click", function () {
                interestcalculate($(this));
            });
        }
    });

    function calculate(str, projectId) {
        var top;
        top = "10%";
        $('body').fbmodal({
            title: "收益计算器",
            cancel: "取消",//取消按钮
            okay: "确定",//确定按钮
            okaybutton: true,//是否显示确定按钮
            cancelbutton: true,//是否显示取消按钮
            buttons: false,//不用管
            opacity: 0.35,//背景遮罩
            fadeout: true,//不用管
            overlayclose: true,
            modaltop: top,//距离顶部
            modalwidth: "690px",//宽度
            source: "/counter?projectId=" + projectId,
            iframeid: "calculateid",
            content: "",//内容（没有或者为iframe就为空 或者null）
            modalheight: "430px",//高度
            okhide: false//ok后是否关闭
        }, function (callback) {
            if (callback == 1) {
            }
            if (callback == 2 || callback == 3) {
            }
        });
    }

    function interestcalculate(str) {
        var top;
        top = "10%";
        $('body').fbmodal({
            title: "收益计算器",
            cancel: "取消",//取消按钮
            okay: "确定",//确定按钮
            okaybutton: true,//是否显示确定按钮
            cancelbutton: true,//是否显示取消按钮
            buttons: false,//不用管
            opacity: 0.35,//背景遮罩
            fadeout: true,//不用管
            overlayclose: true,
            modaltop: top,//距离顶部
            modalwidth: "690px",//宽度
            source: "/counter",
            iframeid: "interestcalculateid",
            content: "",//内容（没有或者为iframe就为空 或者null）
            modalheight: "430px",//高度
            okhide: false//ok后是否关闭
        }, function (callback) {
            if (callback == 1) {
            }
            if (callback == 2 || callback == 3) {
            }
        });
    }
    $("#rem").bind('input propertychange', function () {
        $('#last_word').text(80 - $(this).val().length);
    });
</script>
<script>
    (function(para) {
        var p = para.sdk_url, n = para.name, w = window, d = document, s = 'script',x = null,y = null;
        w['sensorsDataAnalytic201505'] = n;
        w[n] = w[n] || function(a) {return function() {(w[n]._q = w[n]._q || []).push([a, arguments]);}};
        var ifs = ['track','quick','register','registerPage','registerOnce','clearAllRegister','trackSignup', 'trackAbtest', 'setProfile','setOnceProfile','appendProfile', 'incrementProfile', 'deleteProfile', 'unsetProfile', 'identify','login','logout','trackLink','clearAllRegister','getAppStatus'];
        for (var i = 0; i < ifs.length; i++) {
            w[n][ifs[i]] = w[n].call(null, ifs[i]);
        }
        if (!w[n]._t) {
            x = d.createElement(s), y = d.getElementsByTagName(s)[0];
            x.async = 1;
            x.src = p;
            y.parentNode.insertBefore(x, y);
            w[n].para = para;
        }
    })({
        sdk_url: 'https://www.zwdai.com/resource/static/js/sensorsdata.min.js',
        name: 'sa',
        web_url: 'http://54.223.221.254:8007/?project=production',
        server_url: 'https://sensorsdata.zwdai.com/sa?project=production',
        heatmap:{},
        show_log:false
    });
    sa.quick('autoTrack');
</script>
<script type="text/javascript">
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?22e8c954c56b097007e2cfa8076bb276";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();

</script>



<script type="text/javascript" src="../personage/validate.js"></script>
<script type="text/javascript" src="../personage/validform.js"></script>
<script>
    $(document).ready(function () {
        $(".mydatepicker").jeDate({
            format: "YYYY-MM-DD",
            isTime: false,
            minDate: "1900-01-01 00:00:00"
        });
        var b_num2 = true, b_num3 = true;
        $(".add-guarantor").on("click", function () {
            if (b_num2) {
                $("#businessAddress2").show();
                b_num2 = false;
            } else if (b_num3) {
                $("#businessAddress3").show();
                b_num3 = false;
            } else {
                layer.alert("最多只能添加三个经营地址");
            }
            delete_guarantor();
        });
        var delete_guarantor = function () {
            $(".delete-guarantor").unbind("click");
            $(".delete-guarantor").on("click", function (e) {
                if ($(this).attr("name") == 2) {
                    b_num2 = true;
                } else if ($(this).attr("name") == 3) {
                    b_num3 = true;
                }
                $(this).parent().parent().hide();
                $("#" + $(this).attr("data-p") + " option:first-child").prop("selected", true);
                $("#" + $(this).attr("data-c") + "").html("");
                $("#" + $(this).attr("data-d") + "").html("");
                $(this).parent().find("input").val("");
            });
        }
        //相当于Activity的onCreate方法：进行页面初始化执行代码
//        getcity("pro_id", "city_id",false);
//        reloadcity("pro_id", "city_id");
//
//        getcity("pro_id1", "city_id1",false);
//        reloadcity("pro_id1", "city_id1");
//
//        getcity("pro_id2", "city_id2",false);
//        reloadcity("pro_id2", "city_id2");
//
//        getcity("hu_pro_id", "hu_city_id",true);
//        reloadcity("hu_pro_id", "hu_city_id");
//
//        getcity("ju_pro_id", "ju_city_id",true);
//        reloadcity("ju_pro_id", "ju_city_id");
//
//        getdist("city_id", "dist_id",false);
//        reloaddist("city_id", "dist_id");
//
//        getdist("city_id1", "dist_id1",false);
//        reloaddist("city_id1", "dist_id1");
//
//        getdist("city_id2", "dist_id2",false);
//        reloaddist("city_id2", "dist_id2");
//
//        getdist("hu_city_id", "hu_dist_id",true);
//        reloaddist("hu_city_id", "hu_dist_id");
//
//        getdist("ju_city_id", "ju_dist_id",true);
//        reloaddist("ju_city_id", "ju_dist_id");
    });

    /**
     * @param id :省id
     * @param c_id ：市id
     */
    function getcity(p_id, c_id,selectvalue) {
        $.ajax({
            cache: true,
            type: "GET",
            url: '/province/getcity',
            data: {pro_id: $("#" + p_id + "").val()},
            async: false,
            error: function (request) {
                $.ligerDialog.success(request);
            },
            success: function (data) {
//                console.log(data);浏览器中打印Log
                $("#" + c_id + "").html("")
                $("#" + c_id + "").append("<option value=''>请选择</option>");
                for (var i = 0; i < data.length; i++) {
                    if(data[i].cityid!=selectvalue)
                        $("#" + c_id + "").append("<option value='" + data[i].cityid + "'  >" + data[i].cityname + "</option>");
                    else
                        $("#" + c_id + "").append("<option selected='selected' value='" + data[i].cityid + "'  >" + data[i].cityname + "</option>");
                }
            }
        });
    }

    function reloadcity(p_id, c_id,selectvalue) {
        if ($("#" + p_id + "").val() != "0") {
            
        }
    }

    function getdist(c_id, d_id,selectvalue) {
        $.ajax({
            cache: true,
            type: "GET",
            url: '/city/getdist',
            data: {city_id: $("#" + c_id + "").val()},
            async: false,
            error: function (request) {
                $.ligerDialog.success(request);
            },
            success: function (data) {
                $("#" + d_id + "").html("")
                $("#" + d_id + "").append("<option value=''>请选择</option>");
                for (var i = 0; i < data.length; i++) {
                    if (data[i].districtid != selectvalue)
                        $("#" + d_id + "").append("<option value='" + data[i].districtid + "'  >" + data[i].districtname + "</option>");
                    else
                        $("#" + d_id + "").append("<option selected='selected' value='" + data[i].districtid + "'  >" + data[i].districtname + "</option>");
                }
            }
        });
    }

    function reloaddist(c_id, d_id) {
        if ($("#" + c_id + "").val() != "0") {
            
        }
    }

</script>


</body></html>