var geteway = "";
//"http://" + window.location.host;
$(function ($) {
    $.validator.addMethod("regexusername", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("regexpwd", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("regexphone", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("iscard", function (value, element, params) {
        if (params) {
            return isIdCardNo(value);
        }
        return true;
    });
    $.validator.addMethod("borrowrole", function (value, element, params) {
        if (params) {
            if (value == 0) {
                return false;
            }
        }
        return true;
    });
    $.validator.addMethod("regexusername", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("regexpwd", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("isuser", function (value, element, params) {
        for (var i = 0; i < params.length; i++) {
            if (value == params[i]) {
                return false;
            }
        }
        return true;
    });
    $.validator.addMethod("address", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value.substring(0, 1));
    });
    $.validator.addMethod("addressmobile", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("zh", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("regexnum", function (value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    });
    $.validator.addMethod("minrate", function(value, element, params) {
        if (params <= value) {
            return true;
        }
        return false;
    });
    $.validator.addMethod("maxrate", function (value, element, params) {
        if (Number(params) >= (value)) {
            return true;
        }
        return false;
    });
    $.validator.addMethod("minAmount", function (value, element, params) {
        if (params <= value) {
            return true;
        }
        return false;
    });
    $.validator.addMethod("maxAmount", function (value, element, params) {
        if (Number(params) >= (value)) {
            return true;
        }
        return false;
    });
    //大于不等于
    $.validator.addMethod("maxnoteqmaxAmount", function (value, element, params) {
        if (Number(params) < (value)) {
            return true;
        }
        return false;
    });

    if ($("#resetpwdform").length > 0) {
        $("#resetpwdform").validate({
            rules: {
                username: {
                    required: true,
                    maxlength: 15,
                    minlength: 6,
                    regexusername: /^\w*[a-zA-Z]+\w*$/,
                    isuser: ["admin", "bank", "all", "money", "JuLend", "system", "vmd", "administrator", "admin", "administartor", "sysadmin"]
                },
                newpwd: {
                    required: true,
                    maxlength: 18,
                    minlength: 6,
                    regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                },
                newpwd2: {
                    required: true,
                    maxlength: 18,
                    minlength: 6,
                    regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/,
                    equalTo: "#password"
                },
                mobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                auth: { required: true }
            },
            messages: {
                username: {
                    required: "请输入6-15个字符的用户名",
                    maxlength: "请输入最大为15个字符的用户名",
                    minlength: "请输入最小为6个字符的用户名",
                    regexusername: "用户名由字母，数字和下划线组成，且必须包含字母",
                    isuser: "该用户名不合法"
                },
                newpwd: {
                    required: "请输入密码",
                    maxlength: "请输入最大为18个字符的密码",
                    minlength: "请输入最小为6个字符的密码",
                    regexpwd: "密码必须包含字母和数字",
                },
                newpwd2: {
                    required: "请输入密码",
                    maxlength: "请输入最大为18个字符的密码",
                    minlength: "请输入最小为6个字符的密码",
                    // regexpwd: "密码由字母，数字和特殊字符组成，且必须包含字母和数字",
                    regexpwd: "密码必须包含字母和数字",
                    equalTo: "密码输入不一致"
                },
                mobile: {
                    required: "请输入手机号码",
                    regexphone: "请输入正确的手机号码"
                },
                auth: { required: "请输入验证码" }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function () {
                var data = {
                    // userName: $("#username").val(),
                    newPwd: $("#password").val(),
                    newPwd2: $("#password1").val(),
                    mobile: $("#mobile").val(),
                    auth: $("#auth").val(),
                    CSRFToken:$("#CSRFToken").val(),
                };
                $.post(geteway+"/user/reset/pwd",data,function (successData) {
                    if (successData =="1") {
                        layer.open({
                            content: '修改成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                layer.close(index);
                                window.location.href = "/login";
                            }
                            ,cancel: function(){
                                window.location.href = "/login";
                            }
                        });
                    }else{
                        layer.alert(successData.errorMessage);
                    }
                });
            }
        });
    }
    if ($("#modifypwdform").length > 0) {
        $("#modifypwdform").validate({
            rules: {
                pwd: {
                    required: true,
                    maxlength: 18,
                    minlength: 6,
                    regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                  
                },
                newpwd: {
                    required: true,
                    maxlength: 18,
                    minlength: 6,
                    regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                },
                newpwd2: {
                    required: true,
                    maxlength: 18,
                    minlength: 6,
                    regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/,
                    equalTo: "#newpwd"
                }
            },
            messages: {
                pwd: {
                    required: "请输入原密码",
                    maxlength: "请输入最大为18个字符的密码",
                    minlength: "请输入最小为6个字符的密码",
                    regexpwd: "密码必须包含字母和数字"
                },
                newpwd: {
                    required: "请输入新密码",
                    maxlength: "请输入最大为18个字符的密码",
                    minlength: "请输入最小为6个字符的密码",
                    regexpwd: "密码必须包含字母和数字",
                    equalTo: "密码输入不一致"
                },
                newpwd2: {
                    required: "请且确认新密码",
                    maxlength: "请输入最大为18个字符的密码",
                    minlength: "请输入最小为6个字符的密码",
                    regexpwd: "密码必须包含字母和数字",
                    equalTo: "密码输入不一致"
                }
              
            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next(".msgnav"));
            }, submitHandler: function () {
                var data = {
                    pwd: $("#pwd").val(),
                    newPwd: $("#newpwd").val(),
                    newPwd2: $("#newpwd2").val()
                };
                $.post(geteway+"/user/modifypwd",data,function (successData) {
                    if (successData == 1) {
                        layer.open({
                            content: '修改成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                layer.close(index);
                                window.location.reload();
                            }
                            ,cancel: function(){
                                window.location.reload();
                            }
                        });
                    }else {
                        layer.alert(successData.errorMessage);
                    }
                });
            }
        });
    }
    if ($("#bindemailform").length > 0) {
        $("#bindemailform").validate({
            rules: {
                email: {
                    required: true,
                    email:true
                    //emailtest:/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
                 },
                emailcode: {
                    required: true,
                    maxlength: 6,
                    minlength: 6,
                    regexnum: /^[0-9]*$/
                }
            },
            messages: {
                email: {
                    required: "请输入邮箱地址",
                    email:"请输入正确的邮箱地址",
                    //emailtest: "请输入正确的邮箱地址",
                },
                emailcode: {
                    required: "请输入验证码",
                    maxlength: "请输入正确的验证码",
                    minlength: "请输入正确的验证码",
                    regexnum: "请输入正确的验证码"
                }

            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next());
            }, submitHandler: function () {
                var data = {
                    Email: $("#email").val(),
                    EmailCode: $("#emailcode").val()
                };
                $.post(geteway + "/user/bindemail", data, function (data) {
                    if (data == 1) {
                        layer.open({
                            content: '绑定成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                layer.close(index);
                                window.location.href = "/user/security";
                            }
                            ,cancel: function(){
                                window.location.href = "/user/security";
                            }
                        });
                    }else {
                        layer.alert(data.errorMessage);
                    }
                });
            }
        });
    }
    if ($("#authbindemail").length > 0) {
        $("#authbindemail").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                emailcode: {
                    required: true,
                    maxlength: 6,
                    minlength: 6,
                    regexnum: /^[0-9]*$/
                }
            },
            messages: {
                email: {
                    required: "请输入原邮箱地址",
                    email: "请输入正确的邮箱地址"
                },
                emailcode: {
                    required: "请输入验证码",
                    maxlength: "请输入正确的验证码",
                    minlength: "请输入正确的验证码",
                    regexnum: "请输入正确的验证码"
                }

            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next());
            }, submitHandler: function () {
                var data = {
                    Email: $("#email").val(),
                    EmailCode: $("#emailcode").val()
                };

                $.post(geteway + "/user/verifyemail", data, function (data) {
                    if (data == 1) {
                        layer.alert('验证成功');
                        $("#yzemaildiv").hide();
                        $("#newemaildiv").show();
                    }else {
                        layer.alert(data.errorMessage);
                    }
                });
            }
        });
    }
    if ($("#editnewemail").length > 0) {
        $("#editnewemail").validate({
            rules: {
                newemail: {
                    required: true,
                    email: true
                },
                newcode: {
                    required: true,
                    maxlength: 6,
                    minlength: 6,
                    regexnum: /^[0-9]*$/
                }
            },
            messages: {
                newemail: {
                    required: "请输入新邮箱地址",
                    email: "请输入正确的邮箱地址"
                },
                newcode: {
                    required: "请输入验证码",
                    maxlength: "请输入正确的验证码",
                    minlength: "请输入正确的验证码",
                    regexnum: "请输入正确的验证码"
                }

            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next());
            }, submitHandler: function () {
                var data = {
                    NewEmail: $("#newemail").val(),
                    NewCode: $("#newcode").val()
                };

                $.post(geteway + "/user/bindnewemail", data, function (data) {
                    if (data == 1) {
                        layer.open({
                            content: '绑定成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                layer.close(index);
                                window.location.href = "/user/security";
                            }
                            ,cancel: function(){
                                window.location.href = "/user/security";
                            }
                        });
                    }else {
                        window.location.href = "/user/security";
                    }
                });
            }
        });
    }
    if ($("#editnewemail").length > 0) {
        $("#editnewemail").validate({
            rules: {
                newemail: {
                    required: true,
                    email: true
                },
                newcode: {
                    required: true,
                    maxlength: 6,
                    minlength: 6,
                    regexnum: /^[0-9]*$/
                }
            },
            messages: {
                newemail: {
                    required: "请输入新邮箱地址",
                    email: "请输入正确的邮箱地址"
                },
                newcode: {
                    required: "请输入验证码",
                    maxlength: "请输入正确的验证码",
                    minlength: "请输入正确的验证码",
                    regexnum: "请输入正确的验证码"
                }

            }, errorPlacement: function (error, element) {
                if (element.is(":radio")) {
                    error.appendTo(element.parent().parent());
                }
                else if (element.is(":checkbox")) {
                    error.appendTo(element.parent());
                } else {
                    error.appendTo(element.parent());
                }
            }, submitHandler: function () {
                var data = {
                    NewEmail: $("#newemail").val(),
                    NewCode: $("#newcode").val()
                };
                geteway.postToService(
                    {
                        BindNewEmail: data
                    }, function (successData) {
                        if (successData == 1) {
                            layer.open({
                                content: '绑定成功'
                                ,btn: ['确定']
                                ,yes: function(index, layero){
                                    layer.close(index);
                                    window.location.href = "/user/security";
                                }
                                ,cancel: function(){
                                    window.location.href = "/user/security";
                                }
                            });;
                        }else{
                            window.location.href = "/user/security";
                        }
                    }, function (errorData) {
                        layer.alert(errorData.message);
                    }
                );
            }
        });
    }
    if ($("#regform").length > 0) {
        $("#regform").validate({
            rules: {
                // UserName: {
                //     required: true,
                //     maxlength: 15,
                //     minlength: 6,
                //     regexusername: /^\w*[a-zA-Z]+\w*$/,
                //     isuser:["admin", "bank", "all", "money", "JuLend", "system", "vmd","administrator","admin","administartor","sysadmin"]
                // },
                // Password: {
                //     required: true,
                //     maxlength: 16,
                //     minlength: 8,
                //     regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                // },
                IdenType:{ required: true },
                Mobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                // Role: { required: true },
                Captcha: { required: true },
                aeccpet: { required: true },
                PhoneCode:{required: true},
                remote: {
                    data: {
                        UserName: function () {
                            return $('#UserName').val();
                        }
                    },
                    url: "",
                    type: "post"
                }
            },
            messages: {
                // UserName: {
                //     required: "请输入6-15个字符的用户名",
                //     maxlength: "请输入最大为15个字符的用户名",
                //     minlength: "请输入最小为6个字符的用户名",
                //     regexusername: "用户名由字母，数字和下划线组成，且必须包含字母",
                //     isuser:"该用户名不合法"
                // },
                // Password: {
                //     required: "请输入密码",
                //     maxlength: "请输入最大为16个字符的密码",
                //     minlength: "请输入最小为8个字符的密码",
                //     regexpwd: "密码由字母，数字和特殊字符组成，且必须包含字母和数字"
                // },
                Mobile: {
                    required: "请输入手机号码",
                    regexphone: "请输入正确的手机号码"
                },
                // Role: { required: "请选择角色" },
                IdenType: { required: "请选择用户类型" },
                Captcha: { required: "请输入图形验证码" },
                aeccpet: { required: "请同意协议" },
                PhoneCode:{required: "请输入短信验证码"}
            }, errorPlacement: function (error, element) {
                if(element.attr("type")=="radio"){
                    error.appendTo(element.parent().parent().next(".msgnav"));
                }else {
                    error.appendTo(element.parent().next(".msgnav"));
                }
            }, submitHandler: function () {
                var data = {
                    // UserName: $("#UserName").val(),
                    // Password: $("#Password").val(),
                    Mobile: $("#RegMobile").val(),
                    // RoleId: $("input[name='Role']:checked").val(),
                    Captcha: $("#Captcha").val(),
                    Key: $("#Key").val(),
                    PhoneCode:$("#PhoneCode").val(),
                    IdenType:$("input[name='IdenType']:checked").val(),
                };
                $.post(geteway+"/registerfirst",data,function (successData) {
                    //console.log(successData);
                    if(successData.register!=null && successData.register!=undefined ){
                        // $("#mobile").val(successData.register.mobile);
                        // $("#lblUserName").text(successData.register.userName);
                        // $("#regform").parent().hide();
                        // $("#Verifyform").parent().show();
                        // $(".reg-process").find('div[class="p2"]').addClass('on');
                        // $(".reg-process-txt").find("div").eq(1).addClass('f-cr2');
                        $("#regform").hide();
                        $("#regformpassword").show();
                        $("div.title").text("注册");
                    }else {
                        layer.alert(successData.message);
                        $("#authimg").attr("src", '/getcaptcha.sl?encryptText=' + Math.random());
                    }
                });
                // geteway.postToService(
                //     {
                //         Register: data
                //     }, function (successData) {
                //         //console.log(successData);
                //         $("#mobile").val(successData.Register.Mobile);
                //         $("#lblUserName").text(successData.Register.UserName);
                //
                //         $("#regform").parent().hide();
                //         $("#Verifyform").parent().show();
                //         $(".reg-process").find('div[class="p2"]').addClass('on');
                //         $(".reg-process-txt").find("div").eq(1).addClass('f-cr2');
                //     }, function (errorData) {
                //         //console.log(errorData);
                //         alert(errorData.message);
                //         $("#authimg").attr("src", '/captchaimage?encryptText=' + Math.random());
                //     }
                // );
            }
        });
    }

    if ($("#regformnewer").length > 0) {
      $("#regformnewer").validate({
        onkeyup: false,
        onsubmit: false,
        onfocusout: false,
        rules: {
          Mobile: {
            required: true,
            regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
          },
          Password: {
              required: true,
              maxlength: 18,
              minlength: 6,
              regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
          },
          Captcha: {
            required: true
          },
          PhoneCode: {
            required: true
          },
          Accpet: {
            required: true
          }
        },
        messages: {
          Mobile: {
            required: "请输入手机号码",
            regexphone: "请输入正确的手机号码"
          },
          Password: {
              required: "请输入密码",
              maxlength: "请输入最大为18个字符的密码",
              minlength: "请输入最小为6个字符的密码",
              regexpwd: "密码由字母，数字和特殊字符组成，且必须包含字母和数字"
          },
          Captcha: {
            required: "请输入图形验证码"
          },
          PhoneCode: {
            required: "请输入短信验证码"
          },
          Accpet: {
            required: "请同意协议"
          }
        },
        errorPlacement: function (error, element) {
          if (!ZW_STATE.isErrorLayerShow) {
            ZW_STATE.isErrorLayerShow = true;
            layer.alert(
              error.text(),
              {
                yes: function(index) {
                  ZW_STATE.isErrorLayerShow = false;
                  layer.close(index);
                },
                cancel: function (index) {
                  ZW_STATE.isErrorLayerShow = false;
                  layer.close(index);
                }
              }
            );
          }
        }
      });
    }

    if ($("#regformpassword").length > 0) {
        $("#regformpassword").validate({
            rules: {
                Password: {
                    required: true,
                    maxlength: 18,
                    minlength: 6,
                    regexpwd: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                },
                rePassword:{
                    required: true,
                    equalTo:"#Password"
                }
            },
            messages: {
                Password: {
                    required: "请输入密码",
                    maxlength: "请输入最大为18个字符的密码",
                    minlength: "请输入最小为6个字符的密码",
                    regexpwd: "密码必须包含字母和数字"
                },
                rePassword: {
                    required: "请确认密码",
                    equalTo:"密码输入不一致，请重新输入"
                }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function () {
                var data = {
                    Password: $("#Password").val(),
                    Key: $("#Key").val(),
                    Mobile: $("#RegMobile").val(),
                    Captcha: $("#Captcha").val(),
                    PhoneCode:$("#PhoneCode").val(),
                    IdenType:$("input[name='IdenType']:checked").val(),
                    inviterNumber:$("#inviterNumber").val(),
                    channel:$("#channel").val(),
                    CSRFToken:$("#CSRFToken").val()
                };
                var strHtml = "";
                strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                strHtml += "<div class=\"loading\">";
                strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                strHtml += "    <p>提交中。。。<\/p>";
                strHtml += "<\/div>";
                // $.post(geteway+"/register",data,function (successData) {
                //     if(successData.register!=null && successData.register!=undefined ){
                //         window.location.href = '/useridentity';
                //     }else {
                //         alert(successData.message);
                //         //$("#authimg").attr("src", '/getcaptcha.sl?encryptText=' + Math.random());
                //     }
                // });
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: geteway+"/register",
                    data: data,
                    datatype:"Json",
                    beforeSend:function (XHR) {
                        $("body").append(strHtml);
                    },
                    success: function (data) {
                        if(data.register!=null && data.register!=undefined ){
                            layer.open({
                                content: '注册成功'
                                ,btn: ['确定']
                                ,yes: function(index, layero){
                                    layer.close(index);
                                    window.location.href = '/';
                                }
                                ,cancel: function(){
                                    window.location.href = '/';
                                }
                            });

                        }else {
                            $(".dialog-bg").remove();
                            $(".loading").remove();
                            layer.alert(data.message);
                        }
                    },
                    error: function (request) {
                        $(".dialog-bg").remove();
                        $(".loading").remove();
                        layer.alert("服务器返回了一个错误");
                    }
                });
            }
        });
    }

    if ($("#Networkform").length > 0) {
        $("#Networkform").validate({
            rules: {
                ShopAccount: { required: true},
                Url: { required: true}
            },
            messages: {
                ShopAccount: { required: "请输入旺旺名" },
                Url: { required: "请输入网店地址" }
            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next(".msgnav"));
            }, submitHandler: function () {
                $("#btnNetwork").attr("disabled", 'disabled');
                var data = {
                    shopAccount: $("input[name='ShopAccount']").val(),
                    url: $("input[name='Url']").val(),
                    shopTypeId: 1
                };
                $.post(geteway+"/user/network",data,function (successData) {
                    if (successData == 1) {
                        layer.open({
                            content: '申请成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                layer.close(index);
                                window.location.reload();
                            }
                            ,cancel: function(){
                                window.location.reload();
                            }
                        });
                    }else {
                        $("#btnNetwork").removeAttr("disabled");
                        layer.alert(successData.message);
                    }
                });
            }
        });
    }
    if ($("#Verifyform").length > 0) {
        $("#Verifyform").validate({
            rules: {
                Mobile: { required: true, regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/ },
                MobileCode: { required: true, maxlength: 6, minlength: 6, regexnum: /^[0-9]*$/ }
            },
            messages: {
                Mobile: { required: "请输入手机号码", regexphone: "请输入正确的手机号码" },
                MobileCode: { required: "请输入验证码" ,minlength:"请输入正确的验证码",maxlength:"请输入正确的验证码",regexnum:"请输入正确的验证码"}
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function () {
                var data = {
                    Mobile: $("#mobile").val(),
                    MobileCode: $("#MobileCode").val(),
                    IsGiveVoucher: true,
                    Key: $("#Key").val()
                };

                $.post(geteway+"/user/bindmobile",data,function (successData) {
                    if (successData == 1) {
                        $(".userform").hide().last().show();
                        $(".reg-process").find('div').last().addClass('on');
                        $(".reg-process-txt").find("div").eq(2).addClass('f-cr2');
                        fiveMlater("/account");
                    }
                });

                // geteway.postToService(
                //     {
                //         BindMobile: data
                //     }, function (successData) {
                //         if (successData == 1) {
                //             $(".userform").hide().last().show();
                //             $(".reg-process").find('div').last().addClass('on');
                //             $(".reg-process-txt").find("div").eq(2).addClass('f-cr2');
                //             fiveMlater("/account");
                //         }
                //     }, function (errorData) {
                //         //console.log(errorData);
                //         alert(errorData.message);
                //     }
                // );
            }
        });
    }
    if ($("#bindidentity").length > 0) {
        $("#bindidentity").validate({
            focusInvalid: true,
            rules: {
                realname: {
                    required: true,
                    zh: /[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*/,
                    minlength: 2,
                    maxlength: 13
                },
                idnum: {
                    required: true,
                    iscard: true
                }
            },
            messages: {
                realname: {
                    required: "请输入真实姓名",
                    zh: "请输入至少2位中文",
                    minlength: "真实姓名必须大于2个汉字",
                    maxlength: "真实姓名必须小于13个汉字"
                },
                idnum: {
                    required: "请输入真实的身份证号码",
                    iscard: "请输入正确的身份证号码"
                }
            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next(".msgnav"));
            }, submitHandler: function () {

                $("input[type='text']").each(function () {
                    $(this).val(toTxt($(this).val()));
                });
                var data = {
                    realName: $("input[name='realname']").val(),
                    idNum: $("input[name='idnum']").val()
                };
                $.post(geteway+"/user/identity",data,function (successData) {
                    if (successData == 1) {
                        layer.open({
                            content: '认证成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                layer.close(index);
                                window.location.reload();
                            }
                            ,cancel: function(){
                                window.location.reload();
                            }
                        });
                    }else {
                        layer.alert("认证失败");
                    }
                });
            }
        });
    }
    if ($("#bindmoileform").length > 0) {
        $("#bindmoileform").validate({
            focusInvalid: true,
            rules: {
                mobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                mobilecode: {
                    required: true               }
            },
            messages: {
                mobile: {
                    required: "请输入手机号码",
                    regexphone:"请输入正确的手机号码"
                },
                mobilecode: {
                    required: "请输入验证码"
                }
            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next());
            }, submitHandler: function () {

                $("input[type='text']").each(function () {
                    $(this).val(toTxt($(this).val()));
                });
                var data = {
                    mobile: $("#mobile").val(),
                    mobileCode: $("#mobilecode").val()
                };
                $.post(geteway+"/user/bindmobile",data,function (successData) {
                    if (successData == 1) {
                        location.href = "/user/security";
                    }else {
                        layer.alert(successData.errorMessage);
                    }
                });
            }

        });
    }
    if ($("#editmoileform1").length > 0) {
        $("#editmoileform1").validate({
            focusInvalid: true,
            rules: {
                mobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                originalmobilecode: {
                    required: true
                }
            },
            messages: {
                mobile: {
                    required: "请输入手机号码",
                    regexphone: "请输入正确的手机号码"
                },
                originalmobilecode: {
                    required: "请输入验证码"
                }
            }, errorPlacement: function (error, element) {
                    element.parent().parent().next().css("margin-left", "65px");
                    error.appendTo(element.parent().parent().next());
               
            }, submitHandler: function () {

                $("input[type='text']").each(function () {
                    $(this).val(toTxt($(this).val()));
                });
                var data = {
                    mobile: $("#mobile").val(),
                    originalMobileCode: $("#originalmobilecode").val()
                };
                $.post(geteway + "/user/originalmobile", data, function (successData) {
                    if (successData == 1) {
                        $("#mobilediv").hide();
                        $("#newmobilediv").show();
                    } else {
                        layer.alert(successData.errorMessage);
                    }
                })
            }
        });
    }
    if ($("#editmoileform2").length > 0) {
        $("#editmoileform2").validate({
            focusInvalid: true,
            rules: {
                newmobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                mobilecode: {
                    required: true
                }
            },
            messages: {
                newmobile: {
                    required: "请输入手机号码",
                    regexphone: "请输入正确的手机号码"
                },
                mobilecode: {
                    required: "请输入验证码"
                }
            }, errorPlacement: function (error, element) {
                element.parent().parent().next().css("margin-left", "65px");
                error.appendTo(element.parent().parent().next());
            }, submitHandler: function () {
                $("input[type='text']").each(function () {
                    $(this).val(toTxt($(this).val()));
                });
                var data = {
                    newmobile: $("#newmobile").val(),
                    newmobilecode: $("#mobilecode").val()
                };
                $.post(geteway+"/user/bindnewmobile",data,function (successData) {
                    if (successData == 1) {
                        location.href = "/user/security";
                    }else {
                        layer.alert(successData.errorMessage);
                    }
                });
            }
        });
    }
    if ($("#publishform").length > 0) {
        $("#publishform").validate({
            focusInvalid: true,
            rules: {
                Title: {
                    required: true
                },
                LoanUseId:{
                    required: true
                },
                Amount: {
                    required: true,
                    // maxAmount: 1000000,
                    // minAmount: 1
                    maxAmount: Number($("#Limit").val().split(",")[1]),
                    minAmount: Number($("#Limit").val().split(",")[0])
                },
                // Rate: {
                //     required: true,
                //     maxrate: Number($("#Rates").val().split(",")[1]),
                //     minrate: Number($("#Rates").val().split(",")[0])
                // },
                LoanPeriod:{
                    required: true
                },
                IndustryType:{
                    required: true
                },
                RepaymentTypeId:{
                    required: true
                },
                Description: {
                    required: true
                },
                Aeccpet:{
                    required: true
                },
                BusinessName:{
                    required: true
                }
            },
            messages: {
                Title: {
                    required: "请输入借款标题"
                },
                LoanUseId:{
                    required: "请选择借款用途"
                },
                Amount: {
                    required: "请输入借款金额",
                    maxAmount: $.validator.format("最大借款金额为{0}元"),
                    minAmount: $.validator.format("借款金额最少为{0}元")
                },
                // Rate: {
                //     required: "请输入年利率",
                //     minrate: $.validator.format("年利率最小为{0}%"),
                //     maxrate: $.validator.format("年利率最大为{0}%")
                // },
                LoanPeriod:{
                    required: "请选择借款期限"
                },
                RepaymentTypeId:{
                    required: "请选择还款方式"
                },
                IndustryType:{
                    required: "请选择特殊行业"
                },
                Description: {
                    required: "请输入企业介绍"
                },
                Aeccpet:{
                    required: "请同意以上协议"
                },
                BusinessName:{
                    required: "请输入商户名称"
                }
            }, errorPlacement: function (error, element) {
                //element.parent().parent().find(".errormsg").css("margin-left", "35px");
                if(element.parent().next("p.msgnav")[0]!=undefined){
                    error.appendTo(element.parent().next("p.msgnav"));
                }else {
                    error.appendTo(element.parent().parent().next("p.msgnav"));
                }
            }, submitHandler: function () {
                $("#btnOk").attr("disabled", "disabled");
                publishVerify();
            }

        });
    }
    //提现
    if ($("#withdrawcashform").length > 0) {
        $("#withdrawcashform").validate({
            focusInvalid: true,
            rules: {
                WithDrawAmount: {
                    required: true,
                    maxAmount: Number($("#yeAmount").attr("amount")),
                    maxnoteqmaxAmount: Number($("#yeAmount").attr("minAmount"))
                }
            },
            messages: {
                WithDrawAmount: {
                    required: "请输入提现金额",
                    maxAmount: "提现金额不能大于可用余额",
                    maxnoteqmaxAmount: "请输入大于" + Number($("#yeAmount").attr("minAmount")) + "的金额"
                }
            }, errorPlacement: function (error, element) {
                
                    error.appendTo(element.parent().parent().next());
              
            }, submitHandler: function (form) {
                form.submit();
            }

        });
    }
    if ($("#userinfoform").length > 0) {
        $("#userinfoform").validate({
            focusInvalid: true,
            rules: {
                RealName: {
                    required: true,
                    zh: /[\u4E00-\u9FA5_A-Za-z·]*/,
                    minlength: 2,
                    maxlength: 13
                },
                IdNumber: {
                    required: true,
                },
                Mobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                Email: {
                    required: true,
                    regexnum: /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/
                },
                EducationId: { required: true,regexnum: /^[0-9]*$/ },
                qq: {
                    required: true,
                    regexnum: /^[0-9]*$/
                },
                MarriageStatusId: { required: true },
                ResidenceTypeId: { required: true,regexnum: /^[0-9]*$/ },
                city: { required: true },
                city2: { required: true },
                UserDistrictId: { required: true },
                ResidencePhone: {
                    required: true,
                    addressmobile: /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/
                },
                HasBuyCar: { required: true },
                SecondRealName: {
                    required: true,
                    zh: /[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*/,
                    minlength: 2,
                    maxlength: 13
                },
                SecondRelationShipId: { required: true,regexnum: /^[0-9]*$/  },
                SecondMobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                ThirdRealName: {
                    required: true,
                    zh: /[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*/,
                    minlength: 2,
                    maxlength: 13
                },
                ThirdRelationShipId: { required: true,regexnum: /^[0-9]*$/  },
                ThirdMobile: {
                    required: true,
                    regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                BorrowerRoleId: {
                    borrowrole: true
                },
                IncomeTypeId: { required: true },
                IsWelfare: { required: true },
                CompanyTypeId: { regexnum:  /^[1-9]$/ },
                WorkYears: { regexnum: /^[1-9]$/  },
                WECompanyName: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                Department: {
                    required: true,
                    minlength: 2,
                    maxlength: 15
                },
                WECompanyAddress:{
                    maxlength: 40
                },
                workcity: { required: true },
                workcity2: { required: true },
                WEDistrictId: { required: true  },

                WECompanyPhone: {
                    required: true,
                    addressmobile: /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/
                },
                COCompanyName: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                COCompanyAddress:{maxlength: 40},
                COCompanySize: { required: true },
                Companycity: { required: true },
                Companycity2: { required: true },
                CODistrictId: { required: true },

                COCompanyPhone: {
                    required: true,
                    addressmobile: /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/
                },
                BusinessLicenseId: { required: true },
                ShopTypeId: { required: true },
                SellerAccount: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                ShopUrl: {
                    required: true,
                    minlength: 2,
                    maxlength: 20,
                    relurl:/[a-zA-z]+:\/\/[^\s]*/
                },
                Turnover: {
                    required: true, regexnum: /^[0-9]*$/,
                    minlength: 1,
                    maxlength: 10,
                    number:true
                },
                netcity: { required: true },
                netcity2: { required: true },
                OSDistrictId: { required: true },
                ShopAddress:{ required: true,minlength:2,maxlength:40},
                SchoolName: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                DormitoryPhone: {
                    required: true,
                    addressmobile: /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/
                },
                SourceRepayment: {
                    required: true ,
                    minlength: 2,
                    maxlength: 20},
                OTSourceRepayment: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                }
            },
            messages: {
                RealName: {
                    required: "请输入真实姓名",
                    zh: "请输入至少2位中文或英文",
                    minlength: "真实姓名必须大于2个汉字",
                    maxlength: "真实姓名必须小于13个汉字"
                },
                IdNumber: {
                    required: "请输入真实的身份证号码",

                },
                Mobile: {
                    required: "请输入手机号码",
                    regexphone: "请输入正确的手机号码"
                },
                Email: {
                    required: "请输入邮箱地址",
                    regexnum: "请输入正确的邮箱地址"
                },
                EducationId: { required: "请选择教育程度",regexnum:"请选择教育程度" },
                qq: { required: "请输入QQ号码", regexnum: "请输入正确的QQ号码" },
                MarriageStatusId: { required: "请选择婚姻状况" },
                ResidenceTypeId: { required: "请选择住房条件",regexnum:"请选择住房条件" },
                city: { required: "请选择地址所在省份" },
                city2: { required: "请选择地址所在市" },
                UserDistrictId: { required: "请选择地址所在区县" },

                ResidencePhone: {
                    required: "请输入居住电话",
                    addressmobile: "请输入正确的居住电话"
                },

                HasBuyCar: { required: "请选择是否购车" },
                SecondRealName: {
                    required: "请输入第二联系人姓名",
                    zh: "请输入至少2位中文",
                    minlength: "第二联系人姓名最少为2个汉字",
                    maxlength: "第二联系人姓名最少为13个汉字"
                },
                SecondRelationShipId: { required: "请选择第二联系人关系",regexnum: "请选择第二联系人关系"  },
                SecondMobile: {
                    required: "请输入第二联系人手机",
                    regexphone: "请输入正确的第二联系人手机"
                },
                ThirdRealName: {
                    required: "请输入第三联系人姓名",
                    zh: "请输入至少2位中文",
                    minlength: "第三联系人姓名最少为2个汉字",
                    maxlength: "第三联系人姓名最少为13个汉字"
                },
                ThirdRelationShipId: { required: "请选择第三联系人关系",regexnum: "请选择第三联系人关系"  },
                ThirdMobile: {
                    required: "请输入第三联系人手机",
                    regexphone: "请输入正确的第三联系人手机"
                },
                BorrowerRoleId: {
                    borrowrole: "请选择就业状态"
                },
                IncomeTypeId: { required: "请选择收入发放方式" },
                IsWelfare: { required: "请输入是否缴纳社保/公积金" },
                CompanyTypeId: { regexnum: "请输入单位性质" },
                WorkYears: { regexnum: "请输入工作年限" },
                WECompanyName: {
                    required: "请输入单位名称",
                    minlength: "请输入2-20个字",
                    maxlength: "请输入2-20个字"
                },
                Department: {
                    required: "请输入任职部门",
                    minlength: "请输入2-15个字",
                    maxlength: "请输入2-15个字"
                },
                WECompanyAddress:{
                    maxlength: "请输入40个字以内"
                },
                workcity: { required: "请选择单位地址所在省" },
                workcity2: { required: "请选择单位地址所在市" },
                WEDistrictId: {
                    required: "请选择单位地址所在区县"
                },

                WECompanyPhone: {
                    required: "请输入单位电话",
                    addressmobile: "请输入正确的单位电话"
                },
                COCompanyName: {
                    required: "请输入公司名称",
                    minlength: "请输入2-20个字",
                    maxlength: "请输入2-20个字"
                },
                COCompanyAddress:{maxlength: "不超过40个字"},
                COCompanySize: { required: "请选择公司人数" },
                Companycity: { required: "请选择经营地址所在省" },
                Companycity2: { required: "请选择经营地址所在市" },
                CODistrictId: { required: "请选择经营地址所在区县" },

                COCompanyPhone: {
                    required: "请输入公司电话",
                    addressmobile: "请输入正确的公司电话"
                },
                BusinessLicenseId: { required: "请选择是否拥有营业执照" },
                ShopTypeId: { required: "请选择所经营的网店" },
                SellerAccount: {
                    required: "请输入卖家帐号",
                    minlength: "请输入2-20个字符",
                    maxlength: "请输入2-20个字符",
                },
                ShopUrl: {
                    required: "请输入店铺地址",
                    minlength: "请输入2-20个字符",
                    maxlength: "请输入2-20个字符",
                    relurl:"请输入正确的店铺地址"
                },
                Turnover: { required: "请输入月营业额",number:"请输入正确的营业额",minlength:"请输入1-10位",maxlength:"请输入1-10位" },
                netcity: { required: "请选择经营地址所在省" },
                netcity2: { required: "请选择经营地址所在市" },
                OSDistrictId: { required: "请选择经营地址所在区县" },
                ShopAddress:{required:"请输入经营地址",minlength:"请输入2-40字符",maxlength:"请输入2-40字符"},
                SchoolName: {
                    required: "请输入学校名称",
                    minlength: "学校名称为2-20个字",
                    maxlength: "学校名称为2-20个字"
                },
                DormitoryPhone: {
                    required: "请输入宿舍电话",
                    addressmobile: "请输入正确的宿舍电话"
                },
                SourceRepayment: {
                    required: "请输入还款来源" ,
                    minlength: "还款来源为2-20个字",
                    maxlength: "还款来源为2-20个字"
                },
                OTSourceRepayment: {
                    required: "请输入还款来源" ,
                    minlength: "还款来源为2-20个字",
                    maxlength: "还款来源为2-20个字"
                }
            }, errorPlacement: function (error, element) {
                if (element.parent().find("select").length > 1) {
                    error.appendTo(element.parent().parent().next().next());
                }else{
                    error.appendTo(element.parent().parent().next());
                }
            }, submitHandler: function () {
                $("input[type='text']").each(function () {
                    $(this).val(toTxt($(this).val()));
                });
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: "/user/update",
                    data: $('#userinfoform').serialize(),// 你的formid
                    async: false,
                    datatype:"Json",
                    error: function (request) {
                        layer.alert(request);
                    },
                    success: function (data) {
                        if (data == 1) {
                            layer.open({
                                content: '保存成功！'
                                ,btn: ['确定']
                                ,yes: function(index, layero){
                                    layer.close(index);
                                    window.location.reload();
                                }
                                ,cancel: function(){
                                    window.location.reload();
                                }
                            });
                        } else {
                            layer.open({
                                content:data
                                ,btn: ['确定']
                                ,yes: function(index, layero){
                                    layer.close(index);
                                    if (data == "修改成功") {
                                        window.location.reload();
                                    }
                                }
                                ,cancel: function(){
                                    if (data == "修改成功") {
                                        window.location.reload();
                                    }
                                }
                            });
                        }
                    }
                });
            }

        });
    }

    //个人存管账户开户
    if ($("#usrapply").length > 0) {
        $("#usrapply").validate({
            rules: {
                cust_nm:{
                    required: true,
                },
                certif_id:{
                    required: true,
                },
                email:{
                    email: true
                },
                // pri_id:{
                //     equalTo:"-1",
                // },
                // city_id:{
                //     equalTo:"-1",
                // },
                capAcntNo:{
                    required: true,
                    rangelength:[12,20]
                },
                // lpassword1:{
                //     required: true,
                //     regexnum:/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,15}$/
                // },
                // lpassword2:{
                //     required: true,
                //     equalTo: "#lpassword1"
                // },
                password1:{
                    required: true,
                    minlength: 6,
                    maxlength: 18,
                    regexnum: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                    // regexnum:/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,15}$/
                },
                password2:{
                    required: true,
                    equalTo: "#password1"
                }
            },
            messages: {
                cust_nm:{
                    required: "请输入客户姓名",
                },
                certif_id:{
                    required: "请输入身份证号码",
                },
                email:{
                    email: "请输入正确邮箱",
                },
                // pri_id:{
                //     equalTo:"请选择开户行省市",
                // },
                // city_id:{
                //     equalTo:"请选择开户行区县",
                // },
                capAcntNo:{
                    required: "请输入帐号",
                    rangelength:"银行卡号必须为12-20位数字"
                },
                // lpassword1:{
                //     required: "请输入登录密码",
                //     regexnum:"密码不能小于8位且必须包含数字和字母"
                // },
                // lpassword2:{
                //     required: "请确认登录密码",
                //     equalTo:"两次密码输入不一致"
                // },
                password1:{
                    required: "请输入支付密码",
                    minlength: "请输入最小为6个字符的密码",
                    maxlength: "请输入最大为18个字符的密码",
                    regexnum: "密码为字母和数字组合"
                },
                password2:{
                    required: "请确认支付密码",
                    equalTo:"两次密码输入不一致"
                }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function (form) {
               // form.submit();
                var strHtml = "";
                strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                strHtml += "<div class=\"loading\">";
                strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                strHtml += "    <p>正在开通请稍等...<\/p>";
                strHtml += "<\/div>";
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: "/userapply",
                    data: $('#usrapply').serialize(),// 你的formid
                    async: true,
                    datatype:"Json",
                    beforeSend:function (XHR) {
                         $("body").append(strHtml);
                    },
                    error: function (request) {
                        layer.alert(request);
                    },
                    success: function (data) {
                        if (data.errorCode == "1") {
                            window.location.href=data.message;
                        } else {
                           $(".dialog-bg").remove();
                           $(".loading").remove();
                            layer.alert(data.message);
                        }
                    }
                });

            }
        });
    }

    //企业存管账户开户
    if ($("#enterprisapply").length > 0) {
        $("#enterprisapply").validate({
            rules: {
                cust_nm:{
                    required: true,
                },
                artif_nm:{
                    required: true,
                },
                certif_id:{
                    required: true,
                },
                email:{
                    email: true
                },
                // pri_id:{
                //     equalTo:"-1",
                // },
                // city_id:{
                //     equalTo:"-1",
                // },
                capAcntNo:{
                    required: true,
                },
                lpassword1:{
                    required: true,
                    regexnum:/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                },
                lpassword2:{
                    required: true,
                    equalTo: "#lpassword1"
                },
                password1:{
                    required: true,
                    minlength: 6,
                    maxlength: 18,
                    regexnum:/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                },
                password2:{
                    required: true,
                    equalTo: "#password1"
                }
            },
            messages: {
                cust_nm:{
                    required: "请输入企业名称",
                },
                artif_nm:{
                    required: "请输入法人姓名",
                },
                certif_id:{
                    required: "请输入身份证号码",
                },
                // email:{
                //     email: "请输入正确邮箱"
                // },
                // pri_id:{
                //     equalTo:"请选择开户行省市",
                // },
                city_id:{
                    equalTo:"请选择开户行区县",
                },
                capAcntNo:{
                    required: "请输入帐号",
                },
                lpassword1:{
                    required: "请输入登录密码",
                    regexnum:"密码不能小于8位且必须包含数字和字母"
                },
                lpassword2:{
                    required: "请确认登录密码",
                    equalTo:"两次密码输入不一致"
                },
                password1:{
                    required: "请输入支付密码",
                    minlength: "请输入最小为6个字符的密码",
                    maxlength: "请输入最大为18个字符的密码",
                    regexnum: "密码为字母和数字组合"
                },
                password2:{
                    required: "请确认支付密码",
                    equalTo:"两次密码输入不一致"
                }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function (form) {
                //form.submit();
                var strHtml = "";
                strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                strHtml += "<div class=\"loading\">";
                strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                strHtml += "    <p>正在开通请稍等...<\/p>";
                strHtml += "<\/div>";
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: "/enterprideapply",
                    data: $('#enterprisapply').serialize(),// 你的formid
                    async: true,
                    datatype:"Json",
                    beforeSend:function (XHR) {
                        $("body").append(strHtml);
                    },
                    error: function (request) {
                        layer.alert(request);
                    },
                    success: function (data) {
                        if (data.errorCode == "1") {
                            window.location.href=data.message;
                        } else {
                            $(".dialog-bg").remove();
                            $(".loading").remove();
                            layer.alert(data.message);
                        }
                    }
                });
            }
        });
    }
    //
    if ($("#enterprise").length > 0) {
        $("#enterprise").validate({
            rules: {
                name:{
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                industry:{
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                phone:{
                    required: true,
                    addressmobile: /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/
                },
                companyaddr:{
                    required: true,
                    minlength: 2,
                    maxlength: 40
                },
                provinceid:{
                    required: true
                },
                companyregistecity:{
                    required: true
                },
                businesstime:{
                    required: true,
                    number:true
                },
                pulicrunning:{
                    required: true,
                    number:true
                },
                privaterunning:{
                    required: true,
                    number:true
                },
                liabilities:{
                    required: true,
                    number:true
                },
                legalname:{
                    required: true,
                },
                legalIdCard:{
                    required: true,
                    iscard:true
                },
                legalphone:{
                    required: true,
                    addressmobile: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                },
                businessCode:{
                    required: true,
                    regexnum:/^[0-9A-Za-z]*$/
                },
                businessurl:{
                    required: true,
                },
                revenueCode:{
                    required: true,
                    regexnum:/^[0-9A-Za-z]*$/
                },
                revenueurl:{
                    required: true,
                },
                organizCode:{
                    required: true,
                    regexnum:/^[0-9A-Za-z]*$/
                },
                organizurl:{
                    required: true,
                },
            },
            messages: {
                name:{
                    required: "请输入企业名称",
                    minlength: "企业名称应为2-20个字",
                    maxlength: "企业名称应为2-20个字"
                },
                industry:{
                    required: "请输入所属行业",
                    minlength: "所属行业应为2-20个字",
                    maxlength: "所属行业应为2-20个字"
                },
                phone:{
                    required: "请输入联系电话",
                    addressmobile:"请输入正确的联系电话"
                },
                companyaddr:{
                    required: "请输入办公地址",
                    minlength: "所属行业应为2-40个字",
                    maxlength: "所属行业应为2-40个字"
                },
                provinceid:{
                    required: "请选择企业注册地"
                },
                companyregistecity:{
                    required: "请选择企业注册地"
                },
                businesstime:{
                    required: "请输入营业时间",
                    number:"请输入正确年份"
                },
                pulicrunning:{
                    required: "请输入对公流水",
                    number:"请输入正确的对公流水"
                },
                privaterunning:{
                    required: "请输入对私流水",
                    number:"请输入正确的对私流水"
                },
                liabilities:{
                    required: "请输入企业负债",
                    number:"请输入正确的企业负债"
                },
                legalname:{
                    required: "请输入法人姓名",
                },
                legalIdCard:{
                    required: "请输入法人身份证号",
                    iscard:"请输入正确的身份证号"
                },
                legalphone:{
                    required: "请输入法人手机号",
                    addressmobile: "请输入正确的法人手机号",
                },
                businessCode:{
                    required: "请输入营业执照编号",
                    regexnum:"请输入正确的营业执照编号",
                },
                businessurl:{
                    required: "请上传营业执照图片",
                },
                revenueCode:{
                    required: "请输入税务登记编号",
                    regexnum:"请输入正确的税务登记编号",
                },
                revenueurl:{
                    required: "请上传税务登记图片",
                },
                organizCode:{
                    required: "请输入组织机构代码",
                    regexnum:"请输入正确的组织机构代码",
                },
                organizurl:{
                    required: "请上传组织机构图片",
                },
            }, errorPlacement: function (error, element) {
                if(element.parent().parent().next(".msgnav").length>0){
                    error.appendTo(element.parent().parent().next(".msgnav"));
                }else {
                    error.appendTo(element.parent().parent().parent().next(".msgnav"));
                }
            }, submitHandler: function (form) {
                //form.submit();
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: '/user/enterprise',
                    data: $('#enterprise').serialize(),// 你的formid
                    async: false,
                    error: function (request) {
                        $.ligerDialog.success(request);
                    },
                    success: function (data) {
                        if(data=="1"){
                            layer.alert("保存成功")
                        }else{
                            layer.alert(data);
                        }
                    }
                });
            }
        });
    }
    //实名认证（个人/法人认证）
    if ($("#identity").length > 0) {
        $("#identity").validate({
            rules: {
                idtypeid:{
                    required: true
                },
                idnum:{
                    required: true
                    // /^\d{8}$/  台胞证
                    // /^(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/   身份证
                    // /^(h|H|m|M)\d{10}$/
                },
                realname:{
                    required: true
                },
                email:{
                   required:true,
                    regexnum: /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/
                },
                bankcardnum:{
                    required:true,
                    rangelength:[12,30]
                }
            },
            messages: {
                idtypeid:{
                    required: "请选择"
                },
                idnum:{
                    required: "请输入证件号码"
                },
                realname:{
                    required: "请输入姓名"
                },
                email:{
                    required: "请输入邮箱",
                    regexnum: "请输入正确的邮箱"
                },
                bankcardnum:{
                    required:"请输入银行卡号",
                    rangelength:"请输入正确的银行卡号"
                }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function (form) {
                // var reg="";
                // var idnum=$("#identity_num").val();
                // var error_dom="<span id=\"identity_num-error\" class=\"errormsg\">证件号码格式错误<\/span>";
                // if($("#documentType").val()=="1"){
                //    reg=/^(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
                //    if(!reg.test(idnum)){
                //       $(".idtypeid").html(error_dom);
                //       return;
                //    }
                // }else if($("#documentType").val()=="2"){
                //     reg=/^(h|H|m|M)\d{10}$/;
                //     if(!reg.test(idnum)){
                //         $(".idtypeid").html(error_dom);
                //         return;
                //     }
                // }else if($("#documentType").val()=="3"){
                //     reg=/^\d{8}$/;
                //     if(!reg.test(idnum)){
                //         $(".idtypeid").html(error_dom);
                //         return;
                //     }
                // }
                // form.submit();
                layer.open({
                    title: '提示'
                    ,content: '请确认所填信息无误'
                    ,btn: ['确认', '取消']
                    ,yes: function(index, layero){
                        var strHtml = "";
                        strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                        strHtml += "<div class=\"loading\">";
                        strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                        strHtml += "    <p>正在认证请稍等...<\/p>";
                        strHtml += "<\/div>";
                        $.ajax({
                            cache: true,
                            type: "POST",
                            url: "/identity",
                            data: {idtypeid:$("#documentType").val(),realname:$("#identity_name").val(),idnum:$("#identity_num").val(),email:$("#identity_email").val(),bankcardnum:$("#identity_bankcardnum").val().replace(/\s/g,"")},
                            async: true,
                            datatype:"Json",
                            beforeSend:function (XHR) {
                                $("body").append(strHtml);
                            },
                            error: function (request) {
                                $(".dialog-bg").remove();
                                $(".loading").remove();
                                layer.alert("服务器返回了一个错误");
                            },
                            success: function (data) {
                                if (data.errorCode == "1") {
                                    window.location.href=data.message;
                                } else {
                                    $(".dialog-bg").remove();
                                    $(".loading").remove();
                                    layer.alert(data.message);
                                }
                            }
                        });
                    }
                });
            }
        });
    }

    //实名认证（个人大陆）new(2017-8-28)
    if ($("#mainland").length > 0) {
        $("#mainland").validate({
            rules: {
                realName: {
                  required: true
                },
                idCard: {
                  required: true,
                  // regexnum:/^(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/
                },
                bankCard: {
                  required: true,
                  rangelength: [12, 30]
                },
                payPassword:{
                  required: true,
                  minlength: 6,
                  maxlength: 18,
                  regexnum: /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/
                },
            },
            messages: {
                realName: {
                  required: "请输入真实姓名"
                },
                idCard: {
                  required: "请输入证件号码",
                  // regexnum: "请输入正确格式的证件号码"
                },
                bankCard: {
                  required: "请输入银行卡号",
                  rangelength: "请输入正确的银行卡号"
                },
                payPassword:{
                  required: "请输入支付密码",
                  minlength: "请输入最小为6个字符的密码",
                  maxlength: "请输入最大为18个字符的密码",
                  regexnum: "密码为字母和数字组合"
                },
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().find(".er-msg"));
            }, submitHandler: function (form) {
                layer.open({
                    title: '提示'
                        , content: '请确认所填信息无误'
                        , btn: ['确认', '取消']
                        , yes: function (index, layero) {
                            layer.close(index);
                            var strHtml = "";
                            strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                            strHtml += "<div class=\"loading\">";
                            strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                            strHtml += "    <p>正在认证请稍等...<\/p>";
                            strHtml += "<\/div>";
                            var postdata={
                              idName:$("#mainland #name").val(),
                              bankNo:$("#mainland #bankcard").val().replace(/\s/g,""),
                              payPassWord:$("#mainland #pay_password").val(),
                              identType:0,
                              idNumber:$("#mainland #idcard").val().replace(/\s/g,"")
                            };
                            $.ajax({
                                type: "POST",
                                url: "/openPRC",
                                data: postdata,
                                beforeSend: function (XHR) {
                                    $("body").append(strHtml);
                                },
                                success: function (data) {
                                  $(".dialog-bg").remove();
                                  $(".loading").remove();
                                  console.log(data);
                                  if(data.code=="200"){
                                    $(".realname-form").hide();
                                    $("#status").show();
                                  }else{
                                    layer.alert(data.message);
                                  }
                                  // if (data.errorCode == "1") {
                                  //   window.location.href = data.message;
                                  // } else {
                                  //   $(".dialog-bg").remove();
                                  //   $(".loading").remove();
                                  //   layer.alert(data.message);
                                  // }
                                },
                                error: function (request) {
                                    $(".dialog-bg").remove();
                                    $(".loading").remove();
                                    layer.alert("服务器返回了一个错误");
                                }
                        });
                    }
                });
            }
        });
    }
    // 境外 设置支付密码
    if ($("#setpaypw").length > 0) {
      $("#setpaypw").validate({
        rules: {
          payPassword:{
            required: true
          }
        },
        messages: {
          payPassword:{
            required: "请输入第三方托管平台支付密码"
          }
        }, errorPlacement: function (error, element) {
          error.appendTo(element.parent().find(".er-msg"));
        }, submitHandler: function (form) {
          var strHtml = ajaxLoadHtml("正在设置。。。");
          var postdata={
            payPassWord:$("#pay_password").val(),
            bankId:$("#bankId").val(),
            bankNo:$("#bankNo").val(),
            provinceId:$("#provinceId").val(),
            cityId:$("#cityId").val()
          };
          $.ajax({
            type: "POST",
            url: "/openNonPRC",
            data: postdata,
            beforeSend: function (XHR) {
              $("body").append(strHtml);
            },
            success: function (data) {
              $(".dialog-bg,.loading").remove();
              if(data.code=="200"){
                $("#setppw").hide();
                $("#status").show();
              }else{
                layer.alert(data.message);
              }
            },
            error: function (request) {
              $(".dialog-bg").remove();
              $(".loading").remove();
              layer.alert("请求失败，请刷新一次再试试");
            }
          });
        }
      });
    }

  //实名认证（个人境外）new(2017-8-28)
  if ($("#unmainland").length > 0) {
    $("#unmainland").validate({
      rules: {
        Area:{
          required: true
        },
        realName: {
          required: true
        },
        idCard: {
          required: true
          // /^\d{8}$/  台胞证
          // /^(h|H|m|M)\d{10}$/  港澳通行证
        },
        idCardate:{
          required: true
        },
        bankCard: {
          required: true,
          rangelength: [12, 30]
        },
      },
      messages: {
        Area:{
          required: "请选择国家/地区"
        },
        realName: {
          required: "请输入真实姓名"
        },
        idCard: {
          required: "请输入证件号码"
        },
        idCardate:{
          required: "请选择证件有效期"
        },
        bankCard: {
          required: "请输入银行卡号",
          rangelength: "请输入正确的银行卡号"
        },
      }, errorPlacement: function (error, element) {
        error.appendTo(element.parent().find(".er-msg"));
      }, submitHandler: function (form) {
        layer.open({
          title: '提示'
          , content: '请确认所填信息无误'
          , btn: ['确认', '取消']
          , yes: function (index, layero) {
            layer.close(index);
            var strHtml = "";
            strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
            strHtml += "<div class=\"loading\">";
            strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
            strHtml += "    <p>正在认证请稍等...<\/p>";
            strHtml += "<\/div>";
            var idType=3; //海外  护照
            var idCardNo=$("#unmainland #idcard").val().replace(/\s/g,"");
            if($("#unmainland #area").val()=="港澳台"){
              if(idCardNo.indexOf("h")>-1||idCardNo.indexOf("m")>-1||idCardNo.indexOf("H")>-1||idCardNo.indexOf("M")>-1){
                idType=1; //港澳通行证
              }else {
                idType=2; //台胞证
              }
            }
            var postdata={
              idName:$("#unmainland #name").val(),
              cardNo:$("#unmainland #bankcard").val().replace(/\s/g,""),
              identType:idType,
              idNumber:idCardNo,
              idExpDate:$("#unmainland #idcardate").val(),
              nationality:$("#unmainland #area").val()
            };
            $.ajax({
              type: "POST",
              url: "/nonRPCValid",
              data: postdata,
              beforeSend: function (XHR) {
                $("body").append(strHtml);
              },
              success: function (data) {
                $(".dialog-bg,.loading").remove();
                if(data.code=="200"){
                  window.location.href="/personalupload";
                }else{
                  if(data.message.indexOf("格式不正确")>-1){
                    layer.alert("请输入正确的证件号");
                  }else {
                    layer.alert(data.message);
                  }
                }
              },
              error: function (request) {
                $(".dialog-bg").remove();
                $(".loading").remove();
                layer.alert("请求失败，请刷新一次再试试");
              }
            });
          }
        });
      }
    });
  }

    //企业审核资料上传
    if ($("#companyinfo").length > 0) {
        $("#companyinfo").validate({
            rules: {
                name:{
                    required: true,
                },
                documenttypeid:{
                    required: true,
                },
                businesscode:{
                    required: true,
                },
                organizcode:{
                    required: true,
                },
                revenuecode:{
                    required: true,
                },
                creditcode:{
                    required: true,
                },
                fyProvinceid:{
                    required: true,
                },
                fyCityid:{
                    required: true,
                },
                fyCapacntno:{
                    required: true,
                }
            },
            messages: {
                name:{
                    required: "请填写企业名称",
                },
                documenttypeid:{
                    required: "请选择证件类型",
                },
                businesscode:{
                    required: "请填写营业执照注册号",
                },
                organizcode:{
                    required: "请填写组织机构代码证号",
                },
                revenuecode:{
                    required: "请填写税务登记证号",
                },
                creditcode:{
                    required: "请填写社会统一信用代码",
                },
                fyProvinceid:{
                    required: "请选择开户行省市",
                },
                fyCityid:{
                    required: "请选择开户行区县",
                },
                fyCapacntno:{
                    required: "请填写基本户账号",
                }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function (form) {
                // form.submit();
                var strHtml = "";
                strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                strHtml += "<div class=\"loading\">";
                strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                strHtml += "    <p>正在提交请稍等...<\/p>";
                strHtml += "<\/div>";
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: "/companyinfo/upload",
                    data: $('#companyinfo').serialize(),// 你的formid
                    async: true,
                    datatype:"Json",
                    beforeSend:function (XHR) {
                        $("body").append(strHtml);
                    },
                    error: function (request) {
                        layer.alert(request);
                    },
                    success: function (data) {
                        if (data.errorCode == "1") {
                            layer.open({
                                content: '信息已提交'
                                ,btn: ['确定']
                                ,yes: function(index, layero){
                                    layer.close(index);
                                    window.location.href=data.message;
                                }
                                ,cancel: function(){
                                    window.location.href=data.message;
                                }
                            });
                        } else {
                            $(".dialog-bg").remove();
                            $(".loading").remove();
                            layer.alert(data.message);
                        }
                    }
                });
            }
        });
    }

    //个体工商户基础信息
    if ($("#customperinfo").length > 0) {
        $("#customperinfo").validate({
            rules: {
                idValidDate:{
                    required: true,
                },
                customerName:{
                    required: true,
                },
                nationality:{
                    required: true,
                },
                gender:{
                    required: true,
                },
                email:{
                    required: true,
                    regexnum:/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
                },
                birthday:{
                    required: true,
                },
                education:{
                    required: true,
                },
                Pro_id:{
                    required: true,
                },
                City_id:{
                    required: true,
                },
                Dist_id:{
                    required: true,
                },
                Pro_id1:{
                    required: true,
                },
                City_id1:{
                    required: true,
                },
                Dist_id1:{
                    required: true,
                },
                Pro_id2:{
                    required: true,
                },
                City_id2:{
                    required: true,
                },
                Dist_id2:{
                    required: true,
                },
                businessAddress:{
                    required: true,
                },
                marriageTypeId:{
                    required: true,
                },
                houseTypeId:{
                    required: true,
                },
                HU_pro_id:{
                    required: true,
                },
                HU_city_id:{
                    required: true,
                },
                HU_dist_id:{
                    required: true,
                },
                registryAddress:{
                    required: true,
                },
                // JU_pro_id:{
                //     required: true,
                // },
                // JU_city_id:{
                //     required: true,
                // },
                // JU_dist_id:{
                //     required: true,
                // },
                // liveAddress:{
                //     required: true,
                // },
                liveYear:{
                    required: true,
                },
                businesslicenseno:{
                    required: true,
                },
                livemobile:{
                    // regexnum:/(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[3-9]\d{9})$)/
                }
            },
            messages: {
                idValidDate:{
                    required: "请选择证件有效期",
                },
                customerName:{
                    required:"请填写个体工商户名称"
                },
                nationality:{
                    required: "请选择地区",
                },
                gender:{
                    required: "请选择性别",
                },
                email:{
                    required: "请填写邮箱",
                    regexnum:"请填写正确的邮箱"
                },
                birthday:{
                    required: "请选择日期",
                },
                education:{
                    required: "请选择教育程度",
                },
                Pro_id:{
                    required: "请选择省份",
                },
                City_id:{
                    required: "请选择城市",
                },
                Dist_id:{
                    required: "请选择区县",
                },
                Pro_id1:{
                    required: "请选择省份",
                },
                City_id1:{
                    required: "请选择城市",
                },
                Dist_id1:{
                    required: "请选择区县",
                },
                Pro_id2:{
                    required: "请选择省份",
                },
                City_id2:{
                    required: "请选择城市",
                },
                Dist_id2:{
                    required: "请选择区县",
                },
                businessAddress:{
                    required: "请填写经营地址",
                },
                marriageTypeId:{
                    required: "请选择婚姻状况",
                },
                houseTypeId:{
                    required: "请选择住房条件",
                },
                HU_pro_id:{
                    required: "请选择省份",
                },
                HU_city_id:{
                    required: "请选择城市",
                },
                HU_dist_id:{
                    required: "请选择区县",
                },
                registryAddress:{
                    required: "请填写详细地址",
                },
                // JU_pro_id:{
                //     required: "请选择省份",
                // },
                // JU_city_id:{
                //     required: "请选择城市",
                // },
                // JU_dist_id:{
                //     required: "请选择区县",
                // },
                // liveAddress:{
                //     required: "请填写详细地址",
                // },
                liveYear:{
                    required: "请填写入住年数",
                },
                businesslicenseno:{
                    required: "营业执照注册号",
                },
                livemobile:{
                    // regexnum:"请填写正确的居住电话"
                }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function (form) {
                // form.submit();
                var strHtml = "";
                strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                strHtml += "<div class=\"loading\">";
                strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                strHtml += "    <p>正在提交请稍等...<\/p>";
                strHtml += "<\/div>";
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: "/customperinfo",
                    data: $('#customperinfo').serialize(),// 你的formid
                    async: true,
                    datatype:"Json",
                    beforeSend:function (XHR) {
                        $("body").append(strHtml);
                    },
                    error: function (request) {
                        layer.alert(request);
                    },
                    success: function (data) {
                        if (data.errorCode == "1") {
                            window.location.href=data.message;
                        } else {
                            $(".dialog-bg").remove();
                            $(".loading").remove();
                            layer.alert(data.message);
                        }
                    }
                });
            }
        });
    }

    //企业审核资料上传
    if ($("#custominfo").length > 0) {
        $("#custominfo").validate({
            rules: {

            },
            messages: {

            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function (form) {
                var strHtml = "";
                strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                strHtml += "<div class=\"loading\">";
                strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                strHtml += "    <p>正在提交请稍等...<\/p>";
                strHtml += "<\/div>";
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: "/custominfo/upload",
                    data: $('#custominfo').serialize(),
                    async: true,
                    datatype:"Json",
                    beforeSend:function (XHR) {
                        $("body").append(strHtml);
                    },
                    error: function (request) {
                        layer.alert(request);
                    },
                    success: function (data) {
                        if (data.errorCode == "1") {
                            layer.open({
                                content: '信息已提交'
                                ,btn: ['确定']
                                ,yes: function(index, layero){
                                    layer.close(index);
                                    window.location.href=data.message;
                                }
                                ,cancel: function(){
                                    window.location.href=data.message;
                                }
                            });
                        } else {
                            $(".dialog-bg").remove();
                            $(".loading").remove();
                            layer.alert(data.message);
                        }
                    }
                });
            }
        });
    }

    //企业基础信息
    if ($("#enterpriseperinfo").length > 0) {
        $("#enterpriseperinfo").validate({
            rules: {
                StartDate:{
                    required: true,
                },
                EmployeeNum:{
                    required: true,
                },
                Pro_id:{
                    required: true,
                },
                City_id:{
                    required: true,
                },
                Dist_id:{
                    required: true,
                },
                Pro_id1:{
                    required: true,
                },
                City_id1:{
                    required: true,
                },
                Dist_id1:{
                    required: true,
                },
                Pro_id2:{
                    required: true,
                },
                City_id2:{
                    required: true,
                },
                Dist_id2:{
                    required: true,
                },
                businessAddress:{
                    required: true,
                },
                LegalerName:{
                    required: true,
                },
                LegalerMobile:{
                    required: true,
                    // regexphone: /^(13[0-9]|14[57]|15[0-35-9]|18[0-9]|17[0-9])[0-9]{8}$/
                    regexphone: /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[3-9]\d{9})$)/
                },
                HU_pro_id:{
                    required: true,
                },
                HU_city_id:{
                    required: true,
                },
                HU_dist_id:{
                    required: true,
                },
                Contactaddress:{
                    required: true,
                },
            },
            messages: {
                StartDate:{
                    required: "请选择开始经营日期",
                },
                EmployeeNum:{
                    required: "雇员人数",
                },
                Pro_id:{
                    required: "请选择省份",
                },
                City_id:{
                    required: "请选择城市",
                },
                Dist_id:{
                    required: "请选择区县",
                },
                Pro_id1:{
                    required: "请选择省份",
                },
                City_id1:{
                    required: "请选择城市",
                },
                Dist_id1:{
                    required: "请选择区县",
                },
                Pro_id2:{
                    required: "请选择省份",
                },
                City_id2:{
                    required: "请选择城市",
                },
                Dist_id2:{
                    required: "请选择区县",
                },
                businessAddress:{
                    required: "请填写详细地址",
                },
                LegalerName:{
                    required: "请填写企业联系人姓名",
                },
                LegalerMobile:{
                    required: "请填写企业联系人电话",
                    regexphone: "请输入正确的联系号码"
                },
                HU_pro_id:{
                    required: "请选择省份",
                },
                HU_city_id:{
                    required: "请选择城市",
                },
                HU_dist_id:{
                    required: "请选择区县",
                },
                registryAddress:{
                    required: "请填写详细地址",
                }
            }, errorPlacement: function (error, element) {
                error.appendTo(element.parent().next(".msgnav"));
            }, submitHandler: function (form) {
                // form.submit();
                var strHtml = "";
                strHtml += "<div class=\"dialog-bg\" style=\"display: block\"><\/div>";
                strHtml += "<div class=\"loading\">";
                strHtml += "    <div><img src=\"/resource/static/img/modal/loading.gif\" alt=\"loading\"><\/div>";
                strHtml += "    <p>正在提交请稍等...<\/p>";
                strHtml += "<\/div>";
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: "/enterpriseperinfo",
                    data: $('#enterpriseperinfo').serialize(),// 你的formid
                    async: true,
                    datatype:"Json",
                    beforeSend:function (XHR) {
                        $("body").append(strHtml);
                    },
                    error: function (request) {
                        layer.alert(request);
                    },
                    success: function (data) {
                        if (data.errorCode == "1") {
                            window.location.href=data.message;
                        } else {
                            $(".dialog-bg").remove();
                            $(".loading").remove();
                            layer.alert(data.message);
                        }
                    }
                });
            }
        });
    }

});

function isIdCardNo(num) {
    num = num.toUpperCase();
    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {

        return false;
    }
    var len, re;
    len = num.length;
    if (len == 15) {
        re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
        var arrSplit = num.match(re);
        var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay) {

            return false;
        } else {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var nTemp = 0,
            i;
            num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
            for (i = 0; i < 17; i++) {
                nTemp += num.substr(i, 1) * arrInt[i];
            }
            num += arrCh[nTemp % 11];
            return true;
        }
    }
    if (len == 18) {
        re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
        var arrSplit = num.match(re);
        var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay) {
            return false;
        }
        else {
            var valnum;
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var nTemp = 0,
            i;
            for (i = 0; i < 17; i++) {
                nTemp += num.substr(i, 1) * arrInt[i];
            }
            valnum = arrCh[nTemp % 11];
            if (valnum != num.substr(17, 1)) {

                return false;
            }
            return true;
        }
    }
    return false;
}

/**
 * Business logic
 */
function publishApply() {
  $.ajax({
    cache: true,
    type: "POST",
    url: "/loan/publish",
    data: $('#publishform').serialize(),// 你的formid
    async: false,
    error: function (request) {
      layer.alert(request.responseText);
      //alert(request);
      $("#btnOk").removeAttr("disabled");
    },
    success: function (data) {
      if (data.errorCode > 1) {
        layer.open({
          content: '提交申请成功！'
          ,closeBtn: 0
          ,btn: ['确定']
          ,yes: function(index, layero){
            layer.close(index);
            window.location.href = data.message;
          }
          ,cancel: function(){
            window.location.href = data.message;
          }
        });
      } else {
        layer.alert(data.message);
      }
    }
  });
}
function publishVerify() {
  $.ajax({
    cache: true,
    type: "POST",
    url: "/loan/checkUserBorrowing",
    data: {id:$("#Id").val(),amount:$("#Amount").val()},
    async: false,
    error: function (request) {
      layer.alert(request.responseText);
    },
    success: function (data) {
      if (data.errorCode == 0) {
        layer.open({
          content: data.message
          ,btn: ['继续申请','返回修改']
          ,yes: function(index, layero){
            publishApply();
            layer.close(index);
          }
          ,btn2: function(index, layero){
            //返回修改
            $("#btnOk").removeAttr("disabled");
          }
        });
      }else{
        publishApply();
      }
    }
  });

}

jQuery.extend(jQuery.validator.messages, {
    required: "必选字段",
    remote: "请修正该字段",
    email: "请输入正确格式的电子邮件",
    url: "请输入合法的网址",
    date: "请输入合法的日期",
    dateISO: "请输入合法的日期 (ISO).",
    number: "请输入合法的数字",
    digits: "只能输入整数",
    creditcard: "请输入合法的信用卡号",
    equalTo: "请再次输入相同的值",
    accept: "请输入拥有合法后缀名的字符串",
    maxlength: jQuery.validator.format("请输入一个 长度最多是 {0} 的字符串"),
    minlength: jQuery.validator.format("请输入一个 长度最少是 {0} 的字符串"),
    rangelength: jQuery.validator.format("请输入 一个长度介于 {0} 和 {1} 之间的字符串"),
    range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
    max: jQuery.validator.format("请输入一个最大为{0} 的值"),
    min: jQuery.validator.format("请输入一个最小为{0} 的值")
});
