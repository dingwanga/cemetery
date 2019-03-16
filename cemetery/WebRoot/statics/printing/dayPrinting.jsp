<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'monthPrinting.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	  
	  </style> 
  </head>
  
  <body>
     <div class="page_title">查询打印&gt;财务日报表打印 </div>
    <div class="button_bar">
	
	<button class="common_button"  type="submit">打印预览</button>
	
	</div>
	<form  method="post" action=" "> 

        <table class="query_form_table">
        <tr>
        <th></th><td></td><th></th><td></td><th></th><td></td>
        </tr>
		<tr>			
			<th>请输入统计日期</th>
			<td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;开始日期：
			<input name=" " value=" " size="9" style="height:23px" />---结束日期：
			<input name=" " value=" " size="9" style="height:23px"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="查询"/></td>
	    </tr>
	   
	    </table>
	  </form>
  </body>
</html>
