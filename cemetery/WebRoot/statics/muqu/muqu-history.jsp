<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'muqu-history.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>

  </head>
  
  <body>
       <div class="page_title">墓区管理&gt;墓区修改&gt;历史价格 </div>
       
       <table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><input name="" value="" type="hidden"></td>
		<th>墓区名称</th>
		<td><input name="" value="" /></td>
		<th>&nbsp;</th><td>&nbsp;</td>
	</tr>
	</table>
       <table class="data_list_table">
						<tr>
							<th>编号</th>
							<th>修改日期</th>
							<th>墓地费</th>
							<th>材料费</th>
							<th>落葬费</th>
							<th>绿化费</th>
							<th>维护费/年</th>
							<th>墓穴价格</th>
							<th>墓地费(单)</th>
							<th>材料费(单)</th>
							<th>落葬费(单)</th>
							<th>绿化费(单)</th>
							<th>维护费/年(单)</th>
							<th>墓穴价格(单)</th>
							<th>墓地费(双)</th>
							<th>材料费(双)</th>
							<th>落葬费(双)</th>
							<th>绿化费(双)</th>
							<th>维护费/年(双)</th>
							<th>墓穴价格(双)</th>
							<th>墓地费(三)</th>
							<th>材料费(三)</th>
							<th>落葬费(三)</th>
							<th>绿化费(三)</th>
							<th>维护费/年(三)</th>
							<th>墓穴价格(三)</th>
							<th>墓地费(四)</th>
							<th>材料费(四)</th>
							<th>落葬费(四)</th>
							<th>绿化费(四)</th>
							<th>维护费/年(四)</th>
							<th>墓穴价格(四)</th>
							
						</tr>
						<c:forEach items="${pageBean.pageList}" var="CX" varStatus="status">
							<tr class="" id="id">
								
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
                                    <td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
                                    <td>${CX.cxdj }</td>								
							</tr>
						</c:forEach>
			</table>	
  </body>
</html>
