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
    
    <title>My JSP 'maintainPrinting.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="../../statics/css/style.css">
	  <script src="../../statics/js/common.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	  
	  </style> 

  </head>
  
  <body>
     <div class="page_title">查询打印&gt;维护费打印</div>
    <div class="button_bar">
	<button class="common_button" onclick="to('');">打印预览</button>  
	</div>
	<form  method="post" action=" "> 

        <table class="query_form_table">
 
			 <tr>			
			<th>施工单编号</th>
			<td><input name=" " value=" " size="20" /><span class="red_star">*</span></td>
			<th><input type="submit" value="查询"/></th>
				<td>&nbsp;</td>
				<th>墓穴位置</th><td><input name=" " value=" " readonly size="20" /><span class="red_star">*</span></td>
	    </tr>
	     <tr>
	        <th>申请人姓名</th>
			<td><input name=" " value=" " readonly size="20" /><span class="red_star">*</span></td>			
			<th>联系电话</th>
			<td><input name=" " value=" " readonly size="20" /><span class="red_star">*</span></td>
			<th>联系地址</th>
			<td><input name=" " value=" " readonly size="20" /><span class="red_star">*</span></td>
	    </tr>
	    
	    <tr>			
			<th>穴位姓名</th>
			<td>
			<input name=" " value=" " readonly size="15" />-<input name=" " value=" " readonly size="5" /></td>
			<th><input name=" " value=" " readonly size="15" />-<input name=" " value=" " readonly size="5" /></th>
			
			<td><input name=" " value=" " readonly size="15" />-<input name=" " value=" " readonly size="5" /></td>
			
			<th><input name=" " value=" " readonly size="15" />-<input name=" " value=" " readonly size="5" /></th>
			
			<td>&nbsp;</td>
	    </tr>
			
		</table>
		<br />
				<table class="data_list_table">
						<tr>
							<th>起止日期</th>
							<th>年数</th>
							<th>穴数</th>
							<th>金额（元）</th>
							<th>收款日期</th>
							
						</tr>
						<tr class="" id="id">
							<td> statusName</td>
							<td> 20180923</td>
							<td> xingming</td>
							<td> xingming</td>
							<td> xingming</td>
						</tr>
						
				</table>
</form>
  </body>
</html>
