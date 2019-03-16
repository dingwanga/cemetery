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
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:blue;
	     }
	
	  </style> 

  </head>
  
  <body>
     <div class="page_title">查询打印&gt;打印合同及证书</div>
    <div class="button_bar">
	<button class="common_button" onclick="to('');">打印预览</button>  
	</div>
	<form  method="post" action=" "> 

        <table class="query_form_table">
 
			 <tr>			
			<th>施工单编号</th>
			<td><input name=" " value=" " size="9" style="height:23px"/></td>
			<th>墓穴穴位号</th>
				<td><input name=" " value=" " size="9" style="height:23px"/></td>
				<th><input type="submit" value="查询"/></th><td></td>
				
	    </tr>
	     <tr>
	        <th>打印购销合同：</th>
			<td colspan="5"><a href="#"><button>购销合同</button></a></td>	
	    </tr>
	    
	    <tr>			
			<th>打印墓穴证书：</th>
			<td><a href="#"><button>第一页</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第二页</button></a></td>
			
			<td><a href="#"><button>第三页</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第四页</button></a></td>
			<td></td>
			<td></td>
			<td></td>
	    </tr>
	    <tr>			
			<th>维护费打印：</th>
			<td><a href="#"><button>第一次</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第二次</button></a></td>
			
			<td><a href="#"><button>第三次</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第四次</button></a></td>
			
			<td><a href="#"><button>第五次</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第六次</button></a></td>
			
			<td><a href="#"><button>第七次</button></a></td>
			<td></td>
			
	    </tr>
	    <tr>			
			<th>维护费存档打印：</th>
			<td><a href="#"><button>第一次</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第二次</button></a></td>
			
			<td><a href="#"><button>第三次</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第四次</button></a></td>
			
			<td><a href="#"><button>第五次</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><button>第六次</button></a></td>
			
			<td><a href="#"><button>第七次</button></a></td>
			<td></td>
			
	    </tr>
			
		</table>
		<br />
				
</form>
  </body>
</html>
