<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'tombDecoration-list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="statics/css/style.css">
<script src="statics/js/common.js"></script>
<style>
	     a:link{text-decoration:none;color:blue}
	     a:hover{
	      color:red;
	     }
	     html,body{
			overflow-x:hidden;
		}
		.data_list_table{
			width:200%;
		}
</style>

</head>

<body>
	<div class="page_title">营销管理&gt;墓穴装修</div>
	<div class="button_bar">
		<button class="common_button" onclick="to('${pageContext.request.contextPath }/tombDecorationShowAdd.html');">新建</button>
	</div>
	<form method="post" action="${pageContext.request.contextPath }/tombDecoration-list.html">
		<table class="query_form_table">
			<tr>
				<th>请输入施工单编号</th>
				<td><input name="sgdbh" type="text" value="${sgdbh}" size="12"
					style="height:20px;" />
				</td>
				<th><button class="common_button" type="submit">查询</button>
				</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	<div style="overflow-x:auto;" >
	<table class="data_list_table">
		<tr>
			<th>施工单编号</th>
			<th>定墓日期</th>
			<th>联系人姓名</th>
			<th>联系人地址</th>
			<th>联系人电话</th>
			<th>墓区名称</th>
			<th>墓穴名称</th>
			<th>墓穴类别</th>
			<th>使用人姓名1</th>
			<th>使用人姓名2</th>
			<th>使用人姓名3</th>
			<th>使用人姓名4</th>
			<th>办理日期</th>
			<th>结账员</th>
			<th>刻字数</th>
			<th>刻字单价</th>
			<th>刻字费</th>
			<th>刻框数</th>
			<th>刻框单价</th>
			<th>刻框费</th>
			<th>瓷像类型</th>
			<th>瓷像数</th>
			<th>瓷像单价</th>
			<th>瓷像费</th>
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
			<th>交费合计</th>
			<th>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
		</tr>
		<c:forEach items="${pageBean.pageList }" var="mxzx">
			<tr class="" id="id">
				<td>${mxzx.sgdbh}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mxzx.dmrq}" type="date" /></td>
				<td>${mxzx.lxrxm }</td>
				<td>${mxzx.lxrdz }</td>
				<td>${mxzx.lxrdh }</td>
				<td>${mxzx.mqmcId }</td>
				<td>${mxzx.mxmc }</td>
				<td>${mxzx.mxlb }</td>
				<td>${mxzx.syrxm1 }</td>
				<td>${mxzx.syrxm2}</td>
				<td>${mxzx.syrxm3 }</td>
				<td>${mxzx.syrxm4 }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mxzx.zxblrq }" type="date" /></td>
				<td>${mxzx.jzy }</td>
				<td>${mxzx.kzx }</td>
				<td>${mxzx.kzxdj }</td>
				<td>${mxzx.kzf }</td>
				<td>${mxzx.kks }</td>
				<td>${mxzx.kkdj }</td>
				<td>${mxzx.kkf }</td>
				<td>${mxzx.cxmc }</td>
				<td>${mxzx.cxgs }</td>
				<td>${mxzx.cxdj }</td>
				<td>${mxzx.cxf }</td>
				<td>${mxzx.xiangmu1 }</td>
				<td>${mxzx.jine1 }</td>
				<td>${mxzx.xiangmu2 }</td>
				<td>${mxzx.jine2 }</td>
				<td>${mxzx.xiangmu3 }</td>
				<td>${mxzx.jine3 }</td>
				<td>${mxzx.xiangmu4 }</td>
				<td>${mxzx.jine4 }</td>
				<td>${mxzx.xiangmu5 }</td>
				<td>${mxzx.jine5 }</td>
				<td>${mxzx.xiangmu6 }</td>
				<td>${mxzx.jine6 }</td>
				<td>${mxzx.mxjfhj }</td>
				<td><a href="${pageContext.request.contextPath }/showUpdateTombDecoration.html?sgdbh=${mxzx.sgdbh}">修改</a>&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/deleteTombDecoration.html?sgdbh=${mxzx.sgdbh}">删除</a>&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/showTombDecorationDetail.html?sgdbh=${mxzx.sgdbh}">详情</a></td>
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

					<a href="tombDecoration-list.html?pageNo=1&sgdbh=${sgdbh}">首页</a>

					<c:choose>
						<c:when test="${pageBean.curPageNo-1 > 0}">
							<a
								href="tombDecoration-list.html?pageNo=${pageBean.curPageNo-1}&sgdbh=${sgdbh}">上一页</a>
						</c:when>
						<c:when test="${pageBean.curPageNo-1 <= 0}">
							<a href="tombDecoration-list.html?pageNo=1&sgdbh=${sgdbh}">上一页</a>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${pageBean.totalPage == 0}">
							<a
								href="tombDecoration-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh}">下一页</a>
						</c:when>
						<c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
							<a
								href="tombDecoration-list.html?pageNo=${pageBean.curPageNo+1}&sgdbh=${sgdbh}">下一页</a>
						</c:when>
						<c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
							<a
								href="tombDecoration-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh}">下一页</a>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${pageBean.totalPage==0}">
							<a
								href="tombDecoration-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh}"
								id="totalPage">尾页</a>
						</c:when>
						<c:otherwise>
							<a
								href="tombDecoration-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh}"
								id="totalPage">尾页</a>
						</c:otherwise>
					</c:choose>

					转到<input type="text" id="goPage" value="${pageBean.curPageNo}"
						size="1" />页
					<button width="20" onclick="reload();" type="submit">GO</button>
				</div>
			</th>
		</tr>
	</table>

</body>
</html>
