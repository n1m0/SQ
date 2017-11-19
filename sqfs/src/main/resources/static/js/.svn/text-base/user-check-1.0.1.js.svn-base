$().ready(function(){
	//执行借贷动作前先判断用户是否已经进行身份实名认证
	$("#gotoLoanPage").on("click", function() {
		var flag = $("#user_check_info_flag").val();
		//flag = flag.trim();
		if(flag != 1 && flag.trim() != '') {
			$(this).prop('href', '');
			if(confirm('您尚未实名认证,请前往认证')) {
				$(this).prop('href', 'loan3/home');
				return true;			
			} else {
				return false;
			}
		}
		return true;
	})
});
