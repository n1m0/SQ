/**
 *流程管理分页
 **/
var page = {
	//删除部署
	deleteDeployment : function() {
		$('body').on("click","a[name='del_deployment']",function(){
			//获取部署id
			var d = $(this).parent().parent().children().eq(0).text();
			var del_true = confirm('您确认删除吗?');
			if(del_true) {				
				page.sqfsAjax('backStage/m/del', d);
			} else {
				return false;
			}
		});
	},
	//页面跳转
	gotoPage : function() {
		$('#input_go').on('click', function(){
			var totle = $("#input_page_totle_hidden").val();
			var page = $("#input_page").val();
			if(page == '' || page.trim() == '') {
				$.messager.alert("程序猿提示", "输入的页数无效");
				return;
			}
			totle = totle * 1;
			page = page * 1;
			if(page <= totle && page > 0) {
				page.sqfsAjax('backStage/m/go', page);
			} else {
				$.messager.alert("程序猿提示", "输入的页数无效。");
			}
		});
	},
	//尾页
	lastPage : function() {
		$('body').on('click','#last_page',function(){
			page.sqfsAjax('backStage/m/last-page', '尾页');
		});
	},
	//首页
	firstPage : function() {
		$('body').on('click','#first_page',function(){
			page.sqfsAjax('backStage/m/first-page', '首页');;
		});
	},	
	//上一页
	prePage : function() {
		$('body').on('click','#pre_page',function(){
			page.sqfsAjax('backStage/m/pre-page', '上一页');
		});
	},
	//下一页
	nextPage : function() {
		$('body').on('click','#next_page',function(){
			page.sqfsAjax('backStage/m/next-page', '下一页');
		});
	},
	//分页信息处理
	pagination : function(data) {
		var list = data[0];
		var map = data[1];
		$("tfoot > tr").remove();
		if(list.length > 0) {
			for(var i=0; i<list.length; i++){
				//tr
				var $tr = $('<tr></tr>');
				$tr.prop("id", "dataTr_");
				$tr.prop("align", "center");					
				
				//td
				var $td_id = $('<td></td>');
				$td_id.text(list[i].id);
				var $td_name = $('<td></td>');
				$td_name.text(list[i].name);
				var $td_dep = $('<td></td>');
				$td_dep.text(list[i].deploymentTime);
				var $td_ver = $('<td></td>');
				$td_ver.text(list[i].version);
				var $td_do = $('<td></td>');
				var $a_del = $('<a href="#">删除</a>');
				$a_del.prop('name', 'del_deployment');
				$a_del.prop('href', 'javascript:void(0)');
				var $a_view = $('<a>查看流程图</a>');
				$a_view.prop("target", "_blank");
				$a_view.prop("href", "backStage/m/v/" + list[i].id);
				$td_do.append($a_del); 
				$td_do.append('&nbsp;&nbsp;&nbsp;'); 
				$td_do.append($a_view);
				//追加
				$tr.append($td_id);
				$tr.append($td_name);
				$tr.append($td_dep);
				$tr.append($td_ver);
				$tr.append($td_do);
				$("#pd_tf_tr").append($tr);
			}
		} else {
			var $tr = $('<tr></tr>');
			var $td = $('<td></td>');
			$td.text('暂无发布流程');
			$td.prop('colspan', '6');
			$td.css('text-align', 'center');
			$tr.append($td);
			$("#pd_tf_tr").append($tr);
		}
		//设置分页
		//清除信息
		$("ul > li").remove();
		$("#input_page_totle_hidden").val('');
		$("#input_page_totle_hidden").val(map.pages);
		//
		var $li_info = $('<li></li>');
		var text = '共有 ' + map.pages + ' 页  ';
		text += '当前第 ' + map.currentPage + ' 页  ';
		text += '共有 ' + map.count + ' 条记录';
		$li_info.text(text);
		
		var $li_first = $('<li></li>');
		var $li_pre = $('<li></li>');
		if(map.currentPage==1 || map.currentPage==0) {
			$li_first.text('首页');
			$li_pre.text('上一页');
		} else {
			var $a_first = $("<a href='#'>首页</>");
			$a_first.prop('id', 'first_page');
			$a_first.prop('href', 'javascript:void(0)');
			var $a_pre = $("<a href='#'>上一页</>");
			$a_pre.prop('id', 'pre_page');
			$a_pre.prop('href', 'javascript:void(0)');
			$li_first.append($a_first);
			$li_pre.append($a_pre);
		}
		var $li_last = $('<li></li>');
		var $li_next = $('<li></li>');
		if(map.currentPage == map.pages) {
			$li_next.text('下一页');
			$li_last.text('尾页');
		} else {
			var $a_last = $("<a href='#'>尾页</>");
			$a_last.prop('id', 'last_page');
			$a_last.prop('href', 'javascript:void(0)');
			var $a_next = $("<a href='#'>下一页</>");
			$a_next.prop('id', 'next_page');
			$a_next.prop('href', 'javascript:void(0)');
			$li_last.append($a_last);
			$li_next.append($a_next);
		}
		//
		$("#pagination").append($li_info);
		$("#pagination").append($li_first);
		$("#pagination").append($li_pre);
		$("#pagination").append($li_next);
		$("#pagination").append($li_last);
		//设置跳转按钮
		if(map.pages == 1 || map.pages == 0) {
			$("#input_go").prop('disabled', true);
			$("#input_page").prop('disabled', true);
		} else {
			$("#input_go").prop('disabled', false);
			$("#input_page").prop('disabled', false);						
		}
	},
	//异步请求
	//@param type
	//   1. 可为执行上下翻页时标识为'上一页'或'下一页'
	//   2. 可为执行页面跳转时跳转的页数
	//   3. 可为执行删除被删除的部署的id
	sqfsAjax : function(url, type) {
		$.ajax({
			url : url,
			type : 'post',
			data : {'type' : type},
			dataType : 'json',
			success : function(data) {
				page.pagination(data);
				return false;
			},
			error : function(data) {
				
			}
		});
	},
	//
	submitProcessFile : function() {
		$("#_submitProcessFile").on("submit", function() {
			var name = $("input[name='processDefinitionName']").val();
			var zipDocs = $("input[name='zipDocs']").val();
			if((name.trim() != "" || name != "") && zipDocs != "") {
				if(confirm("确定上传文件吗?"))
					return true;
				return false;
			} else {
				$.messager.alert("程序猿提示", "额...名称和文件都不能为空");
				return false;
			}
		});
	}
};

$().ready(function() {
	page.nextPage();
	page.prePage();
	page.firstPage();
	page.lastPage();
	page.gotoPage();
	page.deleteDeployment();
	page.submitProcessFile();
});