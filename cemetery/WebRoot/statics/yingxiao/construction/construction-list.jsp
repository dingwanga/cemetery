<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'construction-list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="statics/css/style.css">
<script src="statics/js/common.js"></script>
<script src="statics/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	<%-- $(document).ready(function(){
	     var i = 1;
         $("#searchSGDNo").click(function(){
         	 document.form1.action="<%=path%>/construction-list.html";
	         document.form1.submit();
             i++;
         	var myDate = new Date();
         	var year=myDate.getFullYear();
			//获取当前月
			var month=myDate.getMonth()+1;
			//获取当前日
			var date=myDate.getDate();
			var constructionNum =year+p(month)+p(date)+i;
			var isExist = $("#isExist").val();
            if(isExist=='true')	{
                $("#sgdNum").val(constructionNum);
            }else{
               alert("施工单编号不存在！");
               return false;
            };		
      });
    });
    
   function p(s) {
      return s < 10 ? '0' + s: s;
   } --%>
   function addConstruction(){
   		document.form1.action="<%=path%>/constructionAddShow.html";
	    document.form1.submit();
   }
</script>
<style>
         a:link{text-decoration:none;color: blue}
	     a:hover{
	      color:red;
	     }
		html,body{
			overflow-x:hidden;
		}
		.data_list_table{
			width:250%;
		}
</style>
</head>

<body>
    
    <%-- <input name="sgdbh" id="sgdNum" value="${newSGDNo}" size="12" style="height:19px;"/> --%>
	<div class="page_title">营销管理&gt;施工单详情</div>
	<div class="button_bar">
		<button class="common_button" onclick="addConstruction();">新建</button>
	</div>
	<form  method="post"  name="form1" > 
	<table class="query_form_table">

		<tr>
			<th>请输入施工单编号</th>
			<td><input name="sgdbh" id="sgdbh" value="${sgdbh }" type="text"  size="10" />
			</td>
			<th><button class="common_button" type="submit">查询</button>
			</th>
			<td></td>
			<th></th>
			<td></td>
		</tr>
	</table>
    
	<br />
	<div style="overflow-x:auto;" > 
		<table class="data_list_table">
			<tr>
				<th>施工单编号</th>
				<th>联系人姓名</th>
				<th>联系人住址单位</th>
				<th>联系电话</th>
				<th>邮政编码</th>
				<th>来自区县</th>
				<th>墓区名称</th>
				<th>墓穴名称</th>
				<th>墓穴类别</th>
				<th>预约落葬日期</th>
				<th>墓证费</th>
				<th>墓地费</th>
				<th>材料费</th>
				<th>落葬费</th>
				<th>绿化费</th>
				<th>小计</th>
				<th>刻字字数</th>
				<th>刻字单价</th>
				<th>刻字费</th>
				<th>附件费1</th>
				<th>附件费2</th>
				<th>附件费3</th>
				<th>附件费4</th>
				<th>维护开始日期</th>
				<th>维护结束日期</th>
				<th>维护年数</th>
				<th>维护单价</th>
				<th>维护合计</th>
				<th>应收合计</th>
				<th>预付日期</th>
				<th>预付金额</th>
				<th>欠费合计</th>
				<th>使用姓名1</th>
				<th>使用1情况</th>
				<th>使用姓名2</th>
				<th>使用2情况</th>
				<th>使用姓名3</th>
				<th>使用3情况</th>
				<th>使用姓名4</th>
				<th>使用4情况</th>
				<th>收照日期</th>
				<th>业务员</th>
				<th>结账员</th>
				<th>结账收款日期</th>
				<th>附加收款日期</th>
				<th>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
			</tr>
			<c:forEach items="${pageBean.pageList }" var="sgd" varStatus="status">
				<tr class="" id="id">
					<td>${sgd.sgdbh}</td>
					<td>${sgd.lxrxm}</td>
					<td>${sgd.lxrdz}</td>
					<td>${sgd.lxrdh}</td>
					<td>${sgd.lxryb}</td>
					<td>${sgd.ssmc}-${sgd.qxmc}</td>
					<td>${sgd.mqmcId}</td>
					<td>${sgd.mxmc}</td>
					<td>${sgd.mxlb}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sgd.yylzrq}"
							type="date" /></td>
					<td>${sgd.mzf}</td>
					        <c:choose>
							<c:when test="${sgd.mxlb ==1 }">
								<td>${sgd.mdf1}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==2 }">
								<td>${sgd.mdf2}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==3 }">
								<td>${sgd.mdf3}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==4 }">
								<td>${sgd.mdf4}</td>
							</c:when>
							<c:otherwise>
								<td>${sgd.mdf}</td>
							</c:otherwise>
							</c:choose>
						    <c:choose>
							<c:when test="${sgd.mxlb ==1 }">
								<td>${sgd.clf1}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==2 }">
								<td>${sgd.clf2}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==3 }">
								<td>${sgd.clf3}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==4 }">
								<td>${sgd.clf4}</td>
							</c:when>
							<c:otherwise>
								<td>${sgd.clf}</td>
							</c:otherwise>
							</c:choose>
						    <c:choose>
							<c:when test="${sgd.mxlb ==1 }">
								<td>${sgd.lzf1}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==2 }">
								<td>${sgd.lzf2}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==3 }">
								<td>${sgd.lzf3}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==4 }">
								<td>${sgd.lzf4}</td>
							</c:when>
							<c:otherwise>
								<td>${sgd.lzf}</td>
							</c:otherwise>
							</c:choose>
					
							<c:choose>
							<c:when test="${sgd.mxlb ==1 }">
								<td>${sgd.lhf1}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==2 }">
								<td>${sgd.lhf2}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==3 }">
								<td>${sgd.lhf3}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==4 }">
								<td>${sgd.lhf4}</td>
							</c:when>
							<c:otherwise>
								<td>${sgd.lhf}</td>
							</c:otherwise>
					        </c:choose>
					
					<td>${sgd.xj}</td>
					<td>${sgd.kzx}</td>
					<td>${sgd.kzxdj}</td>
					<td>${sgd.kzf}</td>
					<td>${sgd.fjf1}</td>
					<td>${sgd.fjf2}</td>
					<td>${sgd.fjf3}</td>
					<td>${sgd.fjf4}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sgd.wfksrq}" type="date" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sgd.wfjsrq}" type="date" /></td>
					<td>${sgd.wfns}</td>
					 <c:choose>
							<c:when test="${sgd.mxlb ==1 }">
								<td>${sgd.glf1}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==2 }">
								<td>${sgd.glf2}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==3 }">
								<td>${sgd.glf3}</td>
							</c:when>
							<c:when test="${sgd.mxlb ==4 }">
								<td>${sgd.glf4}</td>
							</c:when>
							<c:otherwise>
								<td>${sgd.glf}</td>
							</c:otherwise>
							</c:choose>
					<td>${sgd.wfhj}</td>
					<td>${sgd.yshj}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sgd.dmrq}" type="date" /></td>
					<td>${sgd.yhje}</td>
					<td>${sgd.qfhj}</td>
					<td>${sgd.syxm1}</td>
					<td>${sgd.sy1qk}</td>
					<td>${sgd.syxm2}</td>
					<td>${sgd.sy2qk}</td>
					<td>${sgd.syxm3}</td>
					<td>${sgd.sy3qk}</td>
					<td>${sgd.syxm4}</td>
					<td>${sgd.sy4qk}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sgd.szrq}" type="date" /></td>
					<td>${sgd.user}</td>
					<td>${sgd.jzy}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sgd.jzskrq}" type="date" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sgd.fjskrq}" type="date" /></td>
					
					<td><a
						href="${pageContext.request.contextPath }/showUpdateSgd.html?sgdbh=${sgd.sgdbh}&mqmcId=${sgd.mqmcId}&mxmc=${sgd.mxmc}">修改</a>
						<a
						href="${pageContext.request.contextPath }/constructionDelete.html?sgdbh=${sgd.sgdbh}&mqmcId=${sgd.mqmcId}&mxmc=${sgd.mxmc}"
						onclick="delcfm()">删除</a>
						<a
						href="${pageContext.request.contextPath }/constructionDetails.html?sgdbh=${sgd.sgdbh}">详情</a>
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

					<a
						href="construction-list.html?pageNo=1&sgdbh=${sgdbh}">首页</a>

					<c:choose>
						<c:when test="${pageBean.curPageNo-1 > 0}">
							<a
								href="construction-list.html?pageNo=${pageBean.curPageNo-1}&sgdbh=${sgdbh}">上一页</a>
						</c:when>
						<c:when test="${pageBean.curPageNo-1 <= 0}">
							<a
								href="construction-list.html?pageNo=1&sgdbh=${sgdbh}">上一页</a>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${pageBean.totalPage == 0}">
							<a
								href="construction-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh}">下一页</a>
						</c:when>
						<c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
							<a
								href="construction-list.html?pageNo=${pageBean.curPageNo+1}&sgdbh=${sgdbh}">下一页</a>
						</c:when>
						<c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
							<a
								href="construction-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh}">下一页</a>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${pageBean.totalPage==0}">
							<a
								href="construction-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh}"
								id="totalPage">尾页</a>
						</c:when>
						<c:otherwise>
							<a
								href="construction-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh}"
								id="totalPage">尾页</a>
						</c:otherwise>
					</c:choose>

					转到<input type="text" id="goPage" value="${pageBean.curPageNo}"
						size="1" />页
					<button width="20" onclick="reload();" type="submit">GO</button>
				</div></th>
		</tr>
	</table>
	</form>
</body>
</html>
