<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>  
    <script type="text/javascript">  
            $(function(){  
                $(".submit_order").click(function(){  
                    $("#pay_form").submit();  
                });  
            });  
        </script>  
          
        <style type="text/css">  
            *{  
                margin: 0px;  
                padding: 0px;  
            }  
              
            body{  
                margin-top: 2%  
            }  
              
            .container {  
                width: 90%;  
                padding-right: 15px;  
                padding-left: 15px;  
                margin-right: auto;  
                margin-left: auto  
            }  
              
            img {  
                vertical-align: middle  
            }  
              
            h4 {  
                margin-top: 10px;  
                margin-bottom: 10px;  
                font-size: 18px  
            }  
              
            .row {  
                margin-right: -15px;  
                margin-left: -15px  
            }  
              
            .line {  
                margin-top: 15px;  
                border-top: 1px solid #9A9A9A;  
                height: 10px;  
            }  
  
            .row:after,.row:before{  
                display: table;  
                content: " "  
            }  
              
            .row:after{  
                clear: both  
            }  
  
            .submit_order {  
                height: 50px;  
                width: 150px;  
                background-color: #FF5000;  
                float: right;  
                text-align: center;  
                line-height: 50px;  
                color: #FFFFFF;  
                font-size: 16px;  
                cursor: pointer;  
            }  
              
            .submit_order:HOVER {  
                background-color:#FF0000;  
            }  
        </style> 
  </head>
  <body>
		 <%  
            Date now = new Date();  
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  
            String orderNumber = sdf.format(now);  
            String payAmount="0.01";  
        %>   
        <div class="container">  
            <form action="<%=basePath%>pay/payway" id="pay_form" method="post" > 
            <div class="row">  
                <table width="100%">  
                    <tr>  
                    <td>订单编号为：<span name="p2_Order"><%=orderNumber %></span></td> 
                        <td style="text-align: right;">  
                            <span>订单总价为：</span>  
                            <span style="color: red;">  
                                <strong>￥<input type="text"  name="p3_Amt">  元  </strong>  
                            </span>  
                     </td>  
                    </tr>  
                </table>  
            </div>  
              
            <div class="row line"></div>  
              
            <div class="row">  
                <h4><strong>选择银行</strong></h4>  
            </div>  
         	    <!-- 商品订单号：<input type="text" name="p2_Order"><br/>
				支付金额：<input type="text" name="p3_Amt"><br/>  -->
                <table width="100%" cellpadding="0" cellspacing="0" style="margin-top: 30px">  
                    <tr align="center">  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>  
                            <img src="<%=basePath%>images/icbc.png" align="middle" title="工商银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>  
                            <img src="<%=basePath%>images/bc.png" align="middle" title="中国银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>  
                            <img src="<%=basePath%>images/abc.png" align="middle" title="农业银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="POST-NET-B2C"/>  
                            <img src="<%=basePath%>images/post.png" align="middle" title="中国邮政"/>  
                        </td>  
                    </tr>  
                </table>  
                  
                <table width="100%" style="margin-top: 30px" cellpadding="0" cellspacing="0">  
                    <tr align="center">  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>  
                            <img src="<%=basePath%>images/pingan.png" align="middle" title="平安银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>  
                            <img src="<%=basePath%>images/ccb.png" align="middle" title="建设银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>  
                            <img src="<%=basePath%>images/guangda.png" align="middle" title="光大银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>  
                            <img src="<%=basePath%>images/cmb.png" align="middle" title="招商银行"/>  
                        </td>  
                    </tr>  
                </table>  
                  
                <table width="100%" cellpadding="0" cellspacing="0" style="margin-top: 30px">  
                    <tr align="center">  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="SPDB-NET-B2C"/>  
                            <img src="<%=basePath%>images/pf.png" align="middle" title="浦发银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="BCCB-NET-B2C"/>  
                            <img src="<%=basePath%>images/bj.png" align="middle" title="北京银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="CBHB-NET-B2C"/>  
                            <img src="<%=basePath%>images/zx.png" align="middle" title="中信银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="CIB-NET-B2C"/>  
                            <img src="<%=basePath%>images/cib.png" align="middle" title="兴业银行"/>  
                        </td>  
                    </tr>  
                </table>  
                  
                <table width="100%"  cellpadding="0" cellspacing="0" style="margin-top: 30px">  
                    <tr align="center">  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="CMBC-NET-B2C"/>  
                            <img src="<%=basePath%>images/ms.png" align="middle" title="民生银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>  
                            <img src="<%=basePath%>images/bcc.png" align="middle" title="交通银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="GDB-NET-B2C"/>  
                            <img src="<%=basePath%>images/guangfa.png" align="middle" title="广发银行"/>  
                        </td>  
                        <td>  
                            <input type="radio" name="pd_FrpId" value="HXB-NET-B2C"/>  
                            <img src="<%=basePath%>images/huaxia.png" align="middle" title="华夏银行"/>  
                        </td>  
                    </tr>  
                </table>  
            </form>  
            <div class="row line"></div>  
        </div>  
        <div class="container">  
            <div class="row">  
                <div class="submit_order">确认付款</div>  
            </div>  
        </div> 
  </body>
</html>
