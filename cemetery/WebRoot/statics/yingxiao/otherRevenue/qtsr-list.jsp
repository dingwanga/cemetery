<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'qtsr-list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	<style>
	 
	     a:link{text-decoration:none;color: blue}
	     a:hover{
	      color:red;
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
    <div class="page_title">营销管理&gt;其他收入</div>
    <div class="button_bar">
	<button class="common_button" onclick="to('${pageContext.request.contextPath }/qtsrGetAdd.html');">新建</button> 
	</div>
	    <div style="overflow-x:auto;" >
	   <table class="data_list_table">
						<tr>
							<th>编号</th>
							<th>交费日期</th>
							<th>项目1</th>
							<th>金额1</th>
							<th>项目2</th>
							<th>金额2</th>
							<th>项目3</th>
							<th>金额3</th>
							<th>项目4</th>
							<th>金额4</th>
							<th>项目5</th>
							<th>金额5</th>
							<th>项目6</th>
							<th>金额6</th>
							<th>项目7</th>
							<th>金额7</th>
							<th>项目8</th>
							<th>金额8</th>
							<th>收入合计</th>
							<th>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
						</tr>
						<c:forEach items="${pageBean.pageList}" var="qt">
						<tr class="" id="id">
							<td>${qt.id}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qt.qtjfrq}" type="date" /></td>
							<td>${qt.xm1}</td>
							<td>${qt.je1}</td>
							<td>${qt.xm2}</td>
							<td>${qt.je2}</td>
							<td>${qt.xm3}</td>
							<td>${qt.je3}</td>
							<td>${qt.xm4}</td>
							<td>${qt.je4}</td>
							<td>${qt.xm5}</td>
							<td>${qt.je5}</td>
							<td>${qt.xm6}</td>
							<td>${qt.je6}</td>
							<td>${qt.xm7}</td>
							<td>${qt.je7}</td>
							<td>${qt.xm8}</td>
							<td>${qt.je8}</td>
							<td>${qt.qtsrhj}</td>
							<td>
							<a href="${pageContext.request.contextPath }/qtsrGetUpdate.html?id=${qt.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath }/qtsrDel.html?id=${qt.id}" onclick="delcfm()">删除</a>
                            </td>
						</tr>
						</c:forEach>
					</table>
					</div>
					<table class="data_list_table" style="width:100%;">	
					<tr>
		             <th colspan="45" class="pager">
					 <div class="pager">
						共${pageBean.totalCount}条记录&nbsp;&nbsp; 每页${pageBean.pageSize}条
						&nbsp;&nbsp;${pageBean.curPageNo}/${pageBean.totalPage}页&nbsp;&nbsp;
						
						<a href="qtsr-list.html?pageNo=1">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="qtsr-list.html?pageNo=${pageBean.curPageNo-1}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="qtsr-list.html?pageNo=1">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="qtsr-list.html?pageNo=${pageBean.curPageNo}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="qtsr-list.html?pageNo=${pageBean.curPageNo+1}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="qtsr-list.html?pageNo=${pageBean.totalPage}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="qtsr-list.html?pageNo=${pageBean.curPageNo}" id="totalPage">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="qtsr-list.html?pageNo=${pageBean.totalPage}" id="totalPage">尾页</a>
						   </c:otherwise>
						</c:choose>
						
						转到<input type="text" id="goPage" value="${pageBean.curPageNo}" size="1"/>页
						<button width="20" onclick="reload();" type="submit">GO</button>
					</div>
		         </th>
		       </tr>
				</table>
			
  </body>
</html>
