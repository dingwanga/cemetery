<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'muxue-list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	  <script src="statics/js/jquery-2.1.4.min.js"></script>
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
	</script>
  </head>
  
  <body>
    <div class="page_title">墓穴管理&gt;墓穴详情</div>
    <div class="button_bar">
	
	<button class="common_button" onclick="to('${pageContext.request.contextPath }/muxueAdd.html')">新建</button>  
	
	
	</div>
<form  method="post" action="${pageContext.request.contextPath }/muxue-list.html"> 

        <table class="query_form_table">
 
			<tr>
					<th>墓区名称</th>
					<td><select name="mqmc" id="mqmcId" style="width:100px" >
					   <option value="" ${mqmc == '选择墓区' ? "selected=\"selected\"":"" }>选择墓区</option>
					    <c:if test="${!empty muquList}">
							<c:forEach var="mq" items="${muquList}">
							      <option value="${mq.mqmc}">${mq.mqmc}</option>
							</c:forEach>
						</c:if>
				</select></td>
					<th>墓穴名称</th>
					<td>
					   <select name="mxmc"  id="mxmcId" style="width:100px">
					   <option value="" ${mxmc == '选择墓穴' ? "selected=\"selected\"":"" }>选择墓穴</option>
					    
				       </select>
				    </td>
				<th></th><td></td>
			</tr>
			<tr>
				<th>使用情况</th>
				<td><select name="ryqk" style="width:100px">
				    <option value="" ${ryqk == '--请选择--' ? "selected=\"selected\"":"" }>--请选择--</option>
					<c:forEach var="sy" items="${syList}">
					      <option value="${sy.ryqk}">
						       <%-- <c:if test="${ryqk == sy.ryqk}">
						          selected=selected
						        
						       </c:if>> --%>
						       <c:if test="${sy.ryqk == 1}">已使用</c:if>
							   <c:if test="${sy.ryqk == 0}">未使用</c:if>
							</option>
					</c:forEach> 
			      </select>
			    </td>
			<th>定墓判别</th>
				<td><select name="dmpb" style="width:100px">
				    <option value="" ${dmpb == '--请选择--' ? "selected=\"selected\"":"" }>--请选择--</option>
					<c:forEach var="dm" items="${dmList}">
					      <option value="${dm.dmpb}">
						      <%--  <c:if test="${dmpb == dm.dmpb}">
						          selected=selected
						        
						       </c:if>> --%>
						       <c:if test="${dm.dmpb == 1}">已定墓</c:if>
							   <c:if test="${dm.dmpb == 0}">未定墓</c:if>
							</option>
					</c:forEach> 
					
			      </select>
			    </td>
				<th><button class="common_button"  type="submit">查询</button></th>
				<td></td>
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
							<th>使用情况</th>
							<th>定墓判别</th>
							<th>行号</th>
							<th>列号</th>
							<th>施工单编号</th>
							<th>联系人姓名</th>
							<th>使用人姓名1</th>
							<th>落葬1</th>
							<th>使用人姓名2</th>
							<th>落葬2</th>
							<th>使用人姓名3</th>
							<th>落葬3</th>
							<th>使用人姓名4</th>
							<th>落葬4</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${pageBean.pageList }" var="mx" varStatus="status">
						<tr class="" id="id">
							
							<td>${mx.mqmcId}</td>
							<td>${mx.mxmc }</td>
							<c:choose>
							   <c:when test="${mx.mxlb ==1 }"><td>单穴</td></c:when>
							   <c:when test="${mx.mxlb ==2 }"><td>双穴</td></c:when>
							   <c:when test="${mx.mxlb ==3 }"><td>三穴</td></c:when>
							   <c:when test="${mx.mxlb ==4 }"><td>四穴</td></c:when>
							   <c:otherwise><td> </td></c:otherwise>
							</c:choose>
							<c:choose>
							   <c:when test="${mx.ryqk ==1 }"><td>已使用</td></c:when>
							   <c:when test="${mx.ryqk ==0 }"><td>未使用</td></c:when>
							   <c:otherwise><td> </td></c:otherwise>
							</c:choose>
							<c:choose>
							   <c:when test="${mx.dmpb ==1 }"><td>已定墓</td></c:when>
							   <c:when test="${mx.dmpb ==0 }"><td>未定墓</td></c:when>
							   <c:otherwise><td> </td></c:otherwise>
							</c:choose>
							<td> ${mx.hh }</td>
							<td> ${mx.lh }</td>
							<td> ${mx.sgdbhId }</td>
							<td> ${mx.lxrxm }</td>
							<td> ${mx.syrxm2 }</td>
							<td> ${mx.sy1qk }</td>
							<td> ${mx.syrxm2 }</td>
							<td> ${mx.sy1qk }</td>
							<td> ${mx.syrxm3 }</td>
							<td> ${mx.sy1qk }</td>
							<td> ${mx.syrxm4 }</td>
							<td> ${mx.sy1qk }</td>
							<td>
							<a href="${pageContext.request.contextPath }/muxueModify.html?mxid=${mx.mxid}&mqmc=${mx.mqmcId}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath }/muxueDel.html?mxid=${mx.mxid}" onclick="delcfm()">删除</a>
                            </td>
						</tr>
						</c:forEach>
						</table>
					</div>
				<table class="data_list_table" style="width:100%;">						
				<tr>
		           <th colspan="45" class="pager">
					<div class="pager">
					<input type="hidden" id="totalPageCount" value="${pageBean.totalPage}"/> 
						共${pageBean.totalCount}条记录&nbsp;&nbsp; 每页${pageBean.pageSize}条
						&nbsp;&nbsp;${pageBean.curPageNo}/${pageBean.totalPage}页&nbsp;&nbsp;
						
						<a href="muxue-list.html?pageNo=1&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="muxue-list.html?pageNo=${pageBean.curPageNo-1}&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="muxue-list.html?pageNo=1&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="muxue-list.html?pageNo=${pageBean.curPageNo}&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="muxue-list.html?pageNo=${pageBean.curPageNo+1}&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="muxue-list.html?pageNo=${pageBean.totalPage}&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="muxue-list.html?pageNo=${pageBean.curPageNo}&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}" id="totalPage">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="muxue-list.html?pageNo=${pageBean.totalPage}&mxmc=${mxmc}&ryqk=${ryqk}&dmpb=${dmpb}" id="totalPage">尾页</a>
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
