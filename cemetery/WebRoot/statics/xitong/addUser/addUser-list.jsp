<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	<style>
	 
	      a:link{text-decoration:none;color: blue}
	     a:hover{
	      color:red;
	     }
	     html,body{
			overflow-x:hidden;
		}
		.data_list_table{
			width:100%;
		}
	  </style> 
	 <!--  <script type="text/javascript">
	   function delcfm() {
	        if (!confirm("确认要删除？")) {
	            window.event.returnValue = false;
	        }
	    }
	  </script> -->
  </head>
  
  <body>
        <div class="page_title">系统设置&gt;用户详情</div>
	    <div class="button_bar">
		
		   <button class="common_button" onclick="to('${pageContext.request.contextPath }/statics/xitong/addUser/add-user.html');">新建</button>  
		
		</div>
	
	    <table class="data_list_table">
						<tr>
							<th>序号</th>
							<th>用户名</th>
							<th>密码</th>
							<th>权限</th>
							<th>结账员</th>
							<th>操作</th>
						</tr>
						
				<c:forEach items="${userList}" var="users" varStatus="s">
	                <tr class="" id="id">
	                    <td>${s.count}</td>
	                    <td>${users.user}</td>
	                    <td>${users.pass}</td>
	                    <td>${users.right}</td>
	                    <td>${users.jzy}</td>
	                   <td><a href="${pageContext.request.contextPath }/statics/xitong/addUser/delUser.html?id=${users.id}" onclick="javascript:delcfm()">删除</a></td>
	                    
	                </tr>
	             </c:forEach>
		</table>
	
  </body>
</html>
