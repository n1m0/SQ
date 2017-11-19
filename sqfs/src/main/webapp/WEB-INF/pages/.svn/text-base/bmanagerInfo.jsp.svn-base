<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	href="${ctx }/bresources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${ctx }/bresources/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${ctx }/bresources/jquery/jquery-migrate-1.2.1.min.js"></script>
<!-- 导入bootStrap的库 -->
<script type="text/javascript"
	src="${ctx}/bresources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ctx}/bresources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/bresources/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${ctx}/bresources/easyUI/easyui.css">
<script type="text/javascript" src="${ctx}/bresources/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/bresources/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

     /** 文档加载完成，jq入口*/
     $(function(){
    	/*  if("${tip}"){
    		 $.messager.show({
 				title:'添加用户',
 				msg:"<span style='color:red;'>${tip}</span>",
 				showType:'slide'
 			});
    	 } */
    	
    	$(document).ajaxStart($.blockUI({ css: { backgroundColor: '#11a9e2', color: '#fff' } , message: '<h6>正在加载..</h6>'})).ajaxStop($.unblockUI());
      
    	var manTab = $("#manTab");
    	$('#manTab tr').each(function(){
    		var td = $(this).find('td').eq(0);
    		if (td.val() != null){
    			if (td.text() == "${MANAGER_IN_SESSION.manId}"){
    			$(this).find("input:eq(0)").attr("disabled", true).css("background","cccccc").css("color","cccccc");  
    			$(this).find("input:eq(1)").attr("disabled", true).css("background","cccccc").css("color","cccccc");  
    			}
    		}
    	});
    	
    	/** 1.异步添加管理员 */
		 $("#btn_addMan").bind("click",function(){
			 var manId = $("#addManId");
			 var name = $("#addName");
			 var roleName = $("#addRoleName option:selected");
			 // 校验添加信息是否完整 
			 var msg = "";
			if ($.trim(manId.val()) == "") {
				msg += "工号不为空！";
				manId.focus();
			} else if($.trim(name.val()) == "") {
				msg += "姓名不为空！";
				name.focus();
			} else if($.trim(roleName.val()) == "") {
				msg += "未选择角色！";
			}
			// 信息不完整，不提交
			if (msg != "") {
				$.messager.alert("提示", msg, "warning");
				return false;
			} 
			
			 var params = $("#addManFrom").serialize();
			
			 /** 发起异步请求添加管理员 */
			 $.ajax({
				 url:"${ctx}/backStage/man/addMan",
				 type: "post",
				 dataType : "json",
				 data : params ,
				 async : true ,  
				 success : function(data){
					 $.messager.show({
							title:'添加管理员',
							msg:"<span style='color:green;'>"+data.tip+"</span>",
							showType:'slide'
					});
					 window.location.reload;
				 },error : function(){
					 $.messager.alert("添加提示","<span style='color:red;'>系统故障，稍后重试！</span>","error");
				 }
			 });
				 
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
       
       /** 重置密码绑定事件 */
       $(".restPassword").click(function(){
    	   var inp = $(this);
    	   //$.messager.defaults = { ok: "是", cancel: "否" };  
           $.messager.confirm("操作提示", "您确定要执行操作吗？", function (data) {  
               if (data) { 
            	   var manId = inp.parents('tr').find('td').eq(0).text();
            	   //alert(manId);
    			     // var params = $("#updatePwordForm").serialize();
    				 /** 重置密码 */
    				   $.ajax({
    					 url:"${ctx}/backStage/man/updatePword",
    					 type: "post",
    					 dataType : "json",
    					 data : {"manId":manId,"nPword":""} ,
    					 async : false ,  
    					 success : function(data){
    						 if(data.status = 0){
    							 $.messager.show({
    	   						 title:'密码初始化',
    	   						 msg:"<span style='color:green;'>"+"密码初始化成功！"+"</span>",
    	   						showType:'slide'
    	   						});
    						 }else {
    							 $.messager.show({
        	   					 title:'密码初始化',
        	   					 msg:"<span style='color:green;'>"+"密码初始化失败，请稍后重试！"+"</span>",
        	   					 showType:'slide'
        	   					});
    						 }
    					 },error : function(){
    						 $.messager.alert("密码初始化","<span style='color:red;'>系统故障，请稍后重试！</span>","error");
    						 return false;
    					 }
    				 });
               }  
               else {  
            	  // window.location.reload();  
               }  
           }); 
     	});
       
       var pDialog;
       
       /** 跳转到修改角色 */
       $(".modifyRole").click(function(){
    	   var inp = $(this);
           var selmanId = inp.parents('tr').find('td').eq(0).text();
           var selroleCode = inp.parents('tr').find('td').eq(3).text();
          
          // alert(selmanId);
          pDialog = new $("#divDialog").dialog({
				title : "修改角色", // 标题
				cls : "easyui-dialog", // class
				width : 400, // 宽度
				height : 280, // 高度
				maximizable : true, // 最大化
				minimizable : false, // 最小化
				collapsible : true, // 可伸缩
				modal : true, // 模态窗口
				onClose : function(){ // 关闭窗口
					
				}
          
		   	});
           $('#iframe').css('display', 'block');
		   $('#divDialog').parent().css('display', 'block');
		   $('.window-shadow').css('display', 'block');
		   $('.window-mask').css('display', 'block');
			 /** 为此窗口的iframe触发界面请求 */
			$("#iframe").attr("src","${ctx}/backStage/man/bmodifyRole?manId="+selmanId+"&roleCode="+selroleCode);
         
   		});
 	});
     
     
     
</script>
</head>
<body style="overflow: auto; width: 98%; height: 100%;">
   	<!-- 工具按钮区 -->
   	<%@ page isELIgnored="false"%>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=2>
		 <form id="addManFrom" action="${ctx}/backStage/man/addMan"
			method="post" style="padding-left: 5px;">
			<!-- 当前用户的manId -->
			<input id="addOperator" name="operator" value="${MANAGER_IN_SESSION.manId}" type="hidden">
			<table class="table-condensed">
				<tbody>
					<tr>
						<td rowspan="2" class="text-center"><font size=4>添加管理员：</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td style="text-align:right"><label>用户名</label></td>
						<td style="text-align:center"><input type="text" id="addManId" name="manId" 
							value="" class="form-control" placeholder="管理员工号"></td>
						<td width="150px" style="text-align:right"><label>姓名</label></td>
						<td><input type="text" id="addName" name="name" value=""
							 class="form-control" placeholder="管理员真实姓名" on></td>
					</tr>
					<tr>
						<td><label>角色</label></td>
						<td><select class="btn btn-default"
							 id="addRoleName" name="role.roleName">
							<option value="">==请选择角色==</option>
							<option value="超级管理员">超级管理员</option>
							<option value="一审">一审</option>
							<option value="二审">二审</option>
						</select></td>
						<td></td>
						<td><a id="btn_addMan" class="btn btn-info">
								<span class="glyphicon glyphicon-edit"></span>&nbsp;添加</a>
							<button type="reset" class="btn btn-danger">
								<span class="glyphicon glyphicon-remove"></span>&nbsp;重置
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
		<form class="form-horizontal" id="selectMansFrom"
			action="${ctx }/backStage/man/selectMans" method="post" style="padding-left: 5px;">
			<table class="table-condensed">
				<tbody>
					<tr>
						<td rowspan="3" class="text-center"><font size=4>查询管理员：</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><label>用户名</label></td>
						<td>
							<input type="text" id="manId" name="manId" value="" class="form-control" placeholder="管理员工号/可为空">
						</td>
						<td width="150px" style="text-align:right"><label>姓名</label></td>
						<td>
							<input type="text" id="manName" name="name" value="" class="form-control" placeholder="管理员真实姓名/可为空">
						</td>
					</tr>
					<tr>
						<td><label>操作人</label></td>
						<td>
							<input type="text" id="operator" name="operator" value="" class="form-control" placeholder="信息修改责任人/可为空">
						</td>
						<td width="150px" style="text-align:right"><label>操作时间</label></td>
						<td>
							<input type="text" id="operateTime" name="operateTime" value="" class="form-control" onclick="WdatePicker()" readonly="readonly" placeholder="信息修改时间/可为空">
						</td>
					</tr>
					<tr>
						<td><label>角色</label></td>
						<td>
							<select class="btn btn-default" id="roleName" name="role.roleName">
								<option value="">==请选择角色==</option>
								<option value="超级管理员">超级管理员</option>
								<option value="二审">二审</option>
								<option value="一审">一审</option>
								<option value="无角色">无角色</option>
							</select>
						</td>
						<td></td>
						<td>
							<button type="submit" id="btn_selectMans" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>&nbsp;查询</button>
							<button type="reset" class="btn btn-danger">
								<span class="glyphicon glyphicon-remove"></span>&nbsp;重置
							</button>
						</td>
						<!-- <td>
							<input type="radio" checked="checked" name="managerName" value="">其它
						</td> -->
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
				<table id="manTab" class="table table-bordered" >
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
					<c:forEach items="${requestScope.manList}" var="man" varStatus="stat">
						<tr align="center">
							<%-- <td><input type="checkbox" name="box" id="box_${stat.index}"
								value="${user.userId}" /></td> --%>
							<td>${man.manId }</td>
							<td>${man.name}</td>
							<td>${man.role.roleName}</td>
							<td>${man.role.roleCode}</td>
							<td>${man.operator}</td>
							<td><fmt:formatDate value="${man.operateTime}" pattern="yyyy-MM-dd"/></td>
							<td>
								<input type="button" value="修改角色" style="background-color:ccddff;"
									class="modifyRole"/>
								<input type="button" value="密码初始化" style="background-color:ccddff"
								class="restPassword" />
						    </td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
		
		<div id="divDialog" style="display: none;" >
			 <!-- 放置一个添加用户的界面  -->
			 <iframe id="iframe" frameborder="0" style="width: 100%;height: 100%;"></iframe>
		</div>
  </body>
</html>
