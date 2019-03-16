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

<title>My JSP 'muxue-modify.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="statics/css/style.css">
<script src="statics/js/common.js"></script>
<style>
a {
	text-decoration: none;
}

a:hover {
	color: #2894ff;
}
</style>

</head>

<body>
	<div class="page_title">墓穴管理&gt;墓穴修改</div>
	<form method="post" action="${pageContext.request.contextPath }/muxueUpdate.html">
	<div class="button_bar">
		<button class="common_button" type="submit"  onClick="save('${pageContext.request.contextPath }/muxue-list.html')">保存</button>
	</div>
	
		<table class="query_form_table">

			<tr>
				<th>墓区名称</th>
				<td>
					<input name="mqmcId" value="${muxue.mqmcId}" size="10" readonly />
				</td>
				<th></th>
				<td></td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>墓地费</th>
				<td><input name="mdf" value="${muqu.mdf }" size="11" readonly /><span>（元）</span>
				</td>
				<th>材料费</th>
				<td><input name="clf" value="${muqu.clf }" size="11" readonly /><span>（元）</span>
				</td>
				<th>落葬费</th>
				<td><input name="lzf" value="${muqu.lzf}" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>绿化费</th>
				<td><input name="lhf" value="${muqu.lhf }" size="11" readonly /><span>（元）</span>
				</td>
				<th>维护费/年</th>
				<td><input name="glf" value="${muqu.glf}" size="11" readonly /><span>（元）</span>
				</td>
				<th>墓穴价格</th>
				<td><input type="text" name="mxjg" value="${muqu.mxjg }" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>墓穴面积</th>
				<td><input type="text" name="mxmj" value="${muqu.mxmj}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th>道路面积</th>
				<td><input type="text" name="dlmj" value="${muqu.dlmj }" size="11" readonly /><span>（㎡）</span>
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>墓地费（单）</th>
				<td><input name="mdf1" value="${muqu.mdf1 }" size="11" readonly /><span>（元）</span>
				</td>
				<th>材料费（单）</th>
				<td><input name="clf1" value="${muqu.clf1}" size="11" readonly /><span>（元）</span>
				</td>
				<th>落葬费（单）</th>
				<td><input name="lzf1" value="${muqu.lzf1}" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>绿化费（单）</th>
				<td><input name="lhf1" value="${muqu.lhf1}" size="11" readonly /><span>（元）</span>
				</td>
				<th>维护费/年（单）</th>
				<td><input name="glf1" value="${muqu.glf1}" size="11" readonly /><span>（元）</span>
				</td>
				<th>墓穴价格（单）</th>
				<td><input type="text" name="mxjg1" value="${muqu.mxjg1 }" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>墓穴面积（单）</th>
				<td><input type="text" name="mxmj1" value="${muqu.mxmj1}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th>道路面积（单）</th>
				<td><input type="text" name="dlmj1" value="${muqu.dlmj1}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>墓地费（双）</th>
				<td><input name="mdf2" value="${muqu.mdf2}" size="11" readonly /><span>（元）</span>
				</td>
				<th>材料费（双）</th>
				<td><input name="clf2" value="${muqu.clf2}" size="11" readonly /><span>（元）</span>
				</td>
				<th>落葬费（双）</th>
				<td><input name="lzf2" value="${muqu.lzf2}" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>绿化费（双）</th>
				<td><input name="lhf2" value="${muqu.lhf2}" size="11" readonly /><span>（元）</span>
				</td>
				<th>维护费/年（双）</th>
				<td><input name="glf2" value="${muqu.glf2}" size="11" readonly /><span>（元）</span>
				</td>
				<th>墓穴价格（双）</th>
				<td><input type="text" name="mxjg2" value="${muqu.mxjg2 }" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>墓穴面积（双）</th>
				<td><input type="text" name="mxmj2" value="${muqu.mxmj2}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th>道路面积（双）</th>
				<td><input type="text" name="dlmj2" value="${muqu.dlmj2}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>墓地费（三）</th>
				<td><input name="mdf3" value="${muqu.mdf3}" size="11" readonly /><span>（元）</span>
				</td>
				<th>材料费（三）</th>
				<td><input name="clf3" value="${muqu.clf3}" size="11" readonly /><span>（元）</span>
				</td>
				<th>落葬费（三）</th>
				<td><input name="lzf3" value="${muqu.lzf3 }" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>绿化费（三）</th>
				<td><input name="lhf3" value="${muqu.lhf3}" size="11" readonly /><span>（元）</span>
				</td>
				<th>维护费/年（三）</th>
				<td><input name="glf3" value="${muqu.glf3}" size="11" readonly /><span>（元）</span>
				</td>
				<th>墓穴价格（三）</th>
				<td><input type="text" name="mxjg3" value="${muqu.mxjg3}" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>墓穴面积（三）</th>
				<td><input type="text" name="mxmj3" value="${muqu.mxmj3 }" size="11" readonly /><span>（㎡）</span>
				</td>
				<th>道路面积（三）</th>
				<td><input type="text" name="dlmj3" value="${muqu.dlmj3}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>墓地费（四）</th>
				<td><input name="mdf4" value="${muqu.mdf4}" size="11" readonly /><span>（元）</span>
				</td>
				<th>材料费（四）</th>
				<td><input name="clf4" value="${muqu.clf4}" size="11" readonly /><span>（元）</span>
				</td>
				<th>落葬费（四）</th>
				<td><input name="lzf4" value="${muqu.lzf4 }" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>绿化费（四）</th>
				<td><input name="lhf4" value="${muqu.lhf4}" size="11" readonly /><span>（元）</span>
				</td>
				<th>维护费/年（四）</th>
				<td><input name="glf4" value="${muqu.glf4}" size="11" readonly /><span>（元）</span>
				</td>
				<th>墓穴价格（四）</th>
				<td><input type="text" name="mxjg4" value="${muqu.mxjg4}" size="11" readonly /><span>（元）</span>
				</td>
			</tr>
			<tr>
				<th>墓穴面积（四）</th>
				<td><input type="text" name="mxmj4" value="${muqu.mxmj4}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th>道路面积（四）</th>
				<td><input type="text" name="dlmj4" value="${muqu.dlmj4}" size="11" readonly /><span>（㎡）</span>
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>


			
					<tr>
						<th>行号—列号</th>
						<td>
						<input name="mxid" value="${muxue.mxid }" type="hidden" />
						<input name="hh" value="${muxue.hh }" size="5" />-<input
							name="lh" value="${muxue.lh }" size="5" /></td>
						<th>墓穴名称</th>
						<td><input name="mxmc" value="${muxue.mxmc }" size="10" /></td>
						<th>墓穴类别</th>
						<td><select name="mxlb" style="width:100px">
								<option value="${muxue.mxlb}">
									<c:if test="${muxue.mxlb==1}">单穴</c:if>
									<c:if test="${muxue.mxlb==2}">双穴</c:if>
									<c:if test="${muxue.mxlb==3}">三穴</c:if>
									<c:if test="${muxue.mxlb==4}">四穴</c:if>
								</option>
								<c:forEach var="lb" items="${liBieList}">
									<option value="${lb.mxlb}">
										<c:if test="${lb.mxlb==1}">单穴</c:if>
										<c:if test="${lb.mxlb==2}">双穴</c:if>
										<c:if test="${lb.mxlb==3}">三穴</c:if>
										<c:if test="${lb.mxlb==4}">四穴</c:if>
										<c:if test="${lb.mxlb==null}">
										</c:if>
									</option>
								</c:forEach> 
						</select></td>
					</tr>
		</table>
	</form>
</body>
</html>
