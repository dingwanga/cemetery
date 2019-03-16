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
	
  </head>
  
  <body>
     <form method="post" action="${pageContext.request.contextPath }/statics/xitong/address/getUpdateAddress.html">
	<div class="page_title">系统设置&gt;地址设置&gt;地址修改 </div>
	<div class="button_bar">
	    <button class="common_button"  type="submit" onClick="save('${pageContext.request.contextPath }/statics/xitong/address/address-list.html')">保存</button>
	</div>
	
	<table class="query_form_table">
	     <tr>
			<th>编号</th>
			<td><input name="id" value="${adList.id }" size="20" readonly/>
			</td>
		</tr>
		<tr>
			<th>省市</th>
			<td>
				<input name="ssmc" size="20" value="${adList.ssmc }"/><span class="red_star">*</span>
			</td>
		</tr>
		
		<tr>
			<th>区县</th>
			<td>
				<input name="qxmc" size="20" value="${adList.qxmc }"/><span class="red_star">*</span>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>
