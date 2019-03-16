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
<script src="statics/js/jquery-2.1.4.min.js"></script>
<script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>

<style>
a {
	text-decoration: none;
}

a:hover {
	color: #2894ff;
}
.inscriptionEditor{
	width: 108px;
    height: 25px;
    font-size: 15px;
    font-family: cursive;
}
.inscriptionEditor:active{
	width: 108px;
    height: 25px;
    font-size: 15px;
    font-family: cursive;
    background: black;
    color: white;
}

#title{
    font-size: 18px;
    color: blue;
}
.page_title{
  font-size: 18px; 
}
</style>
<script type="text/javascript">
	function save(){ 
	    var jzskrqId = document.getElementById("jzskrqId");
	    var jzyId = document.getElementById("jzyId");
	    var lxrxmId = document.getElementById("lxrxmId");
	    var lxrdhId = document.getElementById("lxrdhId");
	    var ssId = document.getElementById("ssId");
	    var lxrdzId = document.getElementById("lxrdzId");
	    var lxrybId = document.getElementById("lxrybId");
	    var mzfId = document.getElementById("mzfId");
	    var mqmcId = document.getElementById("mqmcId");
	    var mxmcOneId = document.getElementById("mxmcOneId");
	    if(isNull(jzskrqId.value)){
   			alert("结账日期不能为空！");
   			jzskrqId.focus();
   			return false;
   		}else if(isNull(jzyId.value)){
   			alert("结账员不能为空！");
   			jzyId.focus();
   			return false;
   		}else if(isNull(lxrxmId.value)){
   			alert("联系人姓名不能为空！");
   			lxrxmId.focus();
   			return false;
   		}else if(isNull(lxrdhId.value)){
   			alert("联系电话不能为空！");
   			lxrdhId.focus();
   			return false;
   		}else if(isNull(ssId.value)){
   			alert("来自区县不能为空！");
   			ssId.focus();
   			return false;
   		}else if(isNull(lxrdzId.value)){
   			alert("联系地址不能为空！");
   			lxrdzId.focus();
   			return false;
   		}else if(isNull(lxrybId.value)){
   			alert("邮政编码不能为空！");
   			lxrybId.focus();
   			return false;
   		}else if(isNull(mzfId.value)){
   			alert("墓证费不能为空！");
   			mzfId.focus();
   			return false;
   		}else if(isNull(mqmcId.value)){
   			alert("墓区名称不能为空！");
   			mqmcId.focus();
   			return false;
   		}else if(isNull(mxmcOneId.value)){
   			alert("墓穴名称不能为空！");
   			mxmcOneId.focus();
   			return false;
   		}else{
   		    alert('保存成功！');
		    document.form1.action="<%=basePath%>/sgdGetAdd.html";
		    document.form1.submit();
   		}
	
	}
	
    function getyyyyMMdd(){
    var d = new Date();
    var curr_date = d.getDate();
    var curr_month = d.getMonth() + 1; 
    var curr_year = d.getFullYear();
    String(curr_month).length < 2 ? (curr_month = "0" + curr_month): curr_month;
    String(curr_date).length < 2 ? (curr_date = "0" + curr_date): curr_date;
    var yyyyMMdd = curr_year + "-" + curr_month +"-"+ curr_date;
    return yyyyMMdd;
}    
	
</script> 
</head>

<body>
   <input type="hidden" name="editorText" id="editorTextId" />
   <input type="hidden" name="wordsNumber" id="wordsNumberId" />
  <!-- <form method="post" name="form1" onsubmit="return save()"> -->
	<div class="page_title">公墓信息上报</div>
	<div class="button_bar">
		<button class="common_button" type="submit">提交</button>
	</div>
	<table class="query_form_table">
	   <tr>
	      <th id="title">墓穴信息:</th><td></td><th></th><td></td><th></th><td></td>
	   </tr>
        <tr>
			<th>墓穴证书编号</th>
			<td><input name="" id="" size="12" value=""  style="height:19px;" /><span class="red_star" id="red_star">*</span>
			</td>
			<th>葬式</th>
			<td><input name="" id="" size="12" value=""  style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>墓穴编号</th>
			<td><input name="" id="" size="12" value=""  style="height:19px;"/>
			</td>
		</tr>
		<tr>
			<th>墓穴面积</th>
			<td><input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>净墓面积</th>
			<td><input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>绿化面积</th>
			<td>
				<input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
		</tr>
		<tr>
			<th>墓穴穴数</th>
			<td>
			   <input name=""  id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>墓穴价格</th>
			<td>
			   <input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th></th><td></td>
		</tr>
		<tr>
			<th id="title">使用人信息:</th><td></td><th></th><td></td><th></th><td></td>
			
		</tr>
		
		
		<tr>
			<th>使用人姓名</th>
			<td>
				 <input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>年龄</th>
			<td>
			   <input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>性别</th>
		    <td>
			   <input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
		    </td>
					
		</tr>
		<tr>
		    <th>身份证件类型</th>
			<td>
			    <input name=""  id="" size="12" style="height:19px;" /><span class="red_star" id="red_star">*</span>
			</td>
			<th>身份证件编号</th>
			<td><input name="" id="" size="12" style="height:19px;"  />
			</td>
			<th>与认购人关系</th>
			<td><input name="" id="" size="12" style="height:19px;" /><span class="red_star" id="red_star">*</span>
			</td>
			
		</tr>
		<tr>
		    <th>出生日期</th>
			<td><input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>墓穴类型</th>
			<td><input name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>死亡日期</th>
			<td><input type="text" name="" id="" size="12" style="height:19px;" />
			</td>
		</tr>
		<tr>
			
			<th>落葬日期</th>
			<td><input type="text" name="" id="" size="12" style="height:19px;"/></td>
			<th>遗体火化证明编号</th>
			<td><input type="text" name="" id="" size="12" style="height:19px;"/></td>
			<th>来源省市</th>
			<td><input type="text" name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span></td>
		</tr>
		<tr>
			<th>来源市区</th>
			<td><input type="text" name="" id="" size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span></td>
			<th>来源区县</th>
			<td><input type="text" name="" id="" size="12" style="height:19px;"/></td>
			<th>详细地址</th>
			<td><input type="text" name="" id="" size="12" style="height:19px;"/></td>
		</tr>
		<tr>
			<th id="title">认购人信息：</th>
			<td></td>
			<th></th>
			<td></td>
			<th></th>
			<td></td>
			
		</tr>
		
		<tr>
			<th>认购人姓名</th>
			<td>
			   <input name=""  size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>身份证件类型</th>
			<td>
			   <input name=""  size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>身份证件编号</th>
			<td><input name="" id="" size="12" style="height:19px;"/>
			</td>
		</tr>
		<tr>
			<th>联系电话</th>
			<td><input name=""  size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>经办日期</th>
			<td>
			   <input name=""  size="12" style="height:19px;"/><span class="red_star" id="red_star">*</span>
			</td>
			<th>详细地址</th>
			<td>
			<input name=""  size="12" style="height:19px;"/>
			</td>
		</tr>
		<tr>
			
			<th id="title">维护费信息:</th>
			<td></td>
			<th></th>
			<td></td>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<th>维护费年限</th>
			<td><input name=""  size="12" style="height:19px;"/></td>
			<th>开始日期</th>
			<td><input name=""  size="12" style="height:19px;"/></td>
			<th>结束日期</th>
			<td><input name=""  size="12" style="height:19px;"/></td>
		</tr>
		<tr>
			<th>维护费费用</th>
			<td><input name=""  size="12" style="height:19px;"/></td>
			<th></th>
			<td></td>
			<th></th>
			<td></td>
		</tr>
		
	</table>

</body>
</html>
