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
	  <script src="statics/js/jquery-2.1.4.min.js"></script>
	  <script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	
	
	     /*维护费年数设置  */
		   function AddWfnsDate() {
		     var startDateStr = $("#startDate").val();
		     var startDate = new Date(Date.parse(startDateStr.replace(/-/g,"/")));
		     var wfns = parseFloat($("#showWfns").val());
			 var endYear = startDate.getFullYear()+wfns;
			 var endMonth = startDate.getMonth()+1;
			 var endDay = startDate.getDate();
		     var endDateStr = endYear+"-"+endMonth+"-"+endDay;
		     $("#endDate").val(endDateStr);
		};
		
	     /* 维护费计算 */
		$(document).ready(function(){
		     wfhjCount = 0;
		     var wfhj = $("#wfhjId");
		    $("#showWfns").blur(function(){
		        var glf = $("#showGlf");
		        var showWfns = $("#showWfns").val();
		        var showGlf = $("#showGlf").val();
		        showGlfCount = parseFloat(showGlf);
		        showWfnsCount = parseFloat(showWfns);
		        wfhjCount =  showGlfCount * showWfnsCount;
		        wfhj.val(wfhjCount.toFixed(2));
		        AddWfnsDate();
			    });
		  }); 
		    
	</script>
</head>

<body>

    <div class="page_title">维护费管理&gt;维护费修改</div>
    <form  method="post" action="${pageContext.request.contextPath }/whfGetUpdate.html"> 
    <div class="button_bar">
	
	<button class="common_button" type="submit" >保存</button>
	
	</div>


       <table class="query_form_table">
	<tr>
		<th height="28">施工单编号</th>
		<td><input name="sgdbh" value="${whfUpdate.sgdbh }" size="10" style="height:19px;" readonly/></td>
		<th height="28">定墓日期</th>
		<td><input name="dmrq" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${whfUpdate.dmrq }" />"  size="10" style="height:19px;" readonly/></td>
		<th height="28">交费日期</th>
		<td>
			<input name="whskrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${whfUpdate.whskrq}" />" size="10" style="height:19px;" readonly/>
		</td>
	</tr>
	<tr>
		<th height="32">联系人姓名</th>
		<td>
			<input name="lxrxm"  value="${whfUpdate.lxrxm}" size="10" style="height:19px;" readonly/></td>
		<th height="32">联系电话</th>
		<td>
			<input name="lxrdh"  value="${whfUpdate.lxrdh}" size="10" style="height:19px;" readonly/>
		</td>
		<th height="32">联系地址</th>
		<td>
			<input name="lxrdz"  value="${whfUpdate.lxrdz}" size="18" style="height:19px;" readonly/>
		</td>
	</tr>
	<tr>
		<th height="32">邮政编码</th>
		<td>
			<input name="lxryb"  value="${whfUpdate.lxryb}" size="10" style="height:19px;" readonly/></td>
		<th height="32">来自区县</th>
		<td>
			<input name="ssmc"  value="${whfUpdate.ssmc}" size="2" style="height:19px;" readonly/>-<input name="qxmc"  value="${whfUpdate.qxmc}" size="2" style="height:19px;" readonly/>
		</td>
		<th height="32">墓区名称</th>
		<td><input name="mqmcId"  value="${whfUpdate.mqmcId}" size="10" style="height:19px;" readonly/></td>
	</tr>
	<tr>
		<th height="32">墓穴名称</th>
		<td><input name="mxmc"  value="${whfUpdate.mxmc}" size="10" style="height:19px;" readonly/></td>
		<th height="32">墓穴类别</th>
		<td><input name="mxlb"  value="${whfUpdate.mxlb}" size="10" style="height:19px;" readonly/></td>
		<th>维护收款日期</th>
		<td><input name="whskrq"   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${whfUpdate.whskrq}" />"  size="10" style="height:19px;" readonly/></td>
	</tr>
	<tr>
	    <th>维护费开始日期</th>
		<td><input name="wfksrq" id="startDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${whfUpdate.wfksrq}" />"  size="10" style="height:19px;" class="Wdate" type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
		 <th>维护年数</th>
		<td><input name="wfns" id="showWfns" value="${whfUpdate.wfns}" size="10" style="height:19px;"/></td>
	    <th>维护费结束日期</th>
		<td><input name="wfjsrq" id="endDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${whfUpdate.wfjsrq}" />"  size="10" style="height:19px;" class="Wdate" type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
	</tr>
	<tr>
	    <th>维护单价</th>
	    <c:choose>
	      <c:when test="${whfUpdate.mxlb==1}"><td><input name="glf1" id="showGlf" value="${whfUpdate.glf1}" size="10" style="height:19px;" readonly/></td></c:when>
	      <c:when test="${whfUpdate.mxlb==2}"><td><input name="glf2" id="showGlf" value="${whfUpdate.glf2}" size="10" style="height:19px;" readonly/></td></c:when>
	      <c:when test="${whfUpdate.mxlb==3}"><td><input name="glf3" id="showGlf" value="${whfUpdate.glf3}" size="10" style="height:19px;" readonly/></td></c:when>
	      <c:when test="${whfUpdate.mxlb==4}"><td><input name="glf4" id="showGlf" value="${whfUpdate.glf4}" size="10" style="height:19px;" readonly/></td></c:when>
	      <c:otherwise>${whfUpdate.glf}</c:otherwise>
	    </c:choose>
		
	    <th>维护合计</th>
		<td><input name="wfhj" id="wfhjId" value="${whfUpdate.wfhj}" size="10" style="height:19px;" readonly/></td>
		<th></th><td></td>
		 
	</tr>
</table>

        
</form>	
</body>
</html>		