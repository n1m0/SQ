/** 文档加载完成*/
 $(function(){	
	//
	$("#orderTypeSelect").on("change", function(){
		var type = $("#orderTypeSelect  option:selected").text();
		var len1 = $("#searchBox > tr").children().size();
		var len2 = $("#table-column > tr").children().size();
		//
		if(len1 == 5) {
			$("#searchBox > tr").children().eq(3).remove();
		}
		//
		if(len2 == 6) {
			$("#table-column > tr").children().eq(5).remove();
		}
		
		$("#statusSelect").children().remove();
		$("#show_all_order > tr").remove();
		if("借贷" == type) { //借贷
			var $opt1 = $("<option value='0'>==请选择订单状态==</option>");
			var $opt2 = $("<option value='1'>驳回</option>");
			var $opt3 = $("<option value='2'>审核中</option>");
			var $opt4 = $("<option value='3'>还款中</option>");
			var $opt5 = $("<option value='4'>筹款中</option>");
			var $opt6 = $("<option value='5'>已结束</option>");
			$("#statusSelect").append($opt1);
			$("#statusSelect").append($opt2);
			$("#statusSelect").append($opt3);
			$("#statusSelect").append($opt4);
			$("#statusSelect").append($opt5);
			$("#statusSelect").append($opt6);
			
			var $td = $("<td></td>");
			var $select = $("<select></select>");
			$select.addClass("btn");
			$select.addClass("btn-default");
			$select.prop("id", "loanType");
			$select.prop("name", "loanType");
			var $sopt1 = $("<option value='0'>==请选择借贷类型==</option>");
			var $sopt2 = $("<option value='1'>车易贷</option>");
			var $sopt3 = $("<option value='2'>房易贷</option>");
			$select.append($sopt1);
			$select.append($sopt2);
			$select.append($sopt3);
			$td.append($select);
			
			var p = $("#statusSelect").parent();
			$($td).insertAfter(p);
			
			var $th = $("<th>借贷类型</th>");
			$th.css("text-align", "center");
			var bo = $("#table-column > tr").children().eq(4);
			$($th).insertAfter(bo);
			
		} else { //投资
			var $opt1 = $("<option value='0'>==请选择订单状态==</option>");
			var $opt2 = $("<option value='1'>投资中</option>");
			var $opt3 = $("<option value='2'>回款中</option>");
			var $opt4 = $("<option value='3'>已结束</option>");
			$("#statusSelect").append($opt1);
			$("#statusSelect").append($opt2);
			$("#statusSelect").append($opt3);
			$("#statusSelect").append($opt4);
		}
	});
	
	//查询
	$("#selectOrder").on("click", function(){
		//订单类型
		var type = $("#orderTypeSelect  option:selected").val();
		//查询日期
		var date = $("#datetimepicker2").val();
		var sysDate = new Date();
		var month = sysDate.getMonth() + 1;
		var time = sysDate.getFullYear() + "-" + month + "-" + sysDate.getDate();
		if(type == 0 || date == time) {
			 if(type == 0)
				 $.messager.alert("操作提示", "请选择订单类型");
			 if(date == time)
				 $.messager.alert("操作提示", "今日订单未生成");
			 return false;
		} else {
			//订单类型
			var type = $("#orderTypeSelect  option:selected").text();
			//订单状态
			var status = $("#statusSelect  option:selected").val();
			//借贷类型
			var ltype = $("#loanType option:selected").val();
			if(date == '' || date.trim() == '') date = null;
			if('0' == status) 
				status = '默认';
			else 
				status = $("#statusSelect  option:selected").text();
			if('0' == ltype)
				ltype = '默认';
			else 
				ltype = $("#loanType option:selected").text();
			if('投资' == type) ltype = '无';
			//查询
			var search = {
				'date' : date,
				'type' : type,
				'status' : status,
				'ltype' : ltype
			};
			$.ajax({
				url : 'backStage/m/os',
				type : 'post',
				data : JSON.stringify(search),
				contentType: 'application/json',
				dataType : 'json',
				success : function(data) {
					pagination(data);
					return false;
				},
				error : function(){
				}
			});
		}
	});
	
	//格式化金额
	function fmoney(s, n) { 
		n = n > 0 && n <= 20 ? n : 2; 
		s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + ""; 
		var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1]; 
		t = ""; 
		for (i = 0; i < l.length; i++) { 
		t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : ""); 
		} 
		return t.split("").reverse().join("") + "." + r; 
	} 
	
	//执行跳转到尾页
	$('body').on('click', '#goto_last_page', function() {
		paginationByAjax('backStage/m/os/fl', '尾页');
	});
	
	//执行跳转到首页
	$('body').on('click', '#goto_first_page', function() {
		paginationByAjax('backStage/m/os/fl', '首页');
	});
	
	//上一页
	$('body').on('click', '#goto_pre_page', function() {
		paginationByAjax('backStage/m/os/pn', '上一页');
	});
	
	//下一页
	$('body').on('click', '#goto_next_page', function() {
		paginationByAjax('backStage/m/os/pn', '下一页');
	});
	
	//使用ajax进行分页
	function paginationByAjax(url, type) {
		$.ajax({
			url : url,
			type : 'post',
			data : {'type' : type},
			dataType : 'json',
			success : function(data) {
				pagination(data);
				return false;
			},
			error: function(){}
		});
	}
	
	//分页处理
	function pagination(data) {
		var list = data[0];
		var map = data[1];
		$("#show_all_order > tr").remove();
		$("ul > li").remove();
		if(list.length > 0) {
			for(var i=0; i<list.length; i++) {
				var $tr = $("<tr></tr>");
				var $td1 = $("<td></td>");
				$td1.css("text-align", "center");
				$td1.text((i+1));
				var $td2 = $("<td></td>");
				$td2.css("text-align", "center");
				$td2.text(list[i].date);
				var $td3 = $("<td></td>");
				$td3.css("text-align", "center");
				$td3.text(list[i].status);
				var $td4 = $("<td></td>");
				$td4.css("text-align", "center");
				var m = fmoney(list[i].money, 2);
				$td4.text(m);
				var $td5 = $("<td></td>");
				$td5.css("text-align", "center");
				$td5.text(list[i].count);
				
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3);
				$tr.append($td4);
				$tr.append($td5);
				
				if(list[i].ltype != "" && list[i].ltype != null) {
					var $td6 = $("<td></td>");
					$td6.css("text-align", "center");
					$td6.text(list[i].ltype);
					$tr.append($td6);
				}
				$("#show_all_order").append($tr);
			}
			
		} else {
			var $tr = $("<tr></tr>");
			var $td = $("<td></td>");
			var len = $("#table-column > tr").children().size();
			$td.prop("colspan", "5");
			if(len == 6) {
				$td.prop("colspan", "6");
			}
			$td.css("text-align", "center");
			$td.text('没有订单数据');
			$tr.append($td);
			$("#show_all_order").append($tr);
		}
		//设置分页
		if(map.totlepage == 0 || map.totlepage == 1) {
			var $li1 = $("<li></li>");
			$li1.append("当前第  "+ map.currentPage +" 页   共" + map.totlepage + " 页   共" + map.totleCount + " 条记录"); 
			var $li2 = $("<li>首页</li>");
			var $li3 = $("<li>上一页</li>");
			var $li4 = $("<li>下一页</li>");
			var $li5 = $("<li>尾页</li>");
			$("ul").append($li1);
			$("ul").append($li2);
			$("ul").append($li3);
			$("ul").append($li4);
			$("ul").append($li5);
		} else {
			//第一页设置
			if(map.totlepage == map.currentPage) {
				var $li1 = $("<li></li>");
				$li1.append("当前第  "+ map.currentPage +" 页   共" + map.totlepage + " 页   共" + map.totleCount + " 条记录"); 
				var $li2 = $("<li></li>");
				var $afirst = $("<a href='#'>首页</a>");
				$afirst.prop('id', 'goto_first_page');
				$li2.append($afirst);
				var $li3 = $("<li></li>");
				var $apre = $("<a href='#'>上一页</a>");
				$apre.prop('id', 'goto_pre_page');
				$li3.append($apre);
				var $li4 = $("<li>下一页</li>");
				var $li5 = $("<li>尾页</li>");
				$("ul").append($li1);
				$("ul").append($li2);
				$("ul").append($li3);
				$("ul").append($li4);
				$("ul").append($li5);
			} else if(map.currentPage == 1) { //最后一页设置
				var $li1 = $("<li></li>");
				$li1.append("当前第  "+ map.currentPage +" 页   共" + map.totlepage + " 页   共" + map.totleCount + " 条记录"); 
				var $li2 = $("<li>首页</li>");
				var $li3 = $("<li>上一页</li>");
				var $li4 = $("<li></li>");
				var $anext = $("<a href='#'>下一页</a>");
				$anext.prop('id', 'goto_next_page');
				$li4.append($anext);
				var $li5 = $("<li></li>");
				var $alast = $("<a href='#'>尾页</a>");
				$alast.prop('id', 'goto_last_page');
				$li5.append($alast);
				$("ul").append($li1);
				$("ul").append($li2);
				$("ul").append($li3);
				$("ul").append($li4);
				$("ul").append($li5);
			} else { //中间也设置
				var $li1 = $("<li></li>");
				$li1.append("当前第  "+ map.currentPage +" 页   共" + map.totlepage + " 页   共" + map.totleCount + " 条记录"); 
				var $li2 = $("<li></li>");
				var $afirst = $("<a href='#'>首页</a>");
				$afirst.prop('id', 'goto_first_page');
				$li2.append($afirst);
				var $li3 = $("<li></li>");
				var $apre = $("<a href='#'>上一页</a>");
				$apre.prop('id', 'goto_pre_page');
				$li3.append($apre);
				var $li4 = $("<li></li>");
				var $anext = $("<a href='#'>下一页</a>");
				$anext.prop('id', 'goto_next_page');
				$li4.append($anext);
				var $li5 = $("<li></li>");
				var $alast = $("<a href='#'>尾页</a>");
				$alast.prop('id', 'goto_last_page');
				$li5.append($alast);
				$("ul").append($li1);
				$("ul").append($li2);
				$("ul").append($li3);
				$("ul").append($li4);
				$("ul").append($li5);
			}
		}
	}
});
   