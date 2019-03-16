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
a {
	text-decoration: none;
}

a:hover {
	color: #2894ff;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
        $("#mqmcId").change(function () {
            $.get("findByMqmcIdAndZeroOfDMPB/"+encodeURI(encodeURI($("#mqmcId").val())),function(data){
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
    	 $("#searchId").click(function () {
    	    var showMqmcId =  $("#showMqmcId");
		   var showMxmc = $("#showMxmc");
		   var showMxlb = $("#showMxlb");
    	 	var mqmcId = $("#mqmcId").val();
	     	var mxmcId = $("#mxmcId").val();
	        var datas={
		   		'mqmcId':mqmcId,
		   		'mxmcId':mxmcId
	        };
	     	$.ajax({
			 type: "POST",
			 url:"<%=path%>/searchDingmu.html",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
				$(this).val("");
				showMqmcId.val(data.mqmcId);
				showMxmc.val(data.mxmc);
				showMxlb.val(data.mxlb);	
			 },
			 error:function(data){
				alert("出错了！！:"+data);
			 }
			
	    	 });	
    	});
    });
   /*  $(document).ready(function () {
    	 $('input:radio[name="dmpb"]').change( function(){
    	    var dmpbValue = $('input[name="dmpb"]:checked').val();
    	 	if(dmpbValue==0){
    	 	    $("#qmje").attr('readonly','readonly');
    	 	    $("#dmrq").attr('readonly','readonly');
    	 	}else{
    	 		$('#qmje').removeAttr("readonly");
    	 		$('#dmrq').removeAttr("readonly")
    	 	}
    	 });
    }); */
    function save(){ 
			var sqrxm = document.getElementById("sqrxm");
     		var lxdh = document.getElementById("lxdh");
     		var lxdz = document.getElementById("lxdz");
     		var qmje = document.getElementById("qmje");
     		var dmrq = document.getElementById("dmrq");
     		var jzyId = document.getElementById("jzyId");
     		var dmskrq = document.getElementById("dmskrq");
     		
     		if(isNull(sqrxm.value)){
     			alert("申请人姓名不能为空！");
     			sqrxm.focus();
     			//return false;
     		}else if(isNull(lxdh.value)){
     			alert("申请人电话不能为空！");
     			lxdh.focus();
     			return false;
     		}else if(isNull(lxdz.value)){
     			alert("申请人地址不能为空！");
     			lxdz.focus();
     			return false;
     		}else if(isNull(jzyId.value)){
     			alert("业务员不能为空！");
     			jzyId.focus();
     			return false;
     		}else if(isNull(dmskrq.value)){
     			alert("定墓收款日期！");
     			dmskrq.focus();
     			return false;
     		}else{
     			alert('保存成功！');
     			document.form1.action="<%=path%>/dingmuGetAdd.html";
			    document.form1.submit();
     		}
     		 
			
		}
	
	function isNull(str) {
		
		  if ( str == "" ) {
		
		    return true;
		
		  }
		  var regu = "^[ ]+$";
		
		  var re = new RegExp(regu);
		
		  return re.test(str);
		
		}
   
</script>
</head>

<body>
	
		<div class="page_title">定墓管理&gt;定墓新建</div>
		
		<div class="button_bar">
			<button class="common_button" type="submit" onclick="save()">保存</button>
		</div>
		
		<table class="query_form_table">
			<tr>
				<th>墓区名称</th>
				<td><select name="mqmc" id="mqmcId" style="width:92px">
						<option value="">选择墓区</option>
							<c:forEach var="mq" items="${muquList}">
								<option value="${mq.mqmc}" ${mq.mqmc == param['mqmc']?'selected':''}>${mq.mqmc}</option>
							</c:forEach>
				</select></td>
				<th>墓穴名称</th>
				<td><select name="mxmcOption" id="mxmcId" style="width:92px">
						<option value="">选择墓穴</option>

				</select>
				</td>
				<th><button id="searchId" type="submit">查询</button>
				</th>
				<td>&nbsp;</td>
			</tr>
           </table>
          
        <form method="post" name="form1" >
        <table class="query_form_table">
			<tr>
				<th>墓区名称</th>
				<td><input name="mqmcId" id="showMqmcId" readonly size="10" /></td>
				<th>墓穴名称</th>
				<td><input name="mxmc"  id="showMxmc" readonly size="10" /></td>
				<th>墓穴类别</th>
				<td><input name="mxlb" id="showMxlb" readonly size="10" /></td>
			</tr>
			<tr>
				<th>申请人姓名</th>
				<td>
				<input name="sqrxm" id="sqrxm" value="" size="10" /><span class="red_star">*</span>
				</td>
				<th>申请人电话</th>
				<td><input name="lxdh" value="" id="lxdh" size="10" /><span class="red_star">*</span>
				</td>
				<th>申请人地址</th>
				<td><input name="lxdz" value="" id="lxdz" size="10" /><span class="red_star">*</span>
				</td>
			</tr>
			<tr>
				<!-- <th>是否定墓</th>
				<td>
					<input type="text" name="dmpb" value="已定墓"  readonly/>
				    
				</td> -->
					
				
				<th>定墓金额</th>
				<td><input name="qmje"  size="10" id="qmje" /><span class="red_star">*</span>
				</td>
				<th>定墓日期</th>
				<td><input id="dmrq" name="dmrq" size="10" type="text" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/><span
					class="red_star">*</span></td>
					<th>业务员</th>
				<td><select name="jzyId" style="width:93px" id="jzyId">
						<option value="">全部</option>

						<c:forEach var="ul" items="${userList }">

							<option value="${ul.id}"
								<c:if test="${user == ul.user}">
						          selected=selected
						       </c:if>>${ul.user
								}</option>

						</c:forEach>

				</select><span class="red_star">*</span></td>
			</tr>
			<tr>
				

				<th>预付收款日期</th>
				<td><input id="dmskrq" name="dmskrq" size="10" type="text" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/><span
					class="red_star">*</span></td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>备注</th>
				<td colspan="4"><textarea rows="6" cols="33" name="bz"></textarea><span
					class="red_star">*</span></td>
				<td></td>
			</tr>
			
		</table>
	</form>
</body>
</html>
