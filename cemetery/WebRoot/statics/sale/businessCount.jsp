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
    
    <title>My JSP 'businessCount.jsp' starting page</title>
    
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
     <div class="page_title">销售统计&gt;业务统计</div>
   
	<form  method="post" action="${pageContext.request.contextPath }/showBusinessCount.html"> 
        <table class="query_form_table">
        <tr>
				<th>开始日期</th>
				<td><input name="syrqStart"  type="text"  value="${syrqStart}" size="9" style="height:23px" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
				<th>结束日期</th>
				<td><input name="syrqEnd" type="text" value="${syrqEnd}" size="9" style="height:23px" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
				<th><input type="submit" value="查询"/></th>
		         <td>&nbsp;</td>
			</tr>
        </table>
    
        <br>
        <table class="data_list_table">
						<tr>
							<th>序号</th>
							<th>结账员</th>
							<th>业务员</th>
							<th>墓区名称</th>
							<th>墓穴数</th>
							<th>墓数</th>
							<th>总墓地费</th>
							<th>预付金额</th>
							<th>交费金额</th>
							<th>补交金额</th>
							<th>交费合计</th>
							
						</tr>
					<c:forEach var="business" items="${businessCounts }" varStatus="status">
						<tr class="" id="id">
							<td>${status.index + 1}</td>
							<td>${business.jzy }</td>
							<td>${business.user }</td>
							<td>${business.mqmc }</td>
							<td>${business.mxlb }</td>
							<td>${business.mxmc }</td>
							<td>${business.mdfTotal }</td>
							<td>${business.qmje }</td>
							<td>${business.jfje }</td>
							<td>${business.bjje }</td>
							<td>${business.qmje + business.jfje}</td>
						</tr>
						<tr>
					</c:forEach>
		           <th colspan="45" class="pager">
					<div class="pager">
						共${pageBean.totalCount}条记录&nbsp;&nbsp; 每页${pageBean.pageSize}条
						&nbsp;&nbsp;${pageBean.curPageNo}/${pageBean.totalPage}页&nbsp;&nbsp;
						
						<a href="showBusinessCount.html?pageNo=1">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="showBusinessCount.html?pageNo=${pageBean.curPageNo-1}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="showBusinessCount.html?pageNo=1">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="showBusinessCount.html?pageNo=${pageBean.curPageNo}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="showBusinessCount.html?pageNo=${pageBean.curPageNo+1}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="showBusinessCount.html?pageNo=${pageBean.totalPage}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="showBusinessCount.html?pageNo=${pageBean.curPageNo}" id="totalPage">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="showBusinessCount.html?pageNo=${pageBean.totalPage}" id="totalPage">尾页</a>
						   </c:otherwise>
						</c:choose>
						
						转到<input type="text" id="goPage" value="${pageBean.curPageNo}" size="1"/>页
						<button width="20" onclick="reload();" type="submit">GO</button>
					</div>
		         </th>
		       </tr>
		</table>				
   </form>
  </body>
</html>
