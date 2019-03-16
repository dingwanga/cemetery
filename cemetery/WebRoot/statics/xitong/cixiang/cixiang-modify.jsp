<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="statics/css/style.css" rel="stylesheet" type="text/css">
	<script src="statics/js/common.js"></script>
	    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style>
    
   </style>
   
  </head>
  
  <body>
<form method="post" action="${pageContext.request.contextPath }/statics/xitong/cixiang/getUpdateCiXiang.html">
<div class="page_title">系统设置&gt;瓷像设置&gt;瓷像修改 </div>
<div class="button_bar">
	<button class="common_button"  type="submit" onClick="save('${pageContext.request.contextPath }/statics/xitong/cixiang/cixiang-list.html')">保存</button>  
</div>
<table class="query_form_table">
  <tr>
		<th>编号</th>
		<td><input name="id" value="${cx.id}" size="20" readonly/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>瓷像名称</th>
		<td>
		<input name="cxmc" value="${cx.cxmc}" size="20" /><span class="red_star">*</span></td>
	</tr>
	
	<tr>
		<th>瓷像单价</th>
		<td><input name="cxdj" value="${cx.cxdj}" size="20" /><span class="red_star">*</span></td>
	</tr>
	
</table>
</form>
</body>
</html>
