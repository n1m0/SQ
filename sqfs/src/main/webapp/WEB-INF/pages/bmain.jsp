<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>SQ 金服后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="${ctx}/bcss/base.css" rel="stylesheet">
<link href="${ctx}/bcss/platform.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/bresources/easyUI/easyui.css">
<script type="text/javascript" src="${ctx }/bresources/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx }/bresources/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${ctx}/bresources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/bresources/main.js"></script>
<script type="text/javascript">
	$(function(){
		$('#tt').tabs({
		    	  tabHeight: 40,
			      onSelect:function(title,index){
			        var currentTab = $('#tt').tabs("getSelected");
			        if(currentTab.find("iframe") && currentTab.find("iframe").size()){
			            currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
			        }
			      }
		 });
	});

     // 写一个方法往easyUI中添加面板 
	function addPanel(id,url,name){
    	name = name.replace(/-/g,"");
    	// 判断之前是否已经存在该面板存在就不创建新的面板 
    	var exist = $('#tt').tabs('exists',name);
    	if(exist){
    		// 已经存在就将该面板选中  exist
    		$('#tt').tabs('select',name);
    		var currentTab =  $('#tt').tabs('getTab',name);
    		// 刷新一下界面 
    		if(currentTab.find("iframe") && currentTab.find("iframe").size()){
	            currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
	        }
    	}else{
    		$('#tt').tabs('add',{
    			id:id,
    			title: name,
    			content: '<div style="width:100%;height:100%;"><iframe class="page-iframe" src="' + url + '" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe></div>',
    			closable: true
    		});
    	}
	}
	   
	    $(window).resize(function(){
	          $('.tabs-panels').height($("#pf-page").height()-46);
	          $('.panel-body').height($("#pf-page").height()-76);
	    }).resize();

	    var page = 0,
	        pages = ($('.pf-nav').height() / 70) - 1;

	    if(pages === 0){
	      $('.pf-nav-prev,.pf-nav-next').hide();
	    }
	    $(document).on('click', '.pf-nav-prev,.pf-nav-next', function(){
			    	
	      if($(this).hasClass('disabled')) return;
	      if($(this).hasClass('pf-nav-next')){
	        page++;
	        $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
	        if(page == pages){
	          $(this).addClass('disabled');
	          $('.pf-nav-prev').removeClass('disabled');
	        }else{
	          $('.pf-nav-prev').removeClass('disabled');
	        }
	      }else{
	        page--;
	        $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
	        if(page == 0){
	          $(this).addClass('disabled');
	          $('.pf-nav-next').removeClass('disabled');
	        }else{
	          $('.pf-nav-next').removeClass('disabled');
	        }
	        
	      }
	    });
	    
	    function exit(){
	    	window.location = "${ctx}/backStage/m/logout";
	    }
	    
	    function updatePword(){
	    	 $("#divDialog").dialog({
					title : "修改密码", // 标题
					cls : "easyui-dialog", // class
					width : 400, // 宽度
					height : 300, // 高度
					maximizable : true, // 最大化
					minimizable : false, // 最小化
					collapsible : true, // 可伸缩
					modal : true, // 模态窗口
					onClose : function(){ }
			    });
			 /** 为此窗口的iframe触发界面请求 */
			 $("#iframe").attr("src","${ctx}/backStage/m/bmodifyPword");
	     }
	    
	    // setTimeout(function(){
	    //    $('.tabs-panels').height($("#pf-page").height()-46);
	    //    $('.panel-body').height($("#pf-page").height()-76)
	    // }, 200)
</script>

</head> 
<body>
    <div class="container">
        <div id="pf-hd">
           <div class="pf-logo">
                <img  src="${ctx}/bpic/logo.png" alt="logo">
           </div>
            


            <div class="pf-user">
                <!-- <div class="pf-user-photo">
                    <img style="width: 40px;height: 40px;" src="${ctx}/images/main/xlei.jpg" alt="">
                </div> -->
                <h4 class="pf-user-name ellipsis">管理员：${MANAGER_IN_SESSION.name}</h4>
                <i class="iconfont xiala">&#xe607;</i>

                <div class="pf-user-panel">
                    <ul class="pf-user-opt">
                        <li>
                            <a href="javascript:updatePword();" >
                                <i class="iconfont">&#xe60d;</i>
                                <span class="pf-opt-name">修改密码</span>
                            </a>
                        </li>
                        <li  id="exit">
                            <a href="${ ctx}/backStage/m/logout">
                                <i class="iconfont">&#xe60e;</i>
                                <span class="pf-opt-name">退出</span>
                            </a>
                        </li>
                    </ul>
                </div>
                
          		<div id="divDialog" style="display: none;" >
						 <!-- 放置一个添加用户的界面  -->
					 <iframe id="iframe" frameborder="0" style="width: 100%;height: 100%;"></iframe>
				</div>
            </div>

        </div>

        <div id="pf-bd">
            <div id="pf-sider">
                <h2 class="pf-model-name">
                    <span class="iconfont">&#xe64a;</span>
                    <span class="pf-name">管理员信息系统</span>
                    <span class="toggle-icon"></span>
                </h2>
				<!-- 展示系统左侧权限树  -->
                <ul class="sider-nav" id="sider-nav">   
                			<c:if test="${'A' eq MANAGER_IN_SESSION.role.roleCode}">      	  	
                  	  	    	<li>
		                  	  	    <a href="javascript:;" >
			                            <span class="iconfont sider-nav-icon">&#xe611;</span>
			                            <span class="sider-nav-title">管理员信息</span>
			                            <i class="iconfont">&#xe642;</i>
			                        </a>
			                        <ul class="sider-nav-s">
			                              
			                        		 <li><a href="javascript:addPanel('001001' ,'${ctx}/backStage/man/showAll','角色管理');">角色管理</a></li>
			                        		 <li><a href="javascript:addPanel('${secondModule.code }' ,'${ctx}/backStage/m/bright','权限管理');">权限管理</a></li>
			                       		 
			                        </ul>
                  	  	        </li>
                  	  	    </c:if> 
                  	  	        <li>
		                  	  	    <a href="javascript:;" >
			                            <span class="iconfont sider-nav-icon">&#xe611;</span>
			                            <span class="sider-nav-title">订单信息</span>
			                            <i class="iconfont">&#xe642;</i>
			                        </a>
			                        <ul class="sider-nav-s">
			                              
			                        		 <li><a href="javascript:addPanel('${secondModule.code }','${ctx}/backStage/m/bviewedOrder','已审订单');">已审订单<font color="red" size="1px" id="bviewedOrder"></font></a></li>
			                        		 <li><a href="javascript:addPanel('${secondModule.code }','${ctx}/backStage/m/bunviewOrder','未审订单');">未审订单<font color="red" size="1px" id="bunviewOrder"></font></a></li>
			                       		
			                        </ul>
                  	  	        </li>
                  	  	         
                  	  	        <li>
		                  	  	    <a href="javascript:;" >
			                            <span class="iconfont sider-nav-icon">&#xe611;</span>
			                            <span class="sider-nav-title">数据分析</span>
			                            <i class="iconfont">&#xe642;</i>
			                        </a>
			                        <ul class="sider-nav-s">       
			                        	<li><a href="javascript:addPanel('001002' ,'${ctx}/backStage/m/borderStatistics','订单统计');">订单统计</a></li>			                       		
			                        </ul>
                  	  	        </li>
                  	  	        <li>
		                  	  	    <a href="javascript:;" >
			                            <span class="iconfont sider-nav-icon">&#xe611;</span>
			                            <span class="sider-nav-title">流程管理</span>
			                            <i class="iconfont">&#xe642;</i>
			                        </a>
			                        <ul class="sider-nav-s">	                               
			                        		 <li><a href="javascript:addPanel('${secondModule.code }','${ctx}/backStage/m/bactivity','流程管理');">流程信息</a></li>			                       		 
			                        </ul>
                  	  	        </li>

                 </ul> 
            </div>

           
            <div id="pf-page">
                <div class="easyui-tabs" id="tt" style="width:100%;height:100%;">
                  <div title="后台管理" id="user" style="padding:10px 5px 5px 10px;">
                    	<iframe class="page-iframe" src="${ctx}/backStage/m/bgground" frameborder="0" height="100%" width="100%" scrolling="auto"></iframe>
                  </div>
                </div>
            </div>
        </div>

        <div id="pf-ft">
            <div class="system-name">
              <i class="iconfont">&#xe6fe;</i>
              <span>智能办公平台&nbsp;v1.0</span>
            </div>
            <div class="copyright-name">
              <span>Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2016&nbsp;SQ金服轻松理财，乐享收益&nbsp;版权所有</span>
              <i class="iconfont" >&#xe6ff;</i>
            </div>
        </div>
    </div>
  </body>
</html>
