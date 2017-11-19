function nextPage() {
	var currentPage=$("#currentPage").val();
	var totalPage=$("#totalPage").val();
	currentPage=parseInt(currentPage);
	totalPage=parseInt(totalPage);
	if(currentPage>=totalPage){
		alert("当前已经是最后一页");
	}else{
		$("#currentPage").val(currentPage+1);
		$("#fy").submit();
	}

}
function upPage() {
	var currentPage=$("#currentPage").val();
	currentPage=parseInt(currentPage);
	if(currentPage<=1){
		alert("当前已经是第一页");
	}else{
		$("#currentPage").val(currentPage-1);
		$("#fy").submit();
	}
}
function firstPage() {
	$("#currentPage").val(1);
	$("#fy").submit();
}
function lastPage() {
	var totalPage=$("#totalPage").val();
	totalPage=parseInt(totalPage);
	$("#currentPage").val(totalPage);
	$("#fy").submit();
}
$(function() {
	$("#allBox").toggle(
			function() {
				$("input[name='subBox']").prop("checked",true);
			},
			function() {
				$("input[name='subBox']").prop("checked",false);
			}
	)
})

$(document).ready(function(){
	if(($("#type1").val())=="不限"){
		$("#post_type_").prop("checked",true);
	}
	if(($("#type1").val())=="车易贷"){
		$("#post_type_car").prop("checked",true);
	}
	if(($("#type1").val())=="房易贷"){
		$("#post_type_house").prop("checked",true);
	}
	if(($("#type2").val())=="rate0"){
		$("#borrow_interestrate_").prop("checked",true);
	}
	if(($("#type2").val())=="rate1"){
		$("#borrow_interestrate_1").prop("checked",true);
	}
	if(($("#type2").val())=="rate2"){
		$("#borrow_interestrate_2").prop("checked",true);
	}
	if(($("#type2").val())=="rate3"){
		$("#borrow_interestrate_3").prop("checked",true);
	}
	if(($("#type2").val())=="rate4"){
		$("#borrow_interestrate_4").prop("checked",true);
	}


	if(($("#type3").val())=="val0"){
		$("#spread_month_").prop("checked",true);
	}
	if(($("#type3").val())=="val1"){
		$("#spread_month_1").prop("checked",true);
	}
	if(($("#type3").val())=="val2"){
		$("#spread_month_2").prop("checked",true);
	}
	if(($("#type3").val())=="val3"){
		$("#spread_month_3").prop("checked",true);
	}
	if(($("#type3").val())=="val4"){
		$("#spread_month_4").prop("checked",true);
	}
	if(($("#type3").val())=="val5"){
		$("#spread_month_5").prop("checked",true);
	}

})
