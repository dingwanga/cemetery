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
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>jQuery/CSS3 3D Tab菜单选项卡插件DEMO演示</title>
<link rel="stylesheet" type="text/css" href="statics/css/style.css">
<script src="statics/js/common.js"></script>
<script src="statics/js/jquery-2.1.4.min.js"></script>
<script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>
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
<script type="text/javascript">
		$(document).ready(function () {
        $("#mqmcId").change(function () {
            $.get("getMxmcBymqmcId/"+encodeURI(encodeURI($("#mqmcId").val())),function(data){
                if(data.status){
                    var result = "<option>选择墓穴</option>";
                    $.each(data.obj,function(n,value){
                        result +="<option value='"+value.mxmc+"'>"+value.mxmc+"</option>";
                    });
                    $("#mxmcId").html('');
                    $("#mxmcId").append(result);
                }
            },"json");
        });
    });
    
    $(document).ready(function () {
    	$("#dmrqEnd").blur(function () {
    		if($("#dmrqStart").val()==""||$("#dmrqStart").val()==null){
    			alert("请输入开始日期！");
    			return;
    		}
    	 });
     });
	</script>
</head>

<body>

	<div class="page_title">定墓管理&gt;定墓详情</div>
	<div class="button_bar">

		<button class="common_button" onclick="to('${pageContext.request.contextPath }/dingmuAdd.html');">新建</button>

	</div>

<form  method="post" action="${pageContext.request.contextPath }/dingmu-list.html"> 
	<table class="query_form_table">

		<tr>

			<th>墓区名称</th>
			<td><select name="mqmc" id="mqmcId" style="width:100px">
					<option value="" ${mqmc== '选择墓区' ? "selected=\"selected\"":"" }>选择墓区</option>
					<c:if test="${!empty muquList}">
						<c:forEach var="mq" items="${muquList}">
							<option value="${mq.mqmc}">${mq.mqmc}</option>
						</c:forEach>
					</c:if>
			</select>
			</td>
			<th>墓穴名称</th>
			<td><select name="mxmc" id="mxmcId" style="width:100px;height:18px;">
					<option value="" ${mxmc== '选择墓穴' ? "selected=\"selected\"":"" }>选择墓穴</option>

			</select></td>
			<th>申请人姓名：</th>
			<td><input name="sqrxm"  value="${sqrxm }" type="text"  size="10"  style="height:18px"/></td>

		</tr>
		<tr>
			<th>定墓日期：</th>
			<td>
			   <input class="Wdate" name="dmrqStart" id="dmrqStart" type="text"  value="${dmrqStart}" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" />-
			   <input class="Wdate" name="dmrqEnd" id="dmrqEnd" type="text"  value="${dmrqEnd}" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" />
			</td>
			<th>
				<button class="common_button" id="search" type="submit">查询</button>
			</th>
			<td>&nbsp;</td>
			<th>&nbsp;</th>
			<td>&nbsp;</td>

		</tr>

	</table>
	</form>
	<br />
	<div style="overflow-x:auto;" > 
	<table class="data_list_table">
		<tr>
			<th>墓区名称</th>
			<th>墓穴名称</th>
			<th>墓穴类别</th>
			<th>定墓判定</th>
			<th>定墓日期</th>
			<th>申请人姓名</th>
			<th>申请人电话</th>
			<th>申请人地址</th>
			<th>备注</th>
			<th>定墓金额</th>
			<th>业务员</th>
			<th>定墓收款日期</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${pageBean.pageList }" var="dm">
		<c:choose>
		<c:when test="${dm.dmpb ==1 }">
		<tr class="" id="id">
			<td>${dm.mqmcId }</td>
			<td>${dm.mxmc }</td>
			<td>${dm.mxlb }</td>
			   <td>已定墓</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dm.dmrq }" type="date" /></td>
			<td>${dm.sqrxm }</td>
			<td>${dm.lxdh }</td>
			<td>${dm.lxdz }</td>
			<td>${dm.bz }</td>
			<td>${dm.qmje }</td>
			<td>${dm.user}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dm.dmskrq }" type="date" /></td>
			<td><a
				href="${pageContext.request.contextPath }/showDingmuUpdate.html?mxid=${dm.mxid}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/DingmuDel.html?mxid=${dm.mxid}" onclick="delcfm()">删除</a>
			</td>
		</tr>
		</c:when>
		<c:otherwise></c:otherwise>
		</c:choose>
		</c:forEach>
		</table>
		</div>
		<table class="data_list_table" style="width:100%;">
		<tr>
		           <th colspan="45" class="pager">
					<div class="pager">
					<%-- <input type="hidden" id="totalPageCount" value="${pageBean.totalPage}"/>  --%>
						共${pageBean.totalCount}条记录&nbsp;&nbsp; 每页${pageBean.pageSize}条
						&nbsp;&nbsp;${pageBean.curPageNo}/${pageBean.totalPage}页&nbsp;&nbsp;
						
						<a href="dingmu-list.html?pageNo=1&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="dingmu-list.html?pageNo=${pageBean.curPageNo-1}&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="dingmu-list.html?pageNo=1&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="dingmu-list.html?pageNo=${pageBean.curPageNo}&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="dingmu-list.html?pageNo=${pageBean.curPageNo+1}&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="dingmu-list.html?pageNo=${pageBean.totalPage}&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="dingmu-list.html?pageNo=${pageBean.curPageNo}&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}" id="totalPage">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="dingmu-list.html?pageNo=${pageBean.totalPage}&mqmcId=${mqmcId }&mxmc=${mxmc}&sqrxm=${sqrxm}&dmrq=${dmrq}" id="totalPage">尾页</a>
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