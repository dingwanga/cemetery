<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
   String mqmcSelect = "";
	if(request.getParameter("mqmc")!=null)
	  mqmcSelect = request.getParameter("mqmc");
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
		html,body{
			overflow-x:hidden;
		}
		.data_list_table{
			width:300%;
		}
	</style>
	  
	  </style>
	   <script type="text/javascript">
	  	function reload(){
			var page = document.getElementById("goPage").value;
			var totalPage = document.getElementById("totalPage").value;
			if(!/^[1-9]\d*$/.test(page)) {//对当前页码进行整数校验
				alert('请输入正确的页码！');
				return;
			}
			if(page > "${pageBean.totalPage}") {//判断当前页码是否大于最大页
				alert('请输入正确的页码！');
				return;

			} 
			window.location.href="<%=path %>/statics/muqu/muqu-list.html?pageNo="+page;
		}
		
		<%-- var selvalue = "<%=mqmcSelect%>";
        document.from.mqmcSelect.value= selvalue; --%>
        function getGrade(){
			var options=document.getElementById("grade").options;
			var grade=<%=(String)request.getAttribute("grade")%>;
			for(var i=0 ,size = options.length;i < size ;i++){
			if(options[i].value==grade){
			options[i].selected=true;
			};
		};
	} 
	  </script>
</head>

<body>

    <input type="hidden" id="mqmcSelect" name="mqmcSelect" value=""/>
    <div class="page_title">墓区管理&gt;墓区详情</div>
    <div class="button_bar">
	<button class="common_button" onclick="to('${pageContext.request.contextPath }/statics/muqu/muquAdd.html')">新建</button>  
	<button class="common_button" onclick="to('${pageContext.request.contextPath }/statics/muqu/muquPic.html')">墓区图</button> 
	</div>

<form  method="post" name="from"  action="${pageContext.request.contextPath }/statics/muqu/muqu-list.html"> 
        <table class="query_form_table">
 
			<tr>
				<th>请输入墓区名称：</th>
				<td>
				<select name="mqmc" style="width:100px" >
				    <option value="" ${mqmc == '--请选择--' ? "selected=\"selected\"":"" }>--请选择--</option>
					<c:forEach var="mq" items="${muquList}">
					      <option value="${mq.mqmc}"
						       <c:if test="${mqmc == mq.mqmc}">
						          selected=selected
						       </c:if>
					       >${mq.mqmc}</option>
					</c:forEach>
			</select></td>
				<th><button class="common_button"  type="submit">查询</button></th>
		        <td>&nbsp;</td>
				
			</tr>
		</table>
</form>
<br />
         <div style="overflow:auto"> 
				<table class="data_list_table">
				
						<tr>
							<!-- <th>序&nbsp;&nbsp;号</th> -->
							<th>墓区名称</th>
							<th>行数</th>
							<th>列数</th>
							<th>墓穴个数</th>
							<th>使用数</th>
							<th>未用数</th>
							<th>使用情况</th>
							<!-- <th>墓穴类别</th> -->
							
							<th>墓地费</th>
							<th>材料费</th>
							<th>落葬费</th>
							<th>绿化费</th>
							<th>维护费/年</th>
							<th>墓穴价格</th>
							<th>墓穴面积</th>
							<th>道路面积</th>
							
							<th>墓地费（单）</th>
							<th>材料费（单）</th>
							<th>落葬费（单）</th>
							<th>绿化费（单）</th>
							<th>维护费/年（单）</th>
							<th>墓穴价格(单)</th>
							<th>墓穴面积(单)</th>
							<th>道路面积(单)</th>
							
							<th>墓地费（双）</th>
							<th>材料费（双）</th>
							<th>落葬费（双）</th>
							<th>绿化费（双）</th>
							<th>维护费/年（双）</th>
							<th>墓穴价格(双)</th>
							<th>墓穴面积(双)</th>
							<th>道路面积(双)</th>
							
							
							<th>墓地费（三）</th>
							<th>材料费（三）</th>
							<th>落葬费（三）</th>
							<th>绿化费（三）</th>
							<th>维护费/年（三）</th>
							<th>墓穴价格(三)</th>
							<th>墓穴面积(三)</th>
							<th>道路面积(三)</th>
							
							
							<th>墓地费（四）</th>
							<th>材料费（四）</th>
							<th>落葬费（四）</th>
							<th>绿化费（四）</th>
							<th>维护费/年（四）</th>
							<th>墓穴价格(四)</th>
							<th>墓穴面积(四)</th>
							<th>道路面积(四)</th>
							
							
							
							
							<th>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
					
						</tr>
				
				<c:forEach items="${pageBean.pageList }" var="mq" varStatus="status">
				    <tr class="" id="id">
							<%-- <td>${mq.id}</td> --%>
							<td>${mq.mqmc }</td>
							<td>${mq.hs }</td>
							<td>${mq.ls }</td>
							<td>${mq.mxgs }</td>
							<td>${mq.sys }</td>
							<td>${mq.wys }</td>
							<td>${mq.rxqk }</td>
							
							<td>${mq.mdf }</td>
							<td>${mq.clf }</td>
							<td>${mq.lzf }</td>
							<td>${mq.lhf }</td>
							<td>${mq.glf }</td>
							<td>${mq.mxjg }</td>
							<td>${mq.mxmj }</td>
							<td>${mq.dlmj }</td>
							
							<td>${mq.mdf1 }</td>
							<td>${mq.clf1 }</td>
							<td>${mq.lzf1 }</td>
							<td>${mq.lhf1 }</td>
							<td>${mq.glf1 }</td>
							<td>${mq.mxjg1 }</td>
							<td>${mq.mxmj1 }</td>
							<td>${mq.dlmj1 }</td>
							
							<td>${mq.mdf2 }</td>
							<td>${mq.clf2 }</td>
							<td>${mq.lzf2 }</td>
							<td>${mq.lhf2 }</td>
							<td>${mq.glf2 }</td>
							<td>${mq.mxjg2 }</td>
							<td>${mq.mxmj2 }</td>
							<td>${mq.dlmj2 }</td>
							
							
							<td>${mq.mdf3 }</td>
							<td>${mq.clf3 }</td>
							<td>${mq.lzf3 }</td>
							<td>${mq.lhf3 }</td>
							<td>${mq.glf3 }</td>
							<td>${mq.mxjg3 }</td>
							<td>${mq.mxmj3 }</td>
							<td>${mq.dlmj3 }</td>
							
							<td>${mq.mdf4 }</td>
							<td>${mq.clf4 }</td>
							<td>${mq.lzf4 }</td>
							<td>${mq.lhf4 }</td>
							<td>${mq.glf4 }</td>
							<td>${mq.mxjg4 }</td>
							<td>${mq.mxmj4 }</td>
							<td>${mq.dlmj4 }</td>
							
							
							
							
							
							<td><a href="${pageContext.request.contextPath }/statics/muqu/muquUpdate.html?id=${mq.id}">修改</a>
							<a href="${pageContext.request.contextPath }/statics/muqu/muquDel.html?id=${mq.id}" onclick="delcfm()">删除</a>
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
						
						<a href="statics/muqu/muqu-list.html?pageNo=1&mqmc=${mqmc}">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="statics/muqu/muqu-list.html?pageNo=${pageBean.curPageNo-1}&mqmc=${mqmc}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="statics/muqu/muqu-list.html?pageNo=1&mqmc=${mqmc}">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="statics/muqu/muqu-list.html?pageNo=${pageBean.curPageNo}&mqmc=${mqmc}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="statics/muqu/muqu-list.html?pageNo=${pageBean.curPageNo+1}&mqmc=${mqmc}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="statics/muqu/muqu-list.html?pageNo=${pageBean.totalPage}&mqmc=${mqmc}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="statics/muqu/muqu-list.html?pageNo=${pageBean.curPageNo}&mqmc=${mqmc}" id="totalPage">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="statics/muqu/muqu-list.html?pageNo=${pageBean.totalPage}&mqmc=${mqmc}" id="totalPage">尾页</a>
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