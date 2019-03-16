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
    
    <title>My JSP 'tombDecorationPrinting.jsp' starting page</title>
    
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
	      html,body{
				overflow-x:hidden;
			}
			.data_list_table{
				width:100%;
			}
	  </style> 
  </head>
  
  <body>
     <div class="page_title">查询打印&gt;墓穴装修打印</div>
    <div class="button_bar">
	
	<button class="common_button" onclick="to('');">打印</button>  
	
	</div>
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
        <br>
        <table class="data_list_table">
						<tr>
							<th>序号</th>
							<th>日期</th>
							<th>区号</th>
							<th>穴位号</th>
							<th>申请人</th>
							<th>穴位姓名</th>
							<th>经办人</th>
							<th>装修内容</th>
							<th>照片</th>
							<th>金额</th>
							<th>完工日期</th>
							
						</tr>
						<tr class="" id="id">
							<td> 1</td>
							<td> xingming</td>
							<td> xingming</td>
							<td> name</td>
							<td> sexname</td>
							<td> 20160712</td>
							<td> phone1</td>
							<td> sexname</td>
							<td> 20160712</td>
							<td> phone1</td>
							<td> email</td>
						</tr>
						<tr>
		           <th colspan="32" class="pager">
					<div class="pager">
						共   条记录 每页<input value="10" size="2" />条
						第<input value="1" size="2"/>页/共5页
						<a href="#">第一页</a>
						<a href="#">上一页</a>
						<a href="#">下一页</a>
						<a href="#">最后一页</a>
						转到<input value="1" size="2" />页
						<button width="20" onclick="reload();">GO</button>
					</div>
		          </th>
	            </tr>
		</table>				
   </form>
  </body>
</html>
