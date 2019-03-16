<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>天马山公墓管理系统登录页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/statics/css/login.css">
	<script type="text/javascript" src="<%=path %>/statics/js/login.js"></script>
  </head>
 
  
  <body>
   <form action="login/doLoginInto.html" method="post">
   <div class="login">
         <div class="first">
             <div id="p"> 上海天马山公墓信息管理系统</div>
             <hr align="center" width="100%" color="#ccc" size="1"/>
            
             <div class="second">
                <div style="color:red;">${msg }</div>
                     <table>
                         
                         <tr>
                             <td>用户名：</td>
                             <td><input type="text" size="15" name="user" required oninvalid="setCustomValidity('用户名不能为空！')" oninput="setCustomValidity('')" /></td>
                         </tr>

                         <tr>
                             <td>密 &nbsp; &nbsp码：</td>
                             <td><input type="password" size="15" name="pass" required oninvalid="setCustomValidity('密码不能为空！')" oninput="setCustomValidity('')"/></td>
                         	 <td><a href="<%=path%>/statics/modifyPass.jsp">&nbsp;&nbsp;&nbsp;&nbsp;修改密码</a> </td>
                         </tr>
                         <tr>
                             <td></td>
                             <td>
                                 <input type="submit" value="登录" class="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <input type="submit" value="取消" class="cancle">
                             </td>
                         </tr>
                          
                     </table>
             </div>
         </div>
       </div>
       </form>
  </body>
</html>
