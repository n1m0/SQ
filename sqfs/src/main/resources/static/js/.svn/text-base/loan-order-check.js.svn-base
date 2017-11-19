var loan = {
	//检测银行卡号的有效性
	checkBankNO : function() {
		$("#bank_card").on("blur", function(){
			var bno = $(this).val();
			var regex = /\d{16}/g;
			if(!regex.test(bno)) {
				$.messager.alert('温馨提示', '银行卡号不正确');
				return;
			}
		});
	},
	//检测邮箱的有效性
	checkEmail : function() {
		$("#email").on("blur", function() {
			var email = $(this).val();
			var regex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/g;
			if(!regex.test(email)) {
				$.messager.alert('温馨提示', '邮箱格式不正确');
				return;
			}
		});
	},
	//手机号验证
	checkPhone : function() {
		$("#jj_name_phone").on("blur", function() {
			var phone = $(this).val();
			var regex = /^1[3|4|5|8][0-9]\d{4,8}$/;
			if(!regex.test(phone)) {
				$.messager.alert('温馨提示', '手机号格式不正确');
				return;
			}
		});
	},
	//月收入
	checkSalary : function() {
		$("#m_income").on("blur", function(){
			var s = $(this).val();
			var regex = /^[1-9]\d{1,}$/g;
			if(!regex.test(s)) {
				$.messager.alert('温馨提示', '月收入数据无效');
				return;
			}
		});
	},
	//checkBrithday
	checkBrithday : function() {
		var idno = $("#idcard").val();
		idno = idno.substr(6, 8); //19930506
		idno = idno.substr(0, 4) + "-" + idno.substr(4, 2) + "-" + idno.substr(6, 2);
		$("#birthDate").val(idno);
	},
	//提交表单
	submitForm : function() {
		$("#submitPersonalInfo").on("submit", function() {
			var bt = $("#birthDate").val();
			var bno = $("#bank_card").val();
			var email = $("#email").val();
			var jj_name = $("#jj_name").val();
			var jj_name_phone = $("#jj_name_phone").val();
			var jj_name_rela = $("#jj_name_rela").val();
			var w_position = $("#w_position").val();
			var m_income = $("#m_income").val();
			if(bt.trim() == '' || bno.trim() == '' || email.trim() == ''
				|| jj_name.trim() == '' || jj_name_phone.trim() == '' 
					|| jj_name_rela.trim() == "" || w_position.trim() == "" || m_income.trim() == "") {
				$.messager.alert('温馨提示', '信息不完成,请补充');
				return false;
			}
			return true;
		});
	},
	//如果未认证身份证号则跳转到认真界面
	checkID : function() {
		var name = $("#tname").val();
		var uid = $("#user_id_info").val();
		if(name == "" || name == null) {
			confirm('您尚未填写身份证信息,请前往补充.');
			window.location.href="trans/PersonalCenter/OpenThirdParty/" + uid;
		}
	}
}

$().ready(function(){
	loan.checkBankNO();
	loan.checkEmail();
	loan.checkPhone();
	loan.checkSalary();
	loan.checkBrithday();
	loan.submitForm();
	loan.checkID();
});