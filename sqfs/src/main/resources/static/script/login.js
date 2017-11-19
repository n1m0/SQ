(function($, undefined) {
    $(document).ready(function() {
        var flag4 = 1;
        var _t = 60; // 倒计时时间
        var subFlag = "1";
        var flag = 1;
        var wait = 300;
        var verify1 = "";
        var verify2 = "";
        var flag1 = false;
        var flaghave = 0;
        var flag3 = 1;
        var $getKey = $("._getkey");//获取短信验证码的链接框的class
        var $phoneyanzhengma = $("._yanzhengma");
        var $yanzhengma = $("#jpgVerify");//图片验证码输入框ID
        var $yanzhengmatishi = $('#jpgVerifys');//图片验证码后方的提示框
        var invist_flag = true;
        var $changeCapcherButton = $("._changeCapcherButton");//验证码图片后方图片的看不清链接ID
        var $phoneMsg = $('#phoneJy');//短信验证码的后方的提示框的id
        var pattern = /^(?=.*\d.*)(?=.*[a-zA-Z].*).{6,24}$/;//密码的正则表达式
        var mimayn=1;
        var phone=1;
        var Num="";
        var login = {
            init: function() {
                login._bind();
            },
           _bind: function() {
                $getKey.on('click', function(event) {//单击获取短信验证码时
                    event.preventDefault();
                    if(flag==1){
                    	$("#phoneJy").text("");
                        $("#phoneJy").append("<span style=color:#ff7800>请输入正确的手机号码</span>");
                        return false;
                    }
                    if (flag4 == 1) {
                        flag4 = 0;
                        login._ya($(this));//进入倒计时
                    }
                    
                    if (flag3 != 0) {
                        $("#phonVerifys").text("");
                        $("#phonVerifys").append("<span style=color:#ff7800>请先输入正确的验证码</span>");
                        return false;
                    }
                    return false;
                });
                $("._phoneNum").on('blur keyup', function(event) {//输入手机号码后失去焦点
                    event.preventDefault();
                    login.phoneYz();//手机格式验证及查询数据库是否存在该号码
                    return false;
                });
                $("#phonVerify").on('blur', function(event) {//输入手机验证码后失去焦点事件
                    event.preventDefault();
                    login.checkSecurity($(this));
                    return false;
                });
              
                $("._password").on('blur', function(event) {//第一次输入密码结束后失去焦点
                    event.preventDefault();
                    login.strVerify($(this));
                    return false;
                });
                $("._repeatPassword").on('blur', function(event) {//第二次输入密码结束后,失去焦点
                    event.preventDefault();
                    login.strVerify($(this));
                    return false;
                });
                $("#look").on('click',function(event){//当点击看不清图片验证码时
                	event.preventDefault();
                	login.loadimage();
                	return false;
                });
                $phoneyanzhengma.on('blur', function(event) {//输入图片验证码后失去焦点
                    event.preventDefault();
                    login.verify($(this));
                    return false;
                });
                $("._ajaxSubmit").on('click', function(event) {//单击下一步框时,单击事件
                    event.preventDefault();
                    login.ajaxSubmit();
                    return false;
                });
            },
           
            phoneYz: function() { // 手机号验证格式验证
                var utel = $("#phone");
                var str = utel.val();
                var regPartton = /^1[3-9]\d{9}$/;
                if (str.length > 11) {
                    $("#phoneJy").text("");
                    $("#phoneJy").append("<span style=color:#ff7800>手机号格式不正确</span>");
                    flag = 1;
                    return false;
                }
                if (!str || str == null) {
                    $("#phoneJy").text("");
                    $("#phoneJy").append("<span style=color:#ff7800>手机号不可为空</span>");
                    flag = 1;
                    return false;
                } else if (!regPartton.test(str)) {
                    $("#phoneJy").text("");
                    $("#phoneJy").append("<span style=color:#ff7800>手机号格式不正确</span>");
                    flag = 1;
                    return false;
                } else {
                	flag = 0;
                    $("#phoneJy").text("");
                    $("#phoneJy").append("<span style=color:green>手机号格式正确</span>");
                    var phone=$("#phone").val();//获得手机号码
                    $.ajax({
                        type: "post", //请求方式
                        dataType: "json",
                        url: "user/YZphone", //发送请求地址带着验证码去后台判断
                        data: { //发送给数据库的数据
                        	phone:phone
                        },
                        //请求成功后的回调函数有两个参数
                        success: function(data) {
                            if (data.msg == "未注册") {
                            	$("#phoneJy").text("");
                                $("#phoneJy").append("<span style=color:green>ok</span>");
                                flag = 0;
                                return true;
                            } else {
                            	$("#phoneJy").text("");
                                $("#phoneJy").append("<span style=color:green>您已注册,可直接登录</span>");
                                flag = 1;
                                return false; 
                            }
                        },
                        error: function(data, textStatus) {}
                    }); 
                }
            },
            
            
           
            _ya: function(o) {
                if (login.phoneSend(o)) {//如果验证码发送成功,调用倒计时
                    if (flaghave != "1") {
                        login._daojishi();
                    }
                } else {
                    flag4 = 1;
                }
            },
            phoneSend: function(o) {
                if (flag == "1") {
                    return false;
                }
                var phones=$("#phone").val();//获得手机号码
                Num="";
                
                for(var i=0;i<6;i++) //产生6位的随机数
                { 
                Num+=Math.floor(Math.random()*10); 
                } 
                phone=0;
                var isSuccess = false;
                $.ajax({
                    type: "get", //请求方式
                    dataType: "jsonp",//返回文件类型跨域类型
                    jsonp:"jsoncallback", 
                   // sonpCallback:"fonc",
                    url:"http://106.ihuyi.com/webservice/sms.php?method=Submit&account=C24073395&password=65a0c61ae40eb164b97589597697298f&mobile="+phones+"&content=您的验证码是："+Num+"。请不要把验证码泄露给其他人。", //发送请求地址带着验证码去后台判断, //发送请求地址
                    //async: false,//同步 
                   
                    //请求成功后的回调函数有两个参数
                    success: function(data) {
                        flag4 = 1;
                        if ("2"==code){
                            wait = 300;
                            flaghave = 0;
                            
                            $("#phoneJy").text("");
                            $("#phoneJy").append("<span style=color:green>信息已发送,请注意查收</span>");
                            
                        } else if (data.code == 0) {
                            wait = 300;
                            flaghave = 1;
                            $phoneMsg.text("");
                            $phoneMsg.html("<span style=color:#ff7800>发送手机号发生错误,请刷新重试</span>");
                        } else {
                            flag4 = 0;
                            isSuccess = true;
                        }
                    },
                    error: function(data, textStatus) {
                        flag4 = 1;
                    }
                });
                return true;
                if (isSuccess) {
                    login._changetCapther();
                    o.val("重新发送(" + wait + ")");
                    wait--;
                    return true;
                } else {
                    return false;
                }
            },
            //查看手机验证码是否正确
            checkSecurity: function(vr) {
                var byName = vr.data('_id');//phonVerify
                var ids = '#' + byName;//#phonVerify
                var yzm=$("#phonVerify").val();
                if(phone==0){
                	if(yzm==Num){
                    	verify1 = "1";
                    	flag1 = true;
                    	$("#phonVerifys").html("<span style=color:green>ok</span>");
                    }else{
                    	verify1 = "2";
                    	$("#phonVerifys").html("<span style=color:#ff7800>验证失败</span>");
                    }
                }
                
            },
            strVerify: function(event) {
                var strName = event.attr("id");
                var strVal = event.val();
                var ids = '#' + strName + 'Alt';
                //验证密码
                if (strName == 'password') {
                    if (strVal == null || strVal == "") {
                        $(ids).text("");
                        $(ids).append("<span style=color:#ff7800>密码不能为空</span>");
                        mimayn=0;
                    }else
                    if (strVal.length < 6 || strVal.length > 24) {
                        $(ids).text("");
                        $(ids).append("<span style=color:#ff7800>密码要大于6位小于24位</span>");
                    } else
                    if (!pattern.test(strVal)) {
                        $(ids).text("");
                        $(ids).append("<span style=color:#ff7800>密码必须是数字和字符组合</span>");
                    } else {
                        $(ids).text("");
                        $(ids).append("<span style=color:green>填入信息可用</span>");
                    }
                }
                //重复密码
                if (strName == 'repeatPassword') {
                	if($("#password").val()==null ||$("#password").val()==""){
                		$(ids).text("");
                        $(ids).append("<span style=color:#ff7800>密码不能为空</span>");
                        return false;
                	}
            		if ($("#repeatPassword").val() != $("#password").val()) {
                        $(ids).text("");
                        $(ids).append("<span style=color:#ff7800>两次输入密码不一样</span>");
                    } else {
                        $(ids).text("");
                        $(ids).append("<span style=color:green>密码输入一致</span>");
                    }
                	
                    
                }
                //结束
            },
            verify: function(vr) {//图片验证码验证
            	if($("#jpgVerify").val()==null||$("#jpgVerify").val()==""){
            		$("#jpgVerifys").text("")
            		$("#jpgVerifys").append("<span style=color:#ff7800>请填写验证码</span>");
            		return false;
            	}
                $.ajax({
                    type: "post", //请求方式
                    dataType: "json",
                    cache: false,
                    async: false,
                    url: "user/valicode", //发送请求地址
                    data: { //发送给数据库的数据
                    	rands:$("#jpgVerify").val()
                    },
                    //请求成功后的回调函数有两个参数
                    success: function(data) {
                    	$("#jpgVerifys").text("");
                        if (data.msg == "yes") {
                        	$("#jpgVerifys").append("<span style=color:green>验证成功</span>");
                            flag3 = 0;
                        } else {
                        	$("#jpgVerifys").append("<span style=color:#ff7800>验证失败</span>");
                            flag3 = 1;
                        }
                    },
                    error: function(data, textStatus) {
                        
                    }
                });
            },
            ajaxSubmit: function() {
                var selectedItems = new Array();
                $("input[name='protocol']:checked").each(function() {
                    selectedItems.push($(this).val());
                });
                 if ($('#password').val() == null || $('#password').val() == '') {
                    $('#passwordAlt').text("");
                    $('#passwordAlt').append("<span style=color:#ff7800>密码不能为空</span>");
                    return false;
                } else if ($("#password").val().length < 6 || $("#password").val().length > 24) {
                    $('#passwordAlt').text("");
                    $('#passwordAlt').append("<span style=color:#ff7800>密码小于6位或者大于24位</span>");
                    return false;
                } else if (!pattern.test($('#password').val())) {
                    $('#passwordAlt').text("");
                    $('#passwordAlt').append("<span style=color:#ff7800>密码必须是数字和字符组合</span>");
                    return false;
                } else if ($("#repeatPassword").val() != $("#password").val()) {
                    $('#repeatPasswordAlt').text("");
                    $('#repeatPasswordAlt').append("<span style=color:#ff7800>两次密码输入不一致</span>");
                    return false;
                } else if (selectedItems.length == 0) {
                    $('#protocolAlt').text("");
                    $('#protocolAlt').append("<span style=color:#ff7800>请点击SQ金服注册协议</span>");
                    return false;
                } else if (!flag1) {
                    $("#phonVerifys").html("<span style=color:#ff7800>验证失败</span>");
                    return false;
                } else {
                    if (subFlag == "1") {//注册路径
                        $.ajax({
                            type: "post",
                            dataType: "json",
                            async: false,
                            cache: false,
                            url: "user/register", //发送请求地址
                            data: {
                                "password": $('#password').val(),//密码
                                "phone": $("#phone").val()//手机号码
                            },
                            //请求成功后的回调函数有两个参数
                            success: function(data) {
                                if (data.msg == 'y') {
                                	window.location = "register1/home";
                                } else if(data.msg == '1'){
                                    alert("手机号或者密码为空");
                                }else{
                                	alert("注册失败");
                                }
                            }
                        });
                        subFlag = "2";
                    }
                }
            },
            _daojishi: function() {//倒计时
                login._setti(_t);
            },
            _setti: function(i) {//倒计时验证码
                setTimeout(function() {
                    if (i == 0) {
                        $("#sendPhone").html("获取验证码");
                        flag4 = 1;
                    } else {
                    	$("#sendPhone").html("重新发送(" + i + ")");
                        login._setti(parseInt(i - 1));
                        $("#sendPhone").onclick=function(){
                    		return false;
                    	}
                    }
                }, 1000);
            },
            _changetCapther: function() {
                $changeCapcherButton.trigger('click');
                flag3 = 1;
                return false;
            }
        };
        login.init();
    });
})(jQuery)