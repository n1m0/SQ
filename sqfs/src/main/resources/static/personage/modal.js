$(window).resize(function () {
    userStaic($("#usernav"));
    userStaic($("#lang"));
});

function userStaic(usernavDom) {
    if (usernavDom.find(".users").length > 0) {
        usernavDom.find(".users").css('left', usernavDom.offset().left - 1);
    }
}
$(function ($) {
    //通顶栏
    var usernavDom = $("#usernav");
    if (usernavDom.length > 0) {
        userStaic(usernavDom);
        usernavDom.on('mouseover', function () {
            $(this).addClass('active').find('i').removeClass('upward-icon').addClass('downward-icon');
        }).on('mouseleave', function () {
            $(this).removeClass('active').find('i').removeClass('downward-icon').addClass('upward-icon');
        });
    }
    var langnavDom = $("#lang");
    if (langnavDom.length > 0) {
        userStaic(langnavDom);
        langnavDom.on('mouseover', function () {
            $(this).addClass('active').find('i').removeClass('upward-icon').addClass('downward-icon');
        }).on('mouseleave', function () {
            $(this).removeClass('active').find('i').removeClass('downward-icon').addClass('upward-icon');
        });
    }
    //导航
    var tabmenu = $(".tab-bar");
    if (tabmenu.length > 0) {
        tabmenu.find('li').each(function () {
            $(this).on('mouseover', function () {
                $('.tablist').hide();
                if ($(this).find('.tablist').find("a").length > 0) {
                    $(this).addClass("hover");
                    $(this).find('.tablist').css('left', $(this).offset().left).show();
                }
            });
            $(this).on('mouseleave', function () {
                $(this).removeClass("hover");
                $('.tablist').hide();
            });
        });
    }
    //列表item链接
    if ($(".list-table").length > 0) {
        $(".list-table").find("tbody").find("tr").each(function () {
            $(this).on("click", function () {
                window.location.href = $(this).find("td[class='btnnav']").find("a").attr("href");
            });

        });
    }

    if ($(".project-table").length > 0) {
        $(".project-table").find("tbody").find("tr").each(function () {
            $(this).on("click", function () {
                window.location.href = $(this).find("td[class='btnnav']").find("a").attr("href");
            });

        });
    }
    //弹出窗口
    $.fn.fbmodal = function (opt, callback) {

        //Default values
        var defaults = {
            title: "FB Modal",
            cancel: "Cancel",
            okay: "Okay",
            okaybutton: true,
            cancelbutton: true,
            buttons: true,
            opacity: 0.0,
            fadeout: true,
            overlayclose: true,
            modaltop: "30%",
            modalwidth: "",
            source: null,
            iframeid: "",
            content: null,
            modalheight: "",
            okhide: true,
            isborder: false
        };
        var options = $.extend(defaults, opt);
        if (options.close == true) {
            if (options.fadeout == true) {
                $("#fbmodal").remove();
                $("#fbmodal_overlay").removeClass("fbmodal_overlay");
            } else {
                $("#fbmodal").remove();
                $("#fbmodal_overlay").removeClass("fbmodal_overlay");

            }
        } else {
            var fbmodalHtmls = null;
            if (options.isborder) {
                fbmodalHtmls = ' \
<div id="fbmodal"> \
<div class="popup"> \
<table> \
<tbody> \
<tr> \
<td class="tl"/><td class="b"/><td class="tr"/> \
</tr> \
<tr> \
<td class="b"/> \
<td class="body"> \
<div class="title">\
</div> \
<div class="container">\
<div class="dailogcontent">\
</div> \
<div class="footer"> \
<div class="right">\
<div class="button_outside_border_blue" id="ok">\
<div class="button_inside_border_blue" id="okay">\
</div>\
</div>\
<div class="button_outside_border_grey" id="close">\
<div class="button_inside_border_grey" id="cancel">\
</div>\
</div>\
</div>\
<div class="clear">\
</div>\
</div> \
</div>\
</td> \
<td class="b"/> \
</tr> \
<tr> \
<td class="bl"/><td class="b"/><td class="br"/> \
</tr> \
</tbody> \
</table> \
</div> \
</div>';
            } else {
                fbmodalHtmls = ' \
<div id="fbmodal"> \
<div class="popup"> \
<table> \
<tbody> \
<tr> \
<td class="body"> \
<div class="title">\
<span class="f-fl" id="modaltitle"></span>\
<i class="icon fbmodalicon f-fr"></i>\
</div> \
<div class="container">\
<div class="dailogcontent">\
</div> \
<div class="footer"> \
<div class="right">\
<div class="button_outside_border_blue" id="ok">\
<div class="button_inside_border_blue" id="okay">\
</div>\
</div>\
<div class="button_outside_border_grey" id="close">\
<div class="button_inside_border_grey" id="cancel">\
</div>\
</div>\
</div>\
<div class="clear">\
</div>\
</div> \
</div>\
</td> \
</tr> \
<tr> \
</tbody> \
</table> \
</div> \
</div>';
            }
            var preload = [new Image(), new Image()];
            $("#fbmodal").find('.b:first, .bl, .br, .tl, .tr').each(function () {
                preload.push(new Image());
                preload.slice(-1).src = $(this).css('background-image').replace(/url\((.+)\)/, '$1');
            });
            var dat = "";
            if (options.source != null && options.source != "") {
                dat = "<iframe frameborder='0' width='100%' height='100%' id=" + options.iframeid + " src=" + options.source + "></iframe>";
            } else if (options.content != null && options.content != "") {
                dat = options.content;
            }
            $("body").append(fbmodalHtmls);
            $("#fbmodal .dailogcontent").append('<div class="loading"><img src="/resource/static/img/modal/loading.gif"/></div>');
            $("#fbmodal").css("top", options.modaltop);
            if(options.buttons != false){
                if (options.okaybutton == false ) {
                    $("#fbmodal #ok").hide();
                }
                if (options.cancelbutton == false) {
                    $("#fbmodal #close").hide();
                }
            }
            else {
                $("#fbmodal .footer").hide();
            }

            $("#fbmodal #modaltitle").append(options.title);
            $("#fbmodal #okay").append(options.okay);
            $("#fbmodal #cancel").append(options.cancel);
            $("#fbmodal .dailogcontent").append(dat).css("width", options.modalwidth).css('height', options.modalheight);
            $("#fbmodal .loading").remove();
            $("body").append('<div id="fbmodal_overlay" class="fbmodal_hide"></div>');
            $("#fbmodal_overlay").addClass("fbmodal_overlay").fadeTo(0, options.opacity);
            fbWidth();
            $(window).bind("resize", function () {
                fbWidth();
            });

            var overlays;
            if (options.overlayclose == true) {

                if (options.okhide == false) {
                    overlays = "close, .fbmodal_hide,.fbmodalicon";
                } else {
                    overlays = "ok, #close, .fbmodal_hide,.fbmodalicon";
                }
            } else {
                if (options.okhide == false) {
                    overlays = "close,.fbmodalicon";
                } else {
                    overlays = "ok, #close,.fbmodalicon";
                }
            }
            $("#" + overlays).click(function () {
                if (options.fadeout == true) {
                    $("#fbmodal").remove();
                    $("#fbmodal_overlay").removeClass("fbmodal_overlay");
                    callback(3);

                } else {
                    $("#fbmodal").remove();
                    $("#fbmodal_overlay").removeClass("fbmodal_overlay");
                    callback(3);
                }

            });
            $("#fbmodal #okay").click(function () {
                var okay = 1;
                callback(okay);
            });
            $("#fbmodal #cancel").click(function () {
                var cancel = 2;
                callback(cancel);
            });
        }
    };
});
//关闭窗口
function closedailog() {
    $('body').fbmodal({ close: true });
}
function fbWidth() {
    var windowWidth = $(window).width();
    var fbmodalWidth = $("#fbmodal").width();
    var fbWidth = windowWidth / 2 - fbmodalWidth / 2;
    $("#fbmodal").css("left", fbWidth);
}

function getCheckval(str) {
    var options;
    if (str == null) {
        options = { dom: "", validx: "all" };
    } else {
        options = str;
    }
    var fdom = $(options.dom).parent().parent();
    var cdom = fdom.find('td');
    var checkval;
    if (options.validx == "all") {
        checkval = [];
        for (var i = 1; i < cdom.length; i++) {
            checkval.push(cdom.eq(i).text());
        }
    } else {
        checkval = cdom.eq(options.validx).text();
    }
    return checkval;
}


/**检查图片上传类型*/
function checkImgType(obj) {


    //获取图片的全路径
    var imgFilePath = getImgFullPath(obj);
    var endIndex = imgFilePath.lastIndexOf('"\"');
    var lastIndex = imgFilePath.length - endIndex - 1;
    /*var imgFile;
     if (endIndex != -1) {
     imgFile = imgFilePath.substr(endIndex + 1, lastIndex);
     }
     else {
     imgFile = imgFilePath;
     }
     */
    var tag = true;
    endIndex = imgFilePath.lastIndexOf('.');
    if (endIndex == -1)
        tag = false;

    var imgName = imgFilePath.substr(endIndex + 1, lastIndex);
    imgName = imgName.toUpperCase();

    if (imgName != 'GIF' && imgName != 'JPG' && imgName != 'PNG' && imgName != 'BMP') {
        tag = false;
    }
    if (!tag) {
        layer.alert('上传图片的文件类型必须为: *.gif,*.jpg,*.png,*.bmp,请重新选择!');
        layer.alert('你逗我么');
        //      Upload.clear(obj);
        return false;
    }
    return true;
}

function getImgFullPath(obj) {
    if (obj) {
        //ie
        if (window.navigator.userAgent.indexOf('MSIE') >= 1) {
            obj.select();
            return document.selection.createRange().text;
        }
        //firefox
        else if (window.navigator.userAgent.indexOf('Firefox') >= 1) {
            if (obj.files) {
                return obj.files.item(0).getAsDataURL();
            }
            return obj.value;
        }
        return obj.value;
    }
    return null;
}

(function ($) {
    $.fn.ndautoheight = function (optss) {
        var defaults = {
            view: "default"
        };
        var options = $.extend(defaults, optss);
        var wh = $(window).height();
        var th = $(".t-bar").height();
        var tabh = $(".tab-bar").height();
        var fh = $(".footer").height();
        var loginviews = null;
        if (options.view == "login") {
            loginviews = $("#loginview");
            if (wh - th - tabh - fh - loginviews.height() > 50) {
                loginviews.css("margin-bottom", wh - th - tabh - fh - loginviews.height() - 2 + "px");
            } else {
                loginviews.css("margin-bottom", "100px");
            }
        }
        if (options.view == "register") {
            loginviews = $("#registerview");
            if (wh - th - tabh - fh - loginviews.height() > 50) {
                loginviews.css("margin-bottom", wh - th - tabh - fh - loginviews.height() - 2 + "px");
            } else {
                loginviews.css("margin-bottom", "100px");
            }
        }
        if (options.view == "account") {
            if ($(".ac-default").height() < $(".ac-leftbar").height()) {
                $(".ac-default").height($(".ac-leftbar").height() - 45);
                $(".ac-leftbar").css("margin-bottom", "100px");
            } else {
                $(".ac-default").css("margin-bottom", "100px");
            }
        }
        if (options.view == "accountview") {
            if ($(".ac-content").height() < $(".ac-leftbar").height()) {
                $(".ac-content").height($(".ac-leftbar").height());
                $(".ac-leftbar").css("margin-bottom", "100px");
            }
            if (wh - th - tabh - fh - $(".ac-content").height() < 0) {
                $(".ac-content").css("margin-bottom", "100px");
            } else {
                $(".ac-content").css("margin-bottom", "100px");
            }
        }
    };
})(jQuery);
var p = 5
function fiveMlater(url) {
    var urls = url;
    setTimeout(function () {
        window.location.href = urls;
    }, 5000);
    setInterval(function () {
        if (p > 0) {
            p--;
        }
        if ($("#fiveMlater").length > 0) {
            $("#fiveMlater").text(p);
        }
    }, 1000);
}

var countdown = 60;
var authtime;
var Timecount = 0;
function settime(val) {
    if (countdown == 0) {
        val.removeAttr("disabled");
        val.val("获取验证码");
        countdown = 60;
        Timecount = 1;
        window.clearTimeout(authtime);
    } else {
        Timecount = 0;
        val.attr("disabled", true);
        val.val("已发送(" + countdown + ")");
        countdown--;
    }
    if (Timecount == 0) {
        authtime = setTimeout(function () {
            settime(val);
        }, 1000);
    }
}

//银行卡号输入
$.fn.bankInput = function (options) {
    var defaults = {
        min: 10,
        max: 23,
        deimiter: '-',
        onlyNumber: true,
        copy: true
    };
    var opts = $.extend({}, defaults, options);
    var obj = $(this);
    obj.css({ imeMode: 'Disabled', borderWidth: '1px', color: '#000', fontFamly: 'Times New Roman' }).attr('maxlength', opts.max);
    if (obj.val() != '') obj.val(obj.val().replace(/\s/g, '').replace(/(\d{4})(?=\d)/g, "$1" + opts.deimiter));
    obj.bind('keyup', function (event) {
        if (opts.onlyNumber) {
            if (!(event.keyCode >= 48 && event.keyCode <= 57)) {
                this.value = this.value.replace(/\D/g, '');
            }
        }
        this.value = this.value.replace(/\s/g, '').replace(/(\d{4})(?=\d)/g, "$1" + opts.deimiter);
    }).bind('dragenter', function () {
        return false;
    }).bind('onpaste', function () {
        return !clipboardData.getData('text').match(/\D/);
    }).bind('blur', function () {
        this.value = this.value.replace(/\s/g, '').replace(/(\d{4})(?=\d)/g, "$1" + opts.deimiter);
    });
};
//提示框
(function ($) {
    $.fn.ndalt = function (opts) {
        var defaults = {
            floats: "down",
            html: "",
            hover: true,
            width: 200
        };
        var options = $.extend(defaults, opts);
        var thisleft = this.offset().left - options.width / 2 + this.width() / 2;
        var althtml = "<div class=\"main_alt\" style='left:" + thisleft + "px; width:" + options.width + "px;'>";
        if (options.floats == "down") {
            althtml += "<div class=\"head\" style='width:" + (options.width) + "px;'></div>";
            althtml += "<div class=\"body down\" style='width:" + (options.width - 8) + "px;'>";
            althtml += options.html;
            althtml += "</div>";
        }
        if (options.floats == "up") {
            althtml += "<div class=\"body up\" style='width:" + (options.width - 8) + "px;'>";
            althtml += options.html;
            althtml += "</div>";
            althtml += "<div class=\"foot\" style='width:" + (options.width) + "px;'></div>";
        }
        althtml += "</div>";
        var domtop = "";
        if (options.hover) {
            this.hover(function () {
                $(this).append(althtml);
                if (options.floats == "up") {
                    domtop = $(this).offset().top - $(".main_alt").height();
                } else if (options.floats == "down") {
                    domtop = $(this).offset().top + $(this).height();
                }
                $(".main_alt").css("top", domtop);
                $(".main_alt").show();
            }, function () {
                $(".main_alt").remove();
            });
        }
    };
})(jQuery);
//产品切换
(function (a) {
    a.fn.DB_tabMotionBanner = function (b) {
        var c = {
            key: "",
            autoRollingTime: 3000,
            bgSpeed: 2000,
            motion: ""
        };
        a.extend(c, b);
        return this.each(function () {
            var h = a(this);
            var m = h.find(".bn_menuSet li");
            var e = h.find(".bn_bgSet li");
            var q = h.find(".bn_next");
            var g = h.find(".bn_prev");
            var f = h.find(".bn_bgSet li").length;
            var p = 0;
            var j = 0;
            s();
            function s() {
                d();
                t();
                o();
            }
            function d() {
                h.bind("mouseenter",
                    function () {
                        clearInterval(j);
                        q.show();
                        g.show();
                    });
                h.bind("mouseleave",
                    function () {
                        t();
                        q.hide();
                        g.hide();
                    });
                m.bind("click",
                    function () {
                        if (a(this).index() != p) {
                            p = a(this).index();
                            o();
                        }
                    });
                m.bind("mouseenter",
                    function () {
                        n(a(this).find("img"), "src", "_off", "_on");
                    });
                m.bind("mouseleave",
                    function () {
                        if (p != a(this).index()) {
                            n(a(this).find("img"), "src", "_on", "_off");
                        }
                    });
                q.bind("click",
                    function () {
                        u();
                    });
                g.bind("click",
                    function () {
                        p--;
                        if (p == -1) {
                            p = f - 1;
                        }
                        o();
                    });
            }

            function u() {
                p = ++p % f;
                o();
            }

            function t() {
                j = setInterval(u, c.autoRollingTime);
            }

            function o() {
                for (var z = 0; z < f; z++) {

                    var y = e.eq(z);
                    if (p == z) {


                        n(m.eq(z).find("img"), "src", "_off", "_on");
                        m.eq(z).addClass("select");
                        y.stop(true, true).fadeIn(c.bgSpeed);
                    } else {

                        n(m.eq(z).find("img"), "src", "_on", "_off");
                        m.eq(z).removeClass("select");
                        y.stop(true, true).fadeOut(c.bgSpeed);
                    }
                }
            }

            function n(w, z, v, x) {
                var y = w.attr(z);
                if (String(y).search(v) != -1) {
                    w.attr(z, y.replace(v, x));
                }
            }
        });
    };
})(jQuery);

/* 自定义 checkbox
 * <label class="checkbox" data-ismall="1" data-status="1" data-role=""></label>
 * data-status  0是未选择，1是选中，2是默认勾选不可编辑
 * data-ismall  1 表示正常大小的控件
 * data-role     该字段表示是否为checkbox组，checkbox组只能勾选一个
 * */
(function($){
    $.fn.zwdCheckBox = function(options) {
        var methods ={
            callback:function(){},
        };
        var newMethods = $.extend(methods, options);
        this.unbind();
        this.on("click",function(){
            var self=$(this);
            var status=self.attr("data-status");
            if(status!="2"){
                if(self.attr("data-role")!=undefined||self.attr("data-role")!=null){
                    var checkboxRole=self.attr("data-role");
                    $(".checkbox[data-role='"+checkboxRole+"']").attr("data-status","0")
                }
                if(status=="1"){
                    self.attr("data-status","0")
                }else {
                    self.attr("data-status","1")
                }
            }
            newMethods.callback(self);
        });
    };
})(jQuery);
//end

(function($){
    $.fn.extend({
        "slideUp":function(value){
            var docthis = this;
            //默认参数
            var defaultValue=$.extend({
                "li_h":"18",
                "time":2000,
                "movetime":1000
            },value)
            //向上滑动动画
            function autoani(){
                $("li:first",docthis).animate({"margin-top":-defaultValue.li_h},defaultValue.movetime,function(){
                    $(this).css("margin-top",0).appendTo(".line");
                })
            }
            //自动间隔时间向上滑动
            var anifun = setInterval(autoani,defaultValue.time);
            //悬停时停止滑动，离开时继续执行
            $(docthis).children("li").hover(function(){
                clearInterval(anifun);			//清除自动滑动动画
            },function(){
                anifun = setInterval(autoani,defaultValue.time);	//继续执行动画
            })
        }
    })
})(jQuery);

function toTxt(str) {
    var RexStr = /\<|\>|\"|\'|\&/g;
    str = str.replace(RexStr, "");
    return str;
}
var ie = !!window.ActiveXObject;
var ie6 = ie && !window.XMLHttpRequest;
var ie8 = ie && !!document.documentMode;
var ie7 = ie && !ie6 && !ie8;


//计算收益利息
function getNowPoundage(Principal, TimeType, TimeLimit, RepaymentType, Rate) {
    //console.log("本金" + Principal + "借款期限的类型" + TimeType + "期限" + TimeLimit + "还款方式" + RepaymentType + "利率" + Rate);
    var monthRate = parseFloat(Rate / 100 / 12); //月利率
    var Amount;//金额
    var Profit;//预计收益
    var dayRate;
    var dayInterest;

    switch (Number(RepaymentType)) {
        case 1:
            if (Number(TimeType) == 3) {

                var month = GetMonthPayment(Principal, monthRate, TimeLimit * 12);
                Amount = parseFloat(month * TimeLimit * 12);
                Profit = (Amount - Principal);
            }
            else {
                var month = GetMonthPayment(Principal, monthRate, TimeLimit);
                Amount = parseFloat(month * TimeLimit);
                Profit = (Amount - Principal);
            }
            break;
        case 2:
            switch (Number(TimeType)) {
                case 2:
                    dayRate = parseFloat(Rate / 100 / 12); //月利率
                    dayInterest = ((Principal * dayRate) * 100) / 100; //月息
                    Profit = (dayInterest * TimeLimit); //总利息
                    Amount = (Profit + Principal);
                    break;
                case 3:
                    dayRate = parseFloat(Rate / 100); //年利率
                    dayInterest = ((Principal * dayRate) * 100) / 100; //年息
                    Profit = (dayInterest * TimeLimit); //总利息
                    Amount = (Profit + Principal);
                    break;
                case 1:
                    dayRate = parseFloat(Rate / 100 / 365); //日利率
                    dayInterest = ((Principal * dayRate) * 100) / 100; //日息
                    Profit = (dayInterest * TimeLimit); //总利息
                    Amount = (Profit + Principal);
                    break;
            }
            break;
        case 3:

            switch (Number(TimeType)) {
                case 3:
                    dayRate = parseFloat(Rate / 100 / 365);
                    console.log("dayRate" + dayRate);
                    dayInterest = ((Principal * dayRate) * 100) / 100; //月息
                    console.log("月息" + dayInterest);
                    Profit = (dayInterest * TimeLimit * 365); //总利息
                    console.log("总利息" + Profit);
                    Amount = (Profit + Principal);
                    break;
                case 2:
                    dayRate = parseFloat(Rate / 100 / 12); //月利率
                    dayInterest = ((Principal * dayRate) * 100) / 100; //月息
                    Profit = (dayInterest * TimeLimit); //总利息
                    Amount = (Profit + Principal);
                    break;
                case 1:
                    dayRate = parseFloat(Rate / 100 / 365); //日利率
                    dayInterest = ((Principal * dayRate) * 100) / 100; //日息
                    Profit = (dayInterest * TimeLimit); //总利息
                    Amount = (Profit + Principal);
                    break;
            }
            break;
    }
    return Profit;
}
function GetMonthPayment(balance, monthRate, months) {
    return balance * monthRate * Math.pow(1.0 + monthRate, months) / (Math.pow(1.0 + monthRate, months) - 1.0);

}
//钱
function getmoney(str) {
    var num = "￥" + str.split('').reverse().join('').replace(/(\d{3}(?=\d)(?!\d+\.|$))/g, '$1,').split('').reverse().join('');
    return num;
}
function formatCurrency(num) {
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.50000000001);
    cents = num % 100;
    num = Math.floor(num / 100).toString();
    if (cents < 10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3) ; i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' +
            num.substring(num.length - (4 * i + 3));
    return (((sign) ? '' : '-') + num + '.' + cents);
}

// function fixedSidebar() {
//     var side = $('.sidebar');
//     var sideTop = side.offset().top + side.height();
//     var h = $('.f-listcont').height() - side.height();
//     var timer = 300;
//     var fixStatus = function () {
//         var winHeight = $(window).height();
//         var scrollTop = $(document).scrollTop();
//         var tempBottom = scrollTop + winHeight - sideTop;
//         if (tempBottom > h) { tempBottom = h };
//         if (scrollTop + winHeight > sideTop) {
//             side.css({ position: 'static' }).stop(true).animate({ "margin-top": tempBottom }, timer)
//         } else {
//             side.css({ position: 'static' }).stop(true).animate({ "margin-top": 0 }, timer)
//         }
//     };
//     $(window).scroll(function () { fixStatus() }); $(window).resize(function () { fixStatus() });
// };

var Utils={
    isPC: function() {
        var userAgentInfo = navigator.userAgent;
        //    var Agents=["Android","iPhone","SymbianOS","Windows Phone","iPad","iPod"];    //手机端包括ipad
        var Agents = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPod"];   //手机端不包括ipad
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break
            }
        }
        return flag
    },
    getRequest:function() {
        var url = location.search;
        var theRequest = {};
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
            }
        }
        return theRequest;
    },
    fMoney:function (s, n) {
        n = n > 0 && n <= 20 ? n : 2;
        s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
        var l = s.split(".")[0].split("").reverse(),
            r = s.split(".")[1];
        t = "";
        for (i = 0; i < l.length; i++) {
            t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
        }
        return t.split("").reverse().join("") + "." + r;
    },
    fNum: function (s, n) {
        s = parseFloat((s + "").replace(/[^\d\.-]/g, "")) + "";
        var l = s.split(".")[0].split("").reverse(),
            t = "";
        for (i = 0; i < l.length; i++) {
            t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
        }
        return t.split("").reverse().join("");
    },
    moneyToNum:function (m) {
        return parseFloat(m.replace(/,/g,""));
        // return parseFloat(s.replace(/[^\d\.-]/g, ""));
    },
    bitFormat: function(num, length) {     //格式化数字， 例 1 变成 01
      return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
    },
    environment:function () {
      var mOrigin="https://api.zwdai.com";
      if(window.location.origin.indexOf("sit")>-1){
        mOrigin=window.location.origin.replace("sit","sitapi");
      }else if(window.location.origin.indexOf("uat")>-1){
        mOrigin=window.location.origin.replace("uat","uatapi");
      }
      return mOrigin;
    },
    getPeriodTypeStr: function(id) {
      switch (id) {
        case 1:
          return '天';
          break;
        case 2:
          return '个月';
          break;
        case 3:
          return '年';
          break;
        default:
          return '周';
          break;
      }
    },
    getPercent: function(base, progress) {
      var percent = Math.floor(parseFloat(progress / base) * 100);
      return percent;
    }
};

// 通用提示语
var ZwConstants = {
  QUERY_ERROR: '请求数据出错！',
  RETURN_ERROR: '返回数据出错,请稍后再试！'
};
