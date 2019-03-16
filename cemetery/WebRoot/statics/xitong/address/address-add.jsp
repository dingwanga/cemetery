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
	
	<!-- <script src="statics/js/common.js"></script> -->
	 
	  
	    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="statics/css/style.css" rel="stylesheet" type="text/css">
	 <script src="<%=path%>/statics/js/jquery-2.1.4.min.js"></script>
    <!--  <script src="statics/js/common.js"></script> -->
     <script>
     	function save(){
     		var check = false;
     		var ssmc = document.getElementById("ssmc").value;
     		var qxmc = document.getElementById("qxmc").value;
     		if(ssmc!="" && qxmc!=""){
     			alert('保存成功！');
     			check = true;
     		}else{
     			check = false;
     		}
     	}
     </script>
  </head>
  
  <body>
<form method="post" action="${pageContext.request.contextPath }/statics/xitong/address/getAddress.html">
	<div class="page_title">系统设置&gt;地址设置&gt;地址新建 </div>
	<div class="button_bar">
      <button class="common_button"  type="submit" onClick="save()">保存</button>   
	</div>
	<table class="query_form_table">
	
		<tr>
			<th>省市</th>
			<td>
				<input id="ssmc" name="ssmc" size="20" required oninvalid="setCustomValidity('省市名不能为空')" oninput="setCustomValidity('')"/>
				<span class="red_star">*</span>
			</td>
		</tr>
		
		<tr>
			<th>区县</th>
			<td>
				<input id="qxmc" name="qxmc" size="20" required oninvalid="setCustomValidity('区县名不能为空')" oninput="setCustomValidity('')"/>
				<span class="red_star">*</span>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>
