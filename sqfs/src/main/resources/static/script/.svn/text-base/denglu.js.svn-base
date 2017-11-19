(function($, undefined) {
    $(document).ready(function() {
        var flag1=true;
        var login = {
            init: function() {
                login._bind();
            },
           _bind: function() {
                
                $("#phone").on('blur keyup', function(event) {//输入手机号码后失去焦点
                    event.preventDefault();
                    login.phoneYz();//手机格式验证
                    return false;
                });
                $("#password").on('blur ', function(event) {//验证密码是否为空
                    event.preventDefault();
                    login.password();//
                    return false;
                });
               
                $("#look").on('click',function(event){//当点击看不清图片验证码时
                	event.preventDefault();
                	login.loadimage();
                	return false;
                });
                $("#jpgVerify").on('blur', function(event) {//输入图片验证码后失去焦点
                    event.preventDefault();
                    login.verify($(this));
                    return false;
                });
                $("#submitBtn").on('click', function(event) {//单击登录,单击事件
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
                    $("#prrintInfo").text("");
                    $("#prrintInfo").append("<span style=color:#ff7800>手机号格式不正确</span>");
                    flag = 1;
                    return false;
                }
                if (!str || str == null) {
                    $("#prrintInfo").text("");
                    $("#prrintInfo").append("<span style=color:#ff7800>手机号不可为空</span>");
                    flag = 1;
                    return false;
                } else if (!regPartton.test(str)) {
                    $("#prrintInfo").text("");
                    $("#prrintInfo").append("<span style=color:#ff7800>手机号格式不正确</span>");
                    flag = 1;
                    return false;
                } else {
                    $("#prrintInfo").text("");
                    $("#prrintInfo").append("<span style=color:green></span>");
                    var phone=$("#phone").val();//获得手机号码
                    return true;
                }
            },
            password: function(){
            	var pwd=$("#password").val();
            	if(pwd==null ||pwd ==''){
            		$('#pwdInfo').text("");
                    $('#pwdInfo').append("<span style=color:#ff7800>密码不能为空</span>");
            	}else{
            		$('#pwdInfo').text("");
                    $('#pwdInfo').append("<span style=color:green></span>");
            	}
            },

            verify: function(vr) {//图片验证码验证
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
//                        	$("#jpgVerifys").append("<span style=color:green>验证成功</span>");
                        	flag1=true;

                        } else {
                        	$("#jpgVerifys").append("<span style=color:#ff7800>验证失败</span>");
                        	flag1=false;
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
                var chk_value =[]; 
                var baocun="no";
                $('input[name="baocun"]:checked').each(function(){ 
                chk_value.push($(this).val()); 
                }); 
                if(chk_value.length!=0){
                	baocun="yes";
                }
                if ($("#phone").val() ==null|| $("#phone").val() =='') {
                    $("#prrintInfo").text("");
                    $("#prrintInfo").append("<span style=color:#ff7800>手机号不可为空</span>");
                    flag = 1;
                    return false;
                }else
                 if ($('#password').val() == null || $('#password').val() == '') {
                    $('#pwdInfo').text("");
                    $('#pwdInfo').append("<span style=color:#ff7800>密码不能为空</span>");
                    return false;
                } else if (selectedItems.length == 0) {
                    $('#protocolAlt').text("");
                    $('#protocolAlt').append("<span style=color:#ff7800>请点击SQ金服注册协议</span>");
                    return false;
                } else if (!flag1) {
                    $("#phonVerifys").html("<span style=color:#ff7800>验证失败</span>");
                    return false;
                } else {
                    $.ajax({
                        type: "post",
                        dataType: "json",
                        async: false,
                        cache: false,
                        url: "user/login", //发送请求地址
                        data: {
                            "password": $('#password').val(),//密码
                            "phone": $("#phone").val(),//手机号码
                            "mima":baocun
                        },
                        //请求成功后的回调函数有两个参数
                        success: function(data) {
                            if (data.msg == 'yes') {
                            	window.location = "index";
                            } else {
                            	$('#but').text("");
                                $('#but').append("<span style=color:#ff7800>登录失败,用户名或密码错误</span>");
                                return false;
                            }
                        }
                    });
                }
            }
        };
        login.init();
    });
})(jQuery)