<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet"
	href="${ctx }/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${ctx }/resources/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/jquery/jquery-migrate-1.2.1.min.js"></script>
<!-- 导入bootStrap的库 -->
<script type="text/javascript"
	src="${ctx}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${ctx}/resources/easyUI/easyui.css">
<script type="text/javascript" src="${ctx}/resources/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript">

	var showTip = function(tip){
		 $.messager.show({
				title:'添加用户',
				msg:"<span style='color:red;'>"+tip+"</span>",
				showType:'slide'
		});
	};
	
     /** 文档加载完成*/
     $(function(){
    	 
    	  /** 激活用户操作*/
    	  $("input[id^='checkUser_']").switchbutton({
              onChange: function(checked){
            	    var status = checked?"1":"0";
            		window.location = "${ctx}/identity/user/activeUser.jspx?userId="+this.value+"&status="+status
						+"&pageIndex=${pageModel.pageIndex}&name=${user.name}&phone=${user.phone}&dept.id=${user.dept.id}&job.code=${user.job.code}";
              }
          });
    	
    	 if("${tip}"){
    		 $.messager.show({
 				title:'添加用户',
 				msg:"<span style='color:red;'>${tip}</span>",
 				showType:'slide'
 			});
    	 }
    	
    	$(document).ajaxStart($.blockUI({ css: { backgroundColor: '#11a9e2', color: '#fff' } , message: '<h6>正在加载..</h6>'})).ajaxStop($.unblockUI);
    	/** 异步加载部门信息  */
    	$.ajax({
    		url : "${ctx}/identity/dept/getAllDeptsAndJobsAjax.jspx",
    		type : "post",
    		dataType : "json",
    		async : true ,
    		success : function(data){
    			// 数据形式: 
    			// [ {id : 0001, name:"java开发工程师" },{id : 0001, name:"java开发工程师" } ]  job
    		    // [ {code : 0001 , name : "董事长" }, {code : 0001 , name : "董事长" }  ]   dept
    			// {depts : [ {id : 0001, name:"java开发工程师" },{id : 0001, name:"java开发工程师" } ] 
    		    //  jobs  : [ {code : 0001 , name : "董事长" }, {code : 0001 , name : "董事长" }  ] 
    			// }
    		    var depts = data.depts ;
    		    var jobs = data.jobs ;
    		    
    		    $.each(depts , function(){
    		    	$("<option />").val(this.code).html(this.name).appendTo("#deptSelect");
    		  		
//     		  		var option = new Option(this.name, this.code);
//     		  		$("#deptSelect").append(option);

					/** 直接拼接出完整的option  */
//     		    	$("#deptSelect").append("<option value='"+this.code+"'>"+this.name+"</option>");
    		   		
// 					var select = document.getElementById("deptSelect");
// 					var option = new Option(this.name, this.code);
// 					select.appendChild(option);
    		    });
    		    
    		    $.each(jobs , function(){
    		    	$("<option />").val(this.code).html(this.name).appendTo("#jobSelect");
    		    });
    			 
    		},error : function(){
    			$.messager.alert("用户提示","加载部门失败了","error");
    		}
    	});
   	 	
	   	 /** 选中部门和职位 */
	   	if("${user.job.code}")$("#jobSelect").val("${user.job.code}");
    	if("${user.dept.id}")$("#deptSelect").val("${user.dept.id}");
    	
    	/** 用户界面效果开发  */
    	/** 得到所有数据行的jquery对象 */
    	var dataTrs = $("tr[id^='dataTr_']");
    	dataTrs.hover(function(){
    		$(this).css({backgroundColor: "#eeecdd" , cursor : "pointer"});
    	},function(){
    		// 判断这一行的单选是否被选中了,如果被选中不要恢复成白色背景 
    		// 得到当前行对应的单选的id 
    		var trBoxId = this.id.replace("dataTr_","box_");
    		var trBox = $("#"+trBoxId);
    		if(!trBox.attr("checked")){
    			$(this).css("backgroundColor","#ffffff");
    		}
    	});  
    	
    	/** 全选  */
    	/**得到所有数据行的选项按钮  */
    	var dataBoxs = $("input[name='box'][id^='box_']");
    	$("#checkAll").click(function(){
    		dataBoxs.attr("checked",this.checked);
    		/** 全选如果被选中,则所有行的背景色被选中 ,反之 */
    		dataTrs.trigger(this.checked?"mouseover":"mouseout");
    	});
    	
    	/** 如果没有全部选中那么全选按钮也应该不选中  */
    	var boxSize = dataBoxs.length;
    	/** 给每个单选绑定点击事件 */
    	dataBoxs.on("click",function(event){
    		/** 取消单选事件的传播,单选点击完成以后,事件就结束了 */
    		event.stopPropagation();
    		/** 拿到当前选中的单选 */
    		var checkedBoxs = dataBoxs.filter(":checked");
    		$("#checkAll").attr("checked",checkedBoxs.length == boxSize);
    	});
    	
       /** 为所有数据行绑定点击事件  */
       dataTrs.click(function(){
    		/** 得到当前所点击行的对应单选按钮对象 */
    	    var trBoxId = this.id.replace("dataTr_","box_");
   			var trBox = $("#"+trBoxId);
   			trBox.trigger("click");
       });
       
       /** 删除用户  */
       $("#deleteUser").on("click",function(){
    	   /** 获取所有选中的数据行的id 传输到后台删除数据  */
    	   /** 拿到当前选中的单选 */
   		   var checkedBoxs = dataBoxs.filter(":checked");
    	   /** admin,liqin  */
    	   if(checkedBoxs.length > 0 ){
    		   $.messager.confirm('用户提示', '您确认删除吗?', function(r){
   				if (r){
   					 /** 真正删除:   */
   					var maps = checkedBoxs.map(function(){
   						 return this.value;
   					});
   					// alert(maps.get());
   					window.location = "${ctx}/identity/user/deleteUser.jspx?ids="+maps.get()
   							+"&pageIndex=${pageModel.pageIndex}&name=${user.name}&phone=${user.phone}&dept.id=${user.dept.id}&job.code=${user.job.code}";
   				}
   			});

    	   }else{
    		   $.messager.alert("用户提示","请选择您要删除的用户！","error");
    	   }
       });
       
       /** 添加用户操作 */
       $("#addUser").click(function(){
   			$("#divDialog").dialog({
   				title : "添加用户", // 标题
   				cls : "easyui-dialog", // class
   				width : 600, // 宽度
   				height : 420, // 高度
   				maximizable : true, // 最大化
   				minimizable : false, // 最小化
   				collapsible : true, // 可伸缩
   				modal : true, // 模态窗口
   				onClose : function(){ // 关闭窗口
   					window.location = "${ctx}/identity/user/selectUser.jspx?pageIndex=${pageModel.pageIndex}&name=${user.name}&phone=${user.phone}&dept.id=${user.dept.id}";
   				}
   		    });
   			/** 为此窗口的iframe触发界面请求 */
   			$("#iframe").attr("src","${ctx}/identity/user/showAddUser.jspx");
       });
       
//         var moduleOperasUrls = "${moduleOperasUrls}";
//         if(moduleOperasUrls.indexOf("addUser")==-1){
//         	$("#addUser").hide();
//         }
        
//         if(moduleOperasUrls.indexOf("deleteUser")==-1){
//         	$("#deleteUser").hide();
//         }
        
//         if(moduleOperasUrls.indexOf("updateUser")==-1){
//         	$("span[id^='updateUser_']").css("display","none");
//         }
        
//         if(moduleOperasUrls.indexOf("activeUser")==-1){
//         	$("input[id^='checkUser_']").switchbutton('disable')
//         }
        
     });
     
     function updateUser(userId){
    	 $("#divDialog").dialog({
				title : "修改用户", // 标题
				cls : "easyui-dialog", // class
				width : 600, // 宽度
				height : 420, // 高度
				maximizable : true, // 最大化
				minimizable : false, // 最小化
				collapsible : true, // 可伸缩
				modal : true, // 模态窗口
				onClose : function(){ // 关闭窗口
					window.location = "${ctx}/identity/user/selectUser.jspx?pageIndex=${pageModel.pageIndex}&name=${user.name}&phone=${user.phone}&dept.id=${user.dept.id}";
				}
		    });
		 /** 为此窗口的iframe触发界面请求 */
		 $("#iframe").attr("src","${ctx}/identity/user/showUpdateUser.jspx?userId="+userId);
     }
     
     function preUser(userId){
	   	 $("#divDialog").dialog({
				title : "用户详情", // 标题
				cls : "easyui-dialog", // class
				width : 820, // 宽度
				height : 350, // 高度
				maximizable : true, // 最大化
				minimizable : false, // 最小化
				collapsible : true, // 可伸缩
				modal : true, // 模态窗口
				onClose : function(){ // 关闭窗口
					
				}
		    });
		 /** 为此窗口的iframe触发界面请求 */
		 $("#iframe").attr("src","${ctx}/identity/user/showPreUser.jspx?userId="+userId);
     }
     function updateRole(){
	   	 $("#divDialog").dialog({
				title : "修改角色", // 标题
				cls : "easyui-dialog", // class
				width : 820, // 宽度
				height : 350, // 高度
				maximizable : true, // 最大化
				minimizable : false, // 最小化
				collapsible : true, // 可伸缩
				modal : true, // 模态窗口
				onClose : function(){ // 关闭窗口
					
				}
		    });
		 /** 为此窗口的iframe触发界面请求 */
		 $("#iframe").attr("src","modifyRole.jsp");
     }
     
</script>
</head>
<body style="overflow: auto; width: 98%; height: 100%;">
   	<!-- 工具按钮区 -->
   	<%@ page isELIgnored="false"%>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=2>
		 <form id="updateUserForm" action="${ctx}/identity/user/updateUser.jspx"
			method="post">
			<!-- 当前用户的useId -->
			<input name="userId" value="${user.userId }" type="hidden">
			
			<table class="table-condensed" style="text-align:center">
				<tbody>
					<tr>
						<td rowspan="2" class="text-center"><font size=4>添加管理员：</font></td>
						<td><label>用户名<label></td>
						<td><input type="password" id="password" name="passWord"
							value="${user.passWord}" class="form-control" placeholder="请输入员工工号"></td>
						<td><label>姓名<label></td>
						<td><input type="password" id="repwd" name="npwd" value="${user.passWord}"
							 class="form-control"></td>
					</tr>
					<tr>
						<td><label>角色<label></td>
						<td><select class="btn btn-default"
							 id="deptSelect" name="dept.id">
							<option value="0">请选择角色</option>
							<option value="0">超级管理员</option>
							<option value="0">一级管理员</option>
							<option value="0">二级管理员</option>
						</select></td>
						<td></td>
						<td><a id="btn_submit" class="btn btn-info">
								<span class="glyphicon glyphicon-edit"></span>&nbsp;修改</a>
							<button type="reset" class="btn btn-danger">
								<span class="glyphicon glyphicon-remove"></span>&nbsp;重置
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
		<form class="form-horizontal" 
			action="${ctx }/identity/user/selectUser.jspx" method="post" style="padding-left: 5px; height:25; >
			<table class="table-condensed">
					<tbody>
					<tr>
						<td><span><font size=4>查询管理员：</font></span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   <td>
						<input name="name" type="text" 
							 value="请输入查询关键字" >
						</td>
						<td>
							<button type="submit" id="selectUser" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>&nbsp;查询</button>
						</td>
						<td>
							<input type="radio"  name="managerName" value="">用户名
						</td>
						<td>
							<input type="radio"  name="managerName" value="">姓名
						</td>
						<td>
							<input type="radio"  name="managerName" value="">角色
						</td>
						<td>
							<input type="radio" checked="checked" name="managerName" value="">其它
						</td>
					</tr>
					</tbody>
				</table>
		</form>
		
		<HR style="border:1 dashed #987cb9" width="100%" color=#987cb9 SIZE=1>
 		<div class="panel panel-primary" style="padding-left: 15px;">
 			<div class="panel-heading" style="background-color: #11a9e2;"  >
				<h3 class="panel-title">管理员信息列表</h3>
			</div>
			<div class="panel-body">
				<table class="table table-bordered" >
					<thead>
						<tr style="font-size: 12px;" align="center">
							<th style="text-align: center;">用户名（工号）</th>
							<th style="text-align: center;">姓名</th>
							<th style="text-align: center;">角色</th>
							<th style="text-align: center;">角色标识</th>
							<th style="text-align: center;">操作人</th>
							<th style="text-align: center;">操作时间</th>
							<th style="text-align: center;">操作</th>
							
						</tr>
					</thead>
					<%-- <c:forEach items="${requestScope.users}" var="user"
						varStatus="stat"> --%>
						<tr id="dataTr_${stat.index}" align="center">
							<%-- <td><input type="checkbox" name="box" id="box_${stat.index}"
								value="${user.userId}" /></td> --%>
							<td>g_id</td>
							<td>g_name</td>
							<td>role_id</td>
							<td>role_code</td>
							<td>operatorname</td>
							<td>ope_time</td>
							<td>
								<input id="modifyUser" type="button" value="修改角色" onclick="javascrip:updateRole()"/>
								<input id="InitPassword" type="button" value="初始化密码"/>
						    </td>
								<%-- <td>${user.checker.name}</td>
							<td>
							   <span id="updateUser_${stat.index}"  class="label label-info"><a href="javascript:updateUser('${user.userId}')" style="color: white;">修改</a></span>
							   <span id="preUser_${stat.index}" class="label label-success"><a href="javascript:preUser('${user.userId}')"  style="color: white;">预览</a></span>
							</td> --%>
						</tr>
						<tr id="dataTr_${stat.index}" align="center">
							<%-- <td><input type="checkbox" name="box" id="box_${stat.index}"
								value="${user.userId}" /></td> --%>
							<td>g_id</td>
							<td>g_name</td>
							<td>role_id</td>
							<td>role_code</td>
							<td>operatorname</td>
							<td>ope_time</td>
							<td>
								<input id="modifyUser" type="button" value="修改角色" onclick="javascrip:updateRole()"/>
								<input id="InitPassword" type="button" value="初始化密码"/>
						    </td>
								<%-- <td>${user.checker.name}</td>
							<td>
							   <span id="updateUser_${stat.index}"  class="label label-info"><a href="javascript:updateUser('${user.userId}')" style="color: white;">修改</a></span>
							   <span id="preUser_${stat.index}" class="label label-success"><a href="javascript:preUser('${user.userId}')"  style="color: white;">预览</a></span>
							</td> --%>
						</tr>
						<tr id="dataTr_${stat.index}" align="center">
							<%-- <td><input type="checkbox" name="box" id="box_${stat.index}"
								value="${user.userId}" /></td> --%>
							<td>g_id</td>
							<td>g_name</td>
							<td>role_id</td>
							<td>role_code</td>
							<td>operatorname</td>
							<td>ope_time</td>
							<td>
								<input id="modifyUser" type="button" value="修改角色" onclick="javascrip:updateRole()"/>
								<input id="InitPassword" type="button" value="初始化密码"/>
						    </td>
								<%-- <td>${user.checker.name}</td>
							<td>
							   <span id="updateUser_${stat.index}"  class="label label-info"><a href="javascript:updateUser('${user.userId}')" style="color: white;">修改</a></span>
							   <span id="preUser_${stat.index}" class="label label-success"><a href="javascript:preUser('${user.userId}')"  style="color: white;">预览</a></span>
							</td> --%>
						</tr>
						<tr id="dataTr_${stat.index}" align="center">
							<%-- <td><input type="checkbox" name="box" id="box_${stat.index}"
								value="${user.userId}" /></td> --%>
							<td>g_id</td>
							<td>g_name</td>
							<td>role_id</td>
							<td>role_code</td>
							<td>operatorname</td>
							<td>ope_time</td>
							<td>
								<input id="modifyUser" type="button" value="修改角色" onclick="javascrip:updateRole()"/>
								<input id="InitPassword" type="button" value="初始化密码"/>
						    </td>
								<%-- <td>${user.checker.name}</td>
							<td>
							   <span id="updateUser_${stat.index}"  class="label label-info"><a href="javascript:updateUser('${user.userId}')" style="color: white;">修改</a></span>
							   <span id="preUser_${stat.index}" class="label label-success"><a href="javascript:preUser('${user.userId}')"  style="color: white;">预览</a></span>
							</td> --%>
						</tr>
						<tr id="dataTr_${stat.index}" align="center">
							<%-- <td><input type="checkbox" name="box" id="box_${stat.index}"
								value="${user.userId}" /></td> --%>
							<td>g_id</td>
							<td>g_name</td>
							<td>role_id</td>
							<td>role_code</td>
							<td>operatorname</td>
							<td>ope_time</td>
							<td>
								<input id="modifyUser" type="button" value="修改角色" onclick="javascrip:updateRole()"/>
								<input id="InitPassword" type="button" value="初始化密码"/>
						    </td>
								<%-- <td>${user.checker.name}</td>
							<td>
							   <span id="updateUser_${stat.index}"  class="label label-info"><a href="javascript:updateUser('${user.userId}')" style="color: white;">修改</a></span>
							   <span id="preUser_${stat.index}" class="label label-success"><a href="javascript:preUser('${user.userId}')"  style="color: white;">预览</a></span>
							</td> --%>
						</tr>
					<%-- </c:forEach> --%>
				</table>
				<!-- 分页标签区
				<fkjava:pager pageIndex="${pageModel.pageIndex}"
					pageSize="${pageModel.pageSize}"
					recordCount="${pageModel.recordCount}"
					submitUrl="${ctx}/identity/user/selectUser.jspx?pageIndex={0}&name=${user.name}&phone=${user.phone}&dept.id=${user.dept.id}&job.code=${user.job.code}" /> -->
			</div>

		</div>
		
		<div id="divDialog" style="display: none;" >
			 <!-- 放置一个添加用户的界面  -->
			 <iframe id="iframe" frameborder="0" style="width: 100%;height: 100%;"></iframe>
		</div>
  </body>
</html>
