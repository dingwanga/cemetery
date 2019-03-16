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
    
    <title>My JSP 'engravedPorcelainCount.jsp' starting page</title>
    
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
     <script type="text/javascript">
         $(document).ready(function () {
    	$("#zxblrqEnd").blur(function () {
    		if($("#jzskrqStart").val()==""||$("#jzskrqStart").val()==null){
    			alert("请输入开始日期！");
    			return;
    		}
    	 });
     });
     </script>
  </head>
  
  <body>
     <div class="page_title">销售统计&gt;刻字瓷像统计</div>
   <!--  <div class="button_bar">
	
	<button class="common_button" onclick="to('');">打印</button>  
	
	</div> -->
	<form  method="post" action="${pageContext.request.contextPath }/showKzcx.html"> 

        <table class="query_form_table">
        <tr>
				<th>开始日期</th>
				<td><input name="jzskrqStart" id="jzskrqStart" type="text" value="${jzskrqStart }" size="9" style="height:23px" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
				<th>结束日期</th>
				<td><input name="zxblrqEnd" id="zxblrqEnd" type="text" value="${zxblrqEnd }" size="9" style="height:23px" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
				<th><button class="common_button" type="submit">查询</button></th>
		         <td>&nbsp;</td>
			</tr>
        </table>
        </form>
        </br>
        <table class="data_list_table">
						<tr>
							<th>刻字数</th>
							<th>刻字总价</th>
							<th>刻框数</th>
						<!-- 	<th>刻框单价</th> -->
							<th>刻框总价</th>
							<th>瓷像数</th>
							<th>瓷像总价</th>
						</tr>
						
						<tr class="" id="id">
							<td>${kzcx.kzxSum }</td>
							<td>${kzcx.kzfSum }</td>
							<td>${kzcx.kksSum }</td>
						<%-- 	<td>${kzcx.kkdj }</td> --%>
							<td>${kzcx.kkfSum }</td>
							<td>${kzcx.cxgsSum }</td>
							<td>${kzcx.cxfSum }</td>
							
						</tr>
		</table>				
   
  </body>
</html>
