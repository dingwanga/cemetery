<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" >
<head>
   <base href="<%=basePath%>">
  <meta charset="UTF-8">
  <title>jQuery/CSS3 3D Tab菜单选项卡插件DEMO演示</title>
	  <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	  <script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	  
	  </style> 
</head>

<body>

    <div class="page_title">定墓管理&gt;定墓修改</div>
    <form  method="post" action="${pageContext.request.contextPath }/DingmuUpdate.html">  
    <div class="button_bar">
	
	<button class="common_button"  type="submit"  onClick="save('${pageContext.request.contextPath }/dingmu-list.html')">保存</button>
	</div>


       <table class="query_form_table">
	<tr>
		<th height="28">墓区名称</th>
		<td><input name="mqmcId" value="${dm.mqmcId}" readonly size="10" style="height:18px"/></td>
		<th height="28">墓穴名称</th>
		<td><input name="mxmc" value="${dm.mxmc }" readonly size="10" style="height:18px"/></td>
		<th height="28">墓穴类别</th>
		<td>
		    <input name="mxid"  value="${dm.mxid }" type="hidden"/>
			<input name="mxlb" value="${dm.mxlb }" readonly size="10" style="height:18px"/>
		</td>
	</tr>
	<tr>
		<th height="32">申请人姓名</th>
		<td>
			<input name="sqrxm"  value="${dm.sqrxm}" size="10" style="height:18px"/></td>
		<th height="32">申请人电话</th>
		<td>
			<input name="lxdh"  value="${dm.lxdh}" size="10" style="height:18px"/>
		</td>
		<th height="32">申请人地址</th>
		<td>
			<input name="lxdz"  value="${dm.lxdz}" size="10" style="height:18px"/>
		</td>
	</tr>
	<tr>
		<th height="32">定墓金额</th>
		<td>
			<input name="qmje"  value="${dm.qmje}" size="10" style="height:18px"/></td>
		<th height="32">定墓日期</th>
		<td>
			<input name="dmrq" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dm.dmrq }" />" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10"/>
		</td>
		<th height="32">业务员</th>
		<td>
			 <select name="jzyId" style="width:93px;height:18px;" id="jzyId">
						<c:forEach var="ul" items="${userList }">
							<option value="${ul.id}"
								<c:if test="${user == ul.user}">
						          selected=selected
						       </c:if>>${ul.user
								}</option>
						</c:forEach>
				</select>
				

							

						
	   </td>
	</tr>            
	<tr>
		
		<th height="32">预付收款日期</th>
		<td>
			<input name="dmskrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dm.dmskrq }"/>" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10"/>
		</td>
		<th>&nbsp;</th>
		<td>&nbsp;</td>
		<th>&nbsp;</th>
		<td>&nbsp;</td>
	</tr>
	<tr>
	<tr>
		<th>备注</th>
		<td colspan="5"><textarea rows="6" cols="39" name="bz" >${dm.bz}</textarea></td>
	</tr>
</table>

        
</form>	
</body>
</html>		