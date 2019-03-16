<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	  <script src="<%=path %>/statics/js/common.js"></script>
	<style>
	 
	      a:link{text-decoration:none;color: blue}
	     a:hover{
	      color:red;
	     }
	     
	     .button{
	       margin-top:20px;
	       margin-left:50%;
	       padding:8px 10px;
	       font-size:16px;
	     }
	      html,body{
			overflow-x:hidden;
		}
		.data_list_table{
			width:100%;
		}
	  
	  </style> 
	   <script type="text/javascript">
	  	function reload(){
			var page = document.getElementById("goPage").value;
			/* var totalPage = document.getElementById("totalPage").value; */
			if(!/^[1-9]\d*$/.test(page)) {//对当前页码进行整数校验
				alert('请输入正确的页码！');
				return;
			}
			if(page > "${pageBean.totalPage}") {//判断当前页码是否大于最大页
				alert('请输入正确的页码！');
				return;

			} 
			window.location.href="<%=path %>/statics/xitong/cixiang/cixiang-list.html?pageNo="+page;
		}
	  </script>
</head>
<body>
<%-- <form  method="post" action="${pageContext.request.contextPath }/statics/xitong/cixiang/cixiang-list.html"> --%>
   <div class="page_title">系统设置&gt;瓷像设置  </div>
    <div class="button_bar">
	
	<button class="common_button" onclick="to('${pageContext.request.contextPath }/statics/xitong/cixiang/cixiang-add.html')">新建</button>  
	
	</div>

				<table class="data_list_table">
						<tr>
							<th>编号</th>
							<th>瓷像名称</th>
							<th>瓷像单价</th>
							<th>操作</th>
							
						</tr>
						<c:forEach items="${pageBean.pageList}" var="CX" varStatus="status">
							<tr class="" id="id">
								
									<td>${CX.id }</td>
									<td>${CX.cxmc }</td>
									<td>${CX.cxdj }</td>
									<td>
									<a href="${pageContext.request.contextPath }/statics/xitong/cixiang/cixiang-update.html?id=${CX.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath }/statics/xitong/cixiang/cixiang-del.html?id=${CX.id}" onclick="delcfm()">删除</a>
									</td>
								
							</tr>
						</c:forEach>
						
				<tr>
		           <th colspan="32" class="pager">
					<div class="pager">
					<input type="hidden" id="totalPageCount" value="${pageBean.totalPage}"/> 
						共${pageBean.totalCount}条记录&nbsp;&nbsp; 每页${pageBean.pageSize}条
						&nbsp;&nbsp;${pageBean.curPageNo}/${pageBean.totalPage}页&nbsp;&nbsp;
						
						<a href="statics/xitong/cixiang/cixiang-list.html?pageNo=1">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="statics/xitong/cixiang/cixiang-list.html?pageNo=${pageBean.curPageNo-1}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="statics/xitong/cixiang/cixiang-list.html?pageNo=1">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="statics/xitong/cixiang/cixiang-list.html?pageNo=${pageBean.curPageNo}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="statics/xitong/cixiang/cixiang-list.html?pageNo=${pageBean.curPageNo+1}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="statics/xitong/cixiang/cixiang-list.html?pageNo=${pageBean.totalPage}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="statics/xitong/cixiang/cixiang-list.html?pageNo=${pageBean.curPageNo}">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="statics/xitong/cixiang/cixiang-list.html?pageNo=${pageBean.totalPage}">尾页</a>
						   </c:otherwise>
						</c:choose>
						
						转到<input type="text" id="goPage" value="${pageBean.curPageNo}" size="1" />页
						<button width="20" onclick="reload();" type="submit">GO</button>
					</div>
		         </th>
		       </tr>
			</table>	
<!-- </form> -->
</body>
</html>