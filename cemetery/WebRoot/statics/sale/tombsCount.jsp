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
    
    <title>My JSP 'tombsCount.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	  <script src="statics/js/jquery-2.1.4.min.js"></script>
	 <script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>
	<style>
	 
	     html,body{
				overflow-x:hidden;
			}
			.data_list_table{
				width:100%;
			}
	  
	  </style> 

  </head>
  
  <body>
    <div class="page_title">销售统计&gt;墓穴统计</div>
	<form  method="post" action="${pageContext.request.contextPath }/muxueCalculate.html"> 

        <table class="query_form_table">
        <tr>
				<th>开始日期</th>
				<td><input name="syrqStart"  type="text" value="${syrqStart}" size="9" style="height:23px" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
				<th>结束日期</th>
				<td><input name="syrqEnd"  type="text" value="${syrqEnd}" size="9" style="height:23px" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
				<th><button class="common_button" type="submit">查询</button></th>
		         <td>&nbsp;</td>
			</tr>
		 
        </table>
     </br>
        <table class="data_list_table">
						<tr>
							<th>墓穴使用数</th>
							<th>定墓数</th>
							<th>空墓数</th>
							<th>墓穴总数</th>
						</tr>
						<tr class="" id="id">
							<td>${ryqkCount}</td>
							<td>${dmpbCount}</td>
							<td>${emptyMuxueCount}</td>
							<td>${mxgsNum}</td>
						</tr>
		</table>
	</form>
  </body>
</html>
