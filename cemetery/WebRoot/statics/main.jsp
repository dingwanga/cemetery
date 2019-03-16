
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/statics/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>tianmu</title>

</head>


<frameset rows="10%,*,8%" cols="*" frameborder="1" framespacing="1">
		<frame src="../statics/top.jsp" name="top">
		</frame>
		<frameset cols="15%,*" rows="*" frameborder="no">
			<frame src="../statics/left.jsp" name="left">
			</frame>
			<frame src="<%=path %>/statics/jsp/home.jsp" name="rightFrame"> <!-- 重点看这里 -->
			</frame>
		</frameset>
		<frame src="../statics/buttom.jsp" name="buttom">
		</frame> 

</frameset>
<noframes>
<body>
	
</body>
</noframes>

</html>