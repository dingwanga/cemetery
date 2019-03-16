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
	
	<%-- <script src="<%=path%>/statics/js/jquery-2.1.4.min.js"></script> --%>
	<script src="<%=path%>/statics/js/common.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  	<script>
		function save(){
     		var check = false;
     		var cxmc = document.getElementById("cxmc").value;
     		var cxdj = document.getElementById("cxdj").value;
     		if(cxmc!="" && cxdj!=""){
     			alert('保存成功！');
     			check = true;
     		}else{
     			check = false;
     		}
     	}
            
	</script>
  </head>
  
  <body>
<form method="post" action="${pageContext.request.contextPath }/statics/xitong/cixiang/getCiXiang.html">
<div class="page_title">系统设置&gt;瓷像设置&gt;瓷像新建 </div>
<div class="button_bar">
	
	<button class="common_button"  type="submit"  onClick="save()">保存</button>  
</div>
<table class="query_form_table">
	<tr>
		
		
		<th>瓷像名称</th>
		<td>
			<input id="cxmc" name="cxmc"  size="20"  type="text"  required oninvalid="setCustomValidity('瓷像名称不能为空')" oninput="setCustomValidity('')"/><span class="red_star">*</span></td>
	</tr>
	
	<tr>
		
		
		<th>瓷像单价</th>
		<td>
			<input id="cxdj" name="cxdj"  size="20" type="text" required oninvalid="setCustomValidity('瓷像单价不能为空')" oninput="setCustomValidity('')"/><span class="red_star">*</span></td>
	</tr>
	
</table>
</form>
</body>
</html>
