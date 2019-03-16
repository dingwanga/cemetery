<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'addUser-add.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="<%=path%>/statics/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/statics/js/modifyPwd.js"></script>
<!--   <script src="statics/js/common.js"></script> -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/statics/css/modify_pwd.css">
<script type="text/javascript">
	
</script>
<style>
</style>

</head>

<body>
	<form method="post"
		action="${pageContext.request.contextPath }/login/modify.html ">
		<div class="modifyPass">
		    <p style="color:blue;">密码修改</p>
			<div class="first">

				

				<table class="tb">
					<tr>
						<th>用户名：</th>
						<td><input type="text" size="15" name="userName" id="userName"
							required oninvalid="setCustomValidity('用户名不能为空')"
							oninput="setCustomValidity('')" placeholder="请输入用户名" /><span
							class="red_star">*</span>
						</td>
					</tr>
					<tr>
						<th>原密码：</th>
						<td><input type="password" name="pass" size="20" id="oldPassWord" required
							oninvalid="setCustomValidity('原密码不能为空')"
							oninput="setCustomValidity('')" placeholder="请输入原密码" /><span
							class="red_star">*</span>
						</td>
					</tr>
					<tr>
						<th>新密码：</th>
						<td><input type="password" name="newPass" size="20" id="newPass" required
							oninvalid="setCustomValidity('新密码不能为空')"
							oninput="setCustomValidity('')" placeholder="请输入新密码"  /><span
							class="red_star">*</span>
						</td>
					</tr>
					<tr>
						<th>确认密码：</th>
						<td><input type="password" name="surePass" size="20" id="surePass" required
							oninvalid="setCustomValidity('确认密码不能为空')"
							oninput="setCustomValidity('')" placeholder="请输入确认密码" /><span
							class="red_star">*</span></td>
					</tr>

				</table>
				<div id="msg">
					<span style="color:red;" id="msg">${msg }</span>
				</div>
				<div class="bt">

					<button id="submit" class="submit">确定</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="calne" class="calne">取消</button>
				</div>

			</div>
		</div>
	</form>
</body>
</html>
