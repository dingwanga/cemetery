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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="statics/css/style.css" rel="stylesheet" type="text/css">
	<script src="statics/js/common.js"></script>
	    
   <style>
    
   </style>
  </head>
  
  <body>
 <form action="${pageContext.request.contextPath }/statics/xitong/user/updateUse.html" method="post">
<div class="page_title">系统设置&gt;用户信息</div>
<div class="button_bar">
	
	<button class="common_button"  type="submit" >保存</button>  
</div>
<table class="query_form_table">
		<c:forEach items="${unitList}" var="unit">
		  <tr>
			<th>单位名称</th>
			<td>
			<input name="units" value="${unit.units }" size="40" /><span class="red_star">*</span>
			<input name="id"  id="id" value="${unit.id}" type="hidden">
			</td>
		</tr>
		
		<tr>
			<th>地址</th>
			<td><input name="dz" value="${unit.dz }" size="40" /><span class="red_star">*</span></td>
		</tr>
		<tr>
			
			<th>电话</th>
			<td><input name="dh" value="${unit.dh }" size="40" /><span class="red_star">*</span></td>
		</tr>
		</c:forEach>
	
</table>
</form>
</body>
</html>
