var falgf=false;
function huodeshouyi(){
	var a=$("#tzje").val();//投资金额
	var d=$("#yue").html();//账户余额
	var e=$("#sytzje").val();//剩余投资金额
	var f=$("#loanUser").val();//用户是否登录
	var g=$("#minMoney").val();
	if(f==null || f==""){
		falgf=false;
		$("#err").html("请新进行登录和实名认证");
		$("#err").attr("color","red");
		$('#lijitouzi').attr('disabled', true);//添加disabled属性
		
	}else if(parseInt(a)>parseInt(d)){
		falgf=false;
		$("#err").html("账户余额不足,请充值");
		$("#err").attr("color","red");
		$('#lijitouzi').attr('disabled',true);//添加disabled属性
		
	}else if(parseInt(g)>parseInt(a)){
		falgf=false;
		$("#err").html("输入金额小于最低起投金额,请重新输入");
		$("#err").attr("color","red");
		$('#lijitouzi').attr('disabled',true);//添加disabled属性
		
	}else if(parseInt(a)>parseInt(e)){
		falgf=false;
		$("#err").html("输入金额大于剩余投资金额,请重新输入");
		$("#err").attr("color","red");
		$('#lijitouzi').attr('disabled',true);//添加disabled属性
		
	}else if(e==0){
		$('#lijitouzi').css('background', "grey");//添加disabled属性
		$('#lijitouzi').css('outline', "none");//添加disabled属性
	}else if(a==null || a==""){
		falgf=false;
		$("#err").html("投资金额不能为空,请重新输入");
		$('#lijitouzi').attr('disabled',true);//添加disabled属性

	}else{
		var b=$("#lilv").val();
		var c=$("#qixian").html();
		var sum=((a*b*c)/1200).toFixed(2);
		$("#shouyi").html(sum+"元");
		$("#accru").val(sum);
		$("#lijitouzi").css("background-color","green");
		$("#err").html("");
		falgf=true;
		$('#lijitouzi').attr('disabled',false);//添加disabled属性
	}
}
//投资前如果用户尚未实名认证,则跳转到实名认证中
function _doInvest(){
	var flag = $("#user_check_info_flag").val();
	if(flag != 1 && flag.trim() != '') {
		if(confirm('您尚未实名认证,请前往认证')) {
			window.location.href = "loan3/home";
			return true;			
		} else {
			return false;
		}
	}
	if(falgf)
		return true;
	return false;
}