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

<title>My JSP 'TombArea-add.jsp' starting page</title>

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
<script type="text/javascript">
	
	function save(){ 
	    alert('保存成功！');
	    document.form1.action="<%=basePath%>/muxueGetAdd.html";
	
	    document.form1.submit();
	
	}
	
	function search(){
	
	    document.form1.action="<%=basePath%>/searchMuxue.html";
	
	    document.form1.submit();
	
	}
</script>
</head>

<body>
  <form method="post" name="form1">
	<div class="page_title">墓穴管理&gt;墓穴新建</div>
	<div class="button_bar">
		<button class="common_button" type="submit" onclick="save()">保存</button>
	</div>
	<table class="query_form_table">

		<tr>
			<th>墓区名称：</th>
			<td><select name="mqmc" style="width:100px">
					<option value="">--请选择--</option>
					<c:forEach var="mq" items="${muquList}">
						<option value="${mq.mqmc}" ${mq.mqmc == param['mqmc']?'selected':''}>
							${mq.mqmc}
						 </option>
					</c:forEach>
			</select> &nbsp;&nbsp;&nbsp;
				<button id="searchId" type="submit" onclick="search()">查询</button>
			</td>
			<th></th>
			<td>
			</td>
			<th>&nbsp;</th>
			<td>&nbsp;</td>

		</tr>
		<tr>
			<th>墓地费</th>
			<td><input name="mdf" value="${MQ.mdf }" size="11" readonly /><span>（元）</span>
			</td>
			<th>材料费</th>
			<td><input name="clf" value="${MQ.clf }" size="11" readonly /><span>（元）</span>
			</td>
			<th>落葬费</th>
			<td><input name="lzf" value="${MQ.lzf}" size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>绿化费</th>
			<td><input name="lhf" value="${MQ.lhf}" size="11" readonly /><span>（元）</span>
			</td>
			<th>维护费/年</th>
			<td><input name="glf" value="${MQ.glf}" size="11" readonly /><span>（元）</span>
			</td>
			<th>墓穴价格</th>
			<td><input type="text" name="mxjg" value="${MQ.mxjg}" size="11"
				readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>墓穴面积</th>
			<td><input type="text" name="mxmj" value="${MQ.mxmj}" size="11"
				readonly /><span>（㎡）</span>
			</td>
			<th>道路面积</th>
			<td><input type="text" name="dlmj" value="${MQ.dlmj}" size="11"
				readonly /><span>（㎡）</span>
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
			<td><input name="mdf1" value="${MQ.mdf1}" size="11" readonly /><span>（元）</span>
			</td>
			<th>材料费（单）</th>
			<td><input name="clf1" value="${MQ.clf1}" size="11" readonly /><span>（元）</span>
			</td>
			<th>落葬费（单）</th>
			<td><input name="lzf1" value="${MQ.lzf1}" size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>绿化费（单）</th>
			<td><input name="lhf1" value="${MQ.lhf1}" size="11" readonly /><span>（元）</span>
			</td>
			<th>维护费/年（单）</th>
			<td><input name="glf1" value="${MQ.glf1}" size="11" readonly /><span>（元）</span>
			</td>
			<th>墓穴价格（单）</th>
			<td><input type="text" name="mxjg1" value="${MQ.mxjg1}"
				size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>墓穴面积（单）</th>
			<td><input type="text" name="mxmj1" value="${MQ.mxmj1}"
				size="11" readonly /><span>（㎡）</span>
			</td>
			<th>道路面积（单）</th>
			<td><input type="text" name="dlmj1" value="${MQ.dlmj1}"
				size="11" readonly /><span>（㎡）</span>
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
			<td><input name="mdf2" value="${MQ.mdf2}" size="11" readonly /><span>（元）</span>
			</td>
			<th>材料费（双）</th>
			<td><input name="clf2" value="${MQ.clf2}" size="11" readonly /><span>（元）</span>
			</td>
			<th>落葬费（双）</th>
			<td><input name="lzf2" value="${MQ.lzf2}" size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>绿化费（双）</th>
			<td><input name="lhf2" value="${MQ.lhf2}" size="11" readonly /><span>（元）</span>
			</td>
			<th>维护费/年（双）</th>
			<td><input name="glf2" value="${MQ.glf2}" size="11" readonly /><span>（元）</span>
			</td>
			<th>墓穴价格（双）</th>
			<td><input type="text" name="mxjg2" value="${MQ.mxjg2}"
				size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>墓穴面积（双）</th>
			<td><input type="text" name="mxmj2" value="${MQ.mxmj2}"
				size="11" readonly /><span>（㎡）</span>
			</td>
			<th>道路面积（双）</th>
			<td><input type="text" name="dlmj2" value="${MQ.dlmj2}"
				size="11" readonly /><span>（㎡）</span>
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
			<td><input name="mdf3" value="${MQ.mdf3}" size="11" readonly /><span>（元）</span>
			</td>
			<th>材料费（三）</th>
			<td><input name="clf3" value="${MQ.clf3}" size="11" readonly /><span>（元）</span>
			</td>
			<th>落葬费（三）</th>
			<td><input name="lzf3" value="${MQ.lzf3}" size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>绿化费（三）</th>
			<td><input name="lhf3" value="${MQ.lhf3}" size="11" readonly /><span>（元）</span>
			</td>
			<th>维护费/年（三）</th>
			<td><input name="glf3" value="${MQ.glf3}" size="11" readonly /><span>（元）</span>
			</td>
			<th>墓穴价格（三）</th>
			<td><input type="text" name="mxjg3" value="${MQ.mxjg3}"
				size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>墓穴面积（三）</th>
			<td><input type="text" name="mxmj3" value="${MQ.mxmj3}"
				size="11" readonly /><span>（㎡）</span>
			</td>
			<th>道路面积（三）</th>
			<td><input type="text" name="dlmj3" value="${MQ.dlmj3}"
				size="11" readonly /><span>（㎡）</span>
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
			<td><input name="mdf4" value="${MQ.mdf4}" size="11" readonly /><span>（元）</span>
			</td>
			<th>材料费（四）</th>
			<td><input name="clf4" value="${MQ.clf4}" size="11" readonly /><span>（元）</span>
			</td>
			<th>落葬费（四）</th>
			<td><input name="lzf4" value="${MQ.lzf4}" size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>绿化费（四）</th>
			<td><input name="lhf4" value="${MQ.lhf4}" size="11" readonly /><span>（元）</span>
			</td>
			<th>维护费/年（四）</th>
			<td><input name="glf4" value="${MQ.glf4}" size="11" readonly /><span>（元）</span>
			</td>
			<th>墓穴价格（四）</th>
			<td><input type="text" name="mxjg4" value="${MQ.mxjg4}"
				size="11" readonly /><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>墓穴面积（四）</th>
			<td><input type="text" name="mxmj4" value="${MQ.mxmj4}"
				size="11" readonly /><span>（㎡）</span>
			</td>
			<th>道路面积（四）</th>
			<td><input type="text" name="dlmj4" value="${MQ.dlmj4}"
				size="11" readonly /><span>（㎡）</span>
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
	</table>

	<table class="query_form_table">
		<tr>
			<th>行号—列号</th>
			<td><input name="hh" size="5" />-<input name="lh" size="5" onkeydown="if(event.keyCode==13){return false;}"/><span
				class="red_star">*</span>
			</td>
			<th>墓穴名称</th>
			<td><input name="mxmc" size="10" /><span class="red_star">*</span>
			</td>
			<th>墓穴类别</th>
			<td><select name="mxlb" style="width:100px">
					<option value="" ${mxlb== '--请选择--' ? "selected=\"selected\"":"" }>--请选择--</option>
					<c:forEach var="lb" items="${liBieList}">
						<option value="${lb.mxlb}"
							<c:if test="${mxlb == lb.mxlb}">
						          selected=selected 
						    </c:if>>
							<c:if test="${lb.mxlb==1}">单穴</c:if>
							<c:if test="${lb.mxlb==2}">双穴</c:if>
							<c:if test="${lb.mxlb==3}">三穴</c:if>
							<c:if test="${lb.mxlb==4}">四穴</c:if>
						</option>
					</c:forEach>
			</select><span class="red_star">*</span>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
