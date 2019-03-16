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
			if(!/^[1-9]\d*$/.test(page)) {//对当前页码进行整数校验
				alert('请输入正确的页码！');
				return;
			}
			if(page > "${pageBean.totalPage}") {//判断当前页码是否大于最大页
				alert('请输入正确的页码！');
				return;

			} 
			window.location.href="<%=path %>/statics/xitong/basicData/basicData-list.html?pageNo="+page;
			
		}
	  </script>
</head>

<body>
    <div class="page_title">系统设置&gt;基础资料设置  </div>
    <div class="button_bar">
	<button class="common_button" onclick="to('${pageContext.request.contextPath }/statics/xitong/basicData/basicData-add.html')">新建</button>  
	</div>
   

				<table class="data_list_table">
						<tr>
							<th>序号</th>
							<th>墓区名称</th>
							<th>墓穴名称</th>
							<th>优惠项目</th>
							<th>批单编号</th>
							<th>优惠金额（元）</th>
							<th>审批人（元）</th>
							<th>审批日期</th>
							<th>操作</th>
							
						</tr>
						<c:forEach items="${pageBean.pageList}" var="basic" varStatus="status">
						<tr class="" id="id">
							<td>${status.index+1 }</td>
							<td>${basic.mqmcId}</td>
							<td>${basic.mxmc}</td>
							<c:choose>
							   <c:when test="${basic.taxPreferenceItems ==1 }">
									<td>镇政府</td>
								</c:when>
								<c:when test="${basic.taxPreferenceItems ==0 }">
									<td>本单位</td>
								</c:when>
							</c:choose>
							<td>${basic.batchNumber}</td>
							<td>${basic.discountAmount}</td>
							<td>${basic.approval}</td>
							<td>${basic.dateOfApproval}</td>
							<td>
							<a href="${pageContext.request.contextPath }/statics/xitong/basicData/basicData-update.html?mqmcId=${basic.mqmcId}&mxmc=${basic.mxmc}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath }/statics/xitong/basicData/basicData-del.html?mqmcId=${basic.mqmcId}&mxmc=${basic.mxmc}" onclick="delcfm()">删除</a>
							</td>
						</tr>
						</c:forEach> 
				<tr>
		           <th colspan="32" class="pager">
					<div class="pager">
					<input type="hidden" id="totalPageCount" value="${pageBean.totalPage}"/> 
						共${pageBean.totalCount}条记录&nbsp;&nbsp; 每页${pageBean.pageSize}条
						&nbsp;&nbsp;${pageBean.curPageNo}/${pageBean.totalPage}页&nbsp;&nbsp;
						
						<a href="statics/xitong/basicData/basicData-list.html?pageNo=1">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="statics/xitong/basicData/basicData-list.html?pageNo=${pageBean.curPageNo-1}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="statics/xitong/basicData/basicData-list.html?pageNo=1">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="statics/xitong/basicData/basicData-list.html?pageNo=${pageBean.curPageNo}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="statics/xitong/basicData/basicData-list.html?pageNo=${pageBean.curPageNo+1}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="statics/xitong/basicData/basicData-list.html?pageNo=${pageBean.totalPage}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="statics/xitong/basicData/basicData-list.html?pageNo=${pageBean.curPageNo}">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="statics/xitong/basicData/basicData-list.html?pageNo=${pageBean.totalPage}">尾页</a>
						   </c:otherwise>
						</c:choose>
						
						转到<input type="text" id="goPage" value="${pageBean.curPageNo}" size="1" />页
						<button width="20" onclick="reload();" type="submit">GO</button>
					</div>
		         </th>
		       </tr>
				</table>

</body>
</html>