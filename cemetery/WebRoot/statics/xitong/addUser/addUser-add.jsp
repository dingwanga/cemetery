<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'addUser-add.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="<%=path%>/statics/js/jquery-2.1.4.min.js"></script>
     
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	  
	  </style>
  </head>
  <body>
    <form action="${pageContext.request.contextPath }/statics/xitong/addUser/users.html" method="post"> 
	     <div class="page_title">系统管理&gt;用户信息&gt;用户新增 </div>
	     <div class="button_bar">
		   <button id="submit" type="submit">保存</button>
		 </div>
        <table class="query_form_table">
           <tr>			
				<th>用户名</th>
				<td><input name="user" value="${user}" size="15" required oninvalid="setCustomValidity('用户名不能为空')" oninput="setCustomValidity('')"/>
				<span class="red_star">*</span></td>
				<th>密码</th>
				<td><input name="pass" value="${pass}" size="15" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('')"/><span class="red_star">*</span></td>
	        </tr>
	         <tr>			
				<th>用户权限</th>
				<td><select name="right" style="width:128px" required oninvalid="setCustomValidity('用户权限不能为空')" oninput="setCustomValidity('')">
				   <option value="${right}">请选择</option>
					
					<c:forEach var="use" items="${userslist}">
					 
					      <option value="${use.right}" 
						       
					       >${use.right}</option>
					
					</c:forEach>
				  
			</select><span class="red_star">*</span></td>
				<th>结账员</th>
				<td><input name="jzy" value="${jzy}" size="15" required oninvalid="setCustomValidity('结账员不能为空')" oninput="setCustomValidity('')"/>
				<span class="red_star">*</span></td>
	        </tr>
        </table>
    </form>
   
  </body>
</html>
