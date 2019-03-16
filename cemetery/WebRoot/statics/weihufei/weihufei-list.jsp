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
    
    <title>My JSP 'weihufei-list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="statics/css/style.css">
	<script src="statics/js/common.js"></script>
	<script src="statics/js/jquery-2.1.4.min.js"></script>
	<script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>
		
	<style>
	     a:link{text-decoration:none;color:blue}
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
    	$("#whskrqEnd").blur(function () {
    		if($("#whskrqStart").val()==""||$("#whskrqStart").val()==null){
    			alert("请输入开始日期！");
    			return;
    		}
    	 });
     });
    
     $(document).ready(function () {
     	$("#search").click(function () {
     		var sgdbh = $('#sgdbh').val();
            $('#sgdbh').val($.trim(sgdbh));
            var lxrxm = $('#lxrxm').val();
            $('#lxrxm').val($.trim(lxrxm));
     	});
     });
	</script>
  </head>
  
  <body>
    <div class="page_title">维护费管理&gt;维护费详情</div>
    <div class="button_bar">
	
	<button class="common_button" onclick="to('${pageContext.request.contextPath }/weihufei-add.html');">维护费续交</button>  
	
	</div>
   <form  method="post" action=" "> 
       
        <table class="query_form_table">
 
			<tr>
			    <th>施工单编号</th>
				<td><input name="sgdbh" id="sgdbh" type="text" value="${sgdbh}" size="10" style="height:19px;"/></td>
				<th>联系人姓名</th>
				<td><input name="lxrxm" id="lxrxm" type="text" value="${lxrxm}" size="10" style="height:19px;"/></td>
				<th>墓区名称--墓穴名称</th>
				<td><select name="mqmc" id="mqmcId" style="width:70px;height:20px;">
					<option value="" ${mqmc== '选择墓区' ? "selected=\"selected\"":"" }>选择墓区</option>
					<c:if test="${!empty muquList}">
						<c:forEach var="mq" items="${muquList}">
							<option value="${mq.mqmc}">${mq.mqmc}</option>
						</c:forEach>
					</c:if>
			        </select>--<select name="mxmc" id="mxmcId" style="width:70px;height:20px;">
					<option value="" ${mxmc== '选择墓穴' ? "selected=\"selected\"":"" }>选择墓穴</option>

			        </select>
			   </td>
			</tr>
			<tr>
				
				<th>维护费收款日期</th>
				<td><input class="Wdate" name="whskrqStart" id="whskrqStart" type="text"  value="${whskrqStart}" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" />-
			        <input class="Wdate" name="whskrqEnd" id="whskrqEnd" type="text"  value="${whskrqEnd }" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" /></td>
				<th>欠费截止日期</th>
				<td><input class="Wdate" name="qfrq" id="" type="text"  value="" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" /></td>
				<th><button class="common_button" id="search" type="submit">查询</button></th>
				<td></td>
			</tr>
			
		</table>
		
</form>
<br />
				 <div style="overflow-x:auto;" >
				<table class="data_list_table">
						<tr>
							
							<th>施工单编号</th>
							<th>定墓日期</th>
							<th>联系人姓名</th>
							<th>联系人地址</th>
							<th>联系人电话</th>
							<th>邮政编码</th>
							<th>来自区县</th>
							<th>墓区名称</th>
							<th>墓穴名称</th>
							<th>墓穴类别</th>
							<th>维护开始日期</th>
							<th>维护结束日期</th>
							<th>维护年数</th>
							<th>维护单价</th>
							<th>维护合计</th>
							
							<th>维护收款日期</th>
							<th>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
						</tr>
						<c:forEach items="${pageBean.pageList }" var="whf">
						<tr class="" id="id">
							
							<td>${whf.sgdbh}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${whf.dmrq }" type="date" /></td>
							<td>${whf.lxrxm}</td>
							<td>${whf.lxrdz }</td>
							<td>${whf.lxrdh }</td>
							<td>${whf.lxryb }</td>
							<td>${whf.ssmc}-${whf.qxmc}</td>
							<td>${whf.mqmcId }</td>
							<td>${whf.mxmc}</td>
							<td>${whf.mxlb}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${whf.wfksrq }" type="date" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${whf.wfjsrq }" type="date" /></td>
							<td>${whf.wfns }</td>
							<c:choose>
								<c:when test="${whf.mxlb ==1 }">
									<td>${whf.glf1}</td>
								</c:when>
								<c:when test="${whf.mxlb ==2 }">
									<td>${whf.glf2}</td>
								</c:when>
								<c:when test="${whf.mxlb ==3 }">
									<td>${whf.glf3}</td>
								</c:when>
								<c:when test="${whf.mxlb ==4 }">
									<td>${whf.glf4}</td>
								</c:when>
								<c:otherwise>
									<td>${whf.glf}</td>
								</c:otherwise>
							</c:choose>
							<td>${whf.wfhj }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${whf.whskrq }" type="date" /></td>
							
							<td>
							<a href="${pageContext.request.contextPath }/showWhfUpdate.html?sgdbh=${whf.sgdbh}">修改</a>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath }/whfDel.html?sgdbh=${whf.sgdbh}">删除</a>
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
						
						<a href="weihufei-list.html?pageNo=1&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="weihufei-list.html?pageNo=${pageBean.curPageNo-1}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="weihufei-list.html?pageNo=1&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="weihufei-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="weihufei-list.html?pageNo=${pageBean.curPageNo+1}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="weihufei-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="weihufei-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}" id="totalPage">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="weihufei-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&whskrq=${whskrqStart}&whskrq=${whskrqEnd}" id="totalPage">尾页</a>
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
