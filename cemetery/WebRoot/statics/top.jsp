<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
     <style>  
     body{
        /* background:chartreuse; */
        background-color:#337ab7;
        margin:0;
        padding:0;
     }
     .top .big-title{
     	text-shadow: 5px 5px 5px #FF0000;
    	/* font-style: italic; */
	    font-size: 50px;
	    font-family:FZShuTi;
	    color: white;
	    margin-left: 20px;
	    width: 80%;
	    height:50%
     }
     .top .img-tianma img{
     	height: 100%;
        float: left;
        border-radius:50%;
     } 
    .other{
        text-align: right;
	    width: 26%;
	    float: right;
	    margin-right: 50px;
	    height:50%
    }
       
    a{
       text-decoration:none;
       padding-left:30px;
       color:red;
      
     }
     
     .second{
       padding-left:70%;
       padding-bottom:30px;
       color:red;
       font-size: 20px;
     }
     a:hover{
        color:#ff00ff;
     }
     
    .unit{
       float: right;
	    margin-top: 18px;
	    font-size:12px;
	   
    }
     </style>
       <script language="javascript">
        function exit(){
        window.open('login.jsp','_top')
          } 
       </script>
  </head>
  
  <body style="overflow-y:hidden">
     <div class="top">
        <div class="img-tianma">
        	<img alt="天马山" src="<%=path %>/statics/images/826674613288436513.jpg">
        </div>
        <div class="big-title">
          <span>&nbsp;&nbsp;&nbsp;&nbsp;上&nbsp;&nbsp;海&nbsp;&nbsp;天&nbsp;&nbsp;马&nbsp;&nbsp;山&nbsp;&nbsp;公&nbsp;&nbsp;墓</span>
        </div>
        <div class="other">
        	<span>欢迎您：${userLogin.user} <a href="/loginout.html" onclick="exit();">退出登录</a></span>
        </div>
        <%--  <div class="unit">
           <span>单位名称：${unitList.units}&nbsp;&nbsp;地址：${unitList.dz}&nbsp;&nbsp;电话：${unitList.dh}</span>
        </div> --%>
     </div>
  </body>
</html>
