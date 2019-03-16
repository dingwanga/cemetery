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
    
    <title>My JSP 'appliedDetails .jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	  
	  </style> 
  </head>
  
  <body>
     <div class="page_title">销售统计&gt;销售落葬统计</div>
   
	<form  method="post" action=" "> 

        <table class="query_form_table">
        <tr>
				<th>开始日期</th>
				<td><input name=" " type="text" value=" " size="9" style="height:23px"/></td>
				<th>结束日期</th>
				<td><input name=" " type="text" value=" " size="9" style="height:23px"/></td>
				<th><input type="submit" value="查询"/></th>
		         <td>&nbsp;</td>
			</tr>
        </table>
         </br>
        
      <table class="query_form_table"> 

			  <tr> 
			    <th rowspan="2">出售墓穴总数：</th><td rowspan="2"><input name=" " type="text" value=" " size="5" style="height:23px"/>(穴)</td> 
			    <th>墓穴：</th><td><input name=" " type="text" value=" " size="5" style="height:23px"/>(穴)</td>
			    <th></th><td>&nbsp;</td>
			  </tr> 
			  <tr> 
			    <th>寿墓：</th><td><input name=" " type="text" value=" " size="5" style="height:23px"/>(座)</td>
			    <th></th><td>&nbsp;</td>
			  </tr>
		 </table>
		 <br>
		 <table class="query_form_table"> 	  
			   <tr> 
			    
			    <th>清明落葬数：</th>
			    <td><input name=" " type="text" value=" " size="5" style="height:23px"/>(座)</td>
			    
			    <th>冬至落葬数：</th><td><input name=" " type="text" value=" " size="5" style="height:23px"/>(座)</td>
			    <th></th><td>&nbsp;</td>
			  </tr>
			  
      </table>
        		
   </form>
  </body>
</html>
