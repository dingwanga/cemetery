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
	  <script src="statics/js/jquery-2.1.4.min.js"></script>
	<style>
		     a{text-decoration:none;}
		     a:hover{
		      color:#2894ff;
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
				width:250%;
			}
	  </style> 
	  
	  <script type="text/javascript">
	  
	      /* 墓区墓穴查询 */
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
	        
	        /* 查询去空格 */
	        $("#search").click(function () {
	     		var sgdbh = $('#sgdbh').val();
	            $('#sgdbh').val($.trim(sgdbh));
	            var lxrxm = $('#lxrxm').val();
	            $('#lxrxm').val($.trim(lxrxm));
	             var lxrdh = $('#lxrdh').val();
	            $('#lxrdh').val($.trim(lxrdh));
	             var lxrdz = $('#lxrdz').val();
	            $('#lxrdz').val($.trim(lxrdz));
	             var syxm = $('#syxm').val();
	            $('#syxm').val($.trim(syxm));
	     	});
    });
    
    
	  </script>
</head>

<body>

	    <div class="page_title">客户查询&gt;客户详情</div>
	    <form action="" method="post">
	    <div class="button_bar">
				<button class="common_button" id="search" type="submit" >查询</button>
		</div>
        <table class="query_form_table">
 
			<tr>
			    <th>施工单编号：</th>
				<td><input name="sgdbh" id="sgdbh" type="text" value="${sgdbh }" size="9" style="height:18px"/></td>
				<th>联系人姓名：</th>
				<td><input name="lxrxm" type="text" id="lxrxm" value="${lxrxm }" size="9" style="height:18px"/></td>
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
				
				<th>使用人姓名：</th>
				<td><input name="syxm" type="text" id="syxm" value="${syxm }" size="9" style="height:18px"/></td>
				<th>联系人电话：</th>
				<td><input name="lxrdh" type="text" id="lxrdh" value="${lxrdh }" size="9" style="height:18px"/></td>
				<th>联系人地址：</th>
				<td><input name="lxrdz" type="text" id="lxrdz" value="${lxrdz }" size="12" style="height:18px"/></td>
				
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
							<th>邮编</th>
							<th>来自区县</th>
							<th>墓区名称</th>
							<th>墓穴名称</th>
							<th>墓穴类别</th>
							<th>预约落葬日</th>
							<th>墓证费</th>
							<th>墓地费</th>
							<th>材料费</th>
							<th>落葬费</th>
							<th>绿化费</th>
							<th>附件费1</th>
							<th>附件费2</th>
							<th>附件费3</th>
							<th>附件费4</th>
							<th>小计</th>
							<th>维护费开始日期</th>
							
							<th>维护年数</th>
							<th>维护费结束日期</th>
							<th>维护单价</th>
							
							<th>维护合计</th>
							<th>使用姓名1</th>
							<th>使用1情况</th>
							<th>使用姓名2</th>
							<th>使用2情况</th>
							<th>使用姓名3</th>
							<th>使用3情况</th>
							<th>使用姓名4</th>
							<th>使用4情况</th>
							<th>瓷像名称</th>
							<th>瓷像单价</th>
							<th>瓷像个数</th>
							<th>瓷像费</th>
							<th>刻框数</th>
							<th>刻框单价</th>
							<th>刻框费</th>
							<th>刻字字数</th>
							<th>刻字单价</th>
							<th>刻字费</th>
							
							<th>预付金额</th>
							<th>应收金额</th>
							<th>实收金额</th>
							<th>欠费合计</th>
							<th>补交金额</th>
							<th>交费标识</th>
						</tr>
						<c:forEach items="${pageBean.pageList }" var="customer">
						<tr class="" id="id">
							<td>${customer.sgdbh}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${customer.dmrq}" type="date" /></td>
							<td>${customer.lxrxm}</td>
							<td>${customer.lxrdz}</td>
							<td>${customer.lxrdh}</td>
							<td>${customer.lxryb}</td>
							<td>${customer.ssmc}-${customer.qxmc}</td>
							<td>${customer.mqmcId}</td>
							<td>${customer.mxmc}</td>
							<td>${customer.mxlb}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${customer.yylzrq}" type="date" /></td>
							<td>${customer.mzf}</td>
							<c:choose>
								<c:when test="${customer.mxlb ==1 }">
									<td>${customer.mdf1}</td>
								</c:when>
								<c:when test="${customer.mxlb ==2 }">
									<td>${customer.mdf2}</td>
								</c:when>
								<c:when test="${customer.mxlb ==3 }">
									<td>${customer.mdf3}</td>
								</c:when>
								<c:when test="${customer.mxlb ==4 }">
									<td>${customer.mdf4}</td>
								</c:when>
								<c:otherwise>
									<td>${customer.mdf}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${customer.mxlb ==1 }">
									<td>${customer.clf1}</td>
								</c:when>
								<c:when test="${customer.mxlb ==2 }">
									<td>${customer.clf2}</td>
								</c:when>
								<c:when test="${customer.mxlb ==3 }">
									<td>${customer.clf3}</td>
								</c:when>
								<c:when test="${customer.mxlb ==4 }">
									<td>${customer.clf4}</td>
								</c:when>
								<c:otherwise>
									<td>${customer.clf}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${customer.mxlb ==1 }">
									<td>${customer.lzf1}</td>
								</c:when>
								<c:when test="${customer.mxlb ==2 }">
									<td>${customer.lzf2}</td>
								</c:when>
								<c:when test="${customer.mxlb ==3 }">
									<td>${customer.lzf3}</td>
								</c:when>
								<c:when test="${customer.mxlb ==4 }">
									<td>${customer.lzf4}</td>
								</c:when>
								<c:otherwise>
									<td>${customer.lzf}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${customer.mxlb ==1 }">
									<td>${customer.lhf1}</td>
								</c:when>
								<c:when test="${customer.mxlb ==2 }">
									<td>${customer.lhf2}</td>
								</c:when>
								<c:when test="${customer.mxlb ==3 }">
									<td>${customer.lhf3}</td>
								</c:when>
								<c:when test="${customer.mxlb ==4 }">
									<td>${customer.lhf4}</td>
								</c:when>
								<c:otherwise>
									<td>${customer.lhf}</td>
								</c:otherwise>
							</c:choose>
							<td>${customer.fjf1}</td>
							<td>${customer.fjf2}</td>
							<td>${customer.fjf3}</td>
							<td>${customer.fjf4}</td>
							<td>${customer.xj}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${customer.wfksrq}" type="date" /></td>
							<td>${customer.wfns}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${customer.wfjsrq}" type="date" /></td>
							<c:choose>
								<c:when test="${customer.mxlb ==1 }">
									<td>${customer.glf1}</td>
								</c:when>
								<c:when test="${customer.mxlb ==2 }">
									<td>${customer.glf2}</td>
								</c:when>
								<c:when test="${customer.mxlb ==3 }">
									<td>${customer.glf3}</td>
								</c:when>
								<c:when test="${customer.mxlb ==4 }">
									<td>${customer.glf4}</td>
								</c:when>
								<c:otherwise>
									<td>${customer.glf}</td>
								</c:otherwise>
							</c:choose>
							<td>${customer.wfhj}</td>
							<td>${customer.syxm1}</td>
							<td>${customer.sy1qk}</td>
							<td>${customer.syxm2}</td>
							<td>${customer.sy2qk}</td>
							<td>${customer.syxm3}</td>
							<td>${customer.sy3qk}</td>
							<td>${customer.syxm4}</td>
							<td>${customer.sy4qk}</td>
							<td>${customer.cxmc}</td>
							<td>${customer.cxdj}</td>
							<td>${customer.cxgs}</td>
							<td>${customer.cxf}</td>
							<td>${customer.kks}</td>
							<td>${customer.kkdj}</td>
							<td>${customer.kkf}</td>
							<td>${customer.kzx}</td>
							<td>${customer.kzxdj}</td>
							<td>${customer.kzf}</td>
							<td>${customer.qmje}</td>
							<td>${customer.yshj}</td>
							<td>${customer.ssje}</td>
							<td>${customer.qfhj}</td>
							<td>${customer.bjje}</td>
							<td>${customer.jfbs}</td>
							
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
						
						<a href="customer-list.html?pageNo=1&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}">首页</a>
						
						<c:choose> 
						   <c:when test="${pageBean.curPageNo-1 > 0}">
						       <a href="customer-list.html?pageNo=${pageBean.curPageNo-1}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}">上一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo-1 <= 0}">
						       <a href="customer-list.html?pageNo=1&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}">上一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage == 0}">
						       <a href="customer-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}">下一页</a>
						   </c:when>
						   <c:when test="${pageBean.curPageNo+1 < pageBean.totalPage}">
						       <a href="customer-list.html?pageNo=${pageBean.curPageNo+1}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}">下一页</a>
						   </c:when>
						     <c:when test="${pageBean.curPageNo+1 >= pageBean.totalPage}">
						       <a href="customer-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}">下一页</a>
						   </c:when>
						</c:choose>
						
						<c:choose> 
						   <c:when test="${pageBean.totalPage==0}">
						       <a href="customer-list.html?pageNo=${pageBean.curPageNo}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxmm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}" id="totalPage">尾页</a>
						   </c:when>
						   <c:otherwise>
						       <a href="customer-list.html?pageNo=${pageBean.totalPage}&sgdbh=${sgdbh }&mqmcId=${mqmcId }&mxmc=${mxmc}&lxrxm=${lxrxm}&lxrdh=${lxrdh}&lxrdz=${lxrdz}$syxm=${syxm}" id="totalPage">尾页</a>
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