<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'muxuePicture.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	<script src="statics/js/common.js"></script>
	<script src="statics/js/jquery-2.1.4.min.js"></script>

  </head>
  
  <body>
     <div class="page_title">销售统计&gt;墓穴使用情况图</div>
   <!--  <div class="button_bar">
	
	<button class="common_button" onclick="to('');">打印</button>  
	
	</div> -->
	<form  method="post" name="from"  action=""> 
        <table class="query_form_table">
 
			<tr>
				<th>请输入墓区名称：</th>
				<td>
				<select name="mqmc" style="width:100px" >
				    <option value="" ${mqmc == '--请选择--' ? "selected=\"selected\"":"" }>--请选择--</option>
					<c:forEach var="mq" items="${muquList}">
					      <option value="${mq.mqmc}"
						       <c:if test="${mqmc == mq.mqmc}">
						          selected=selected
						       </c:if>
					       >${mq.mqmc}</option>
					</c:forEach>
			</select></td>
				<th><button class="common_button"  type="submit">查询</button></th>
		        <td>&nbsp;</td>
				
			</tr>
		</table>
</form>

  </body>
</html>
