<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%=path%>/statics/css/style.css" rel="stylesheet" type="text/css">
	<script src="<%=path%>/statics/js/common.js"></script>
	<script src="<%=path%>/statics/js/jquery-2.1.4.min.js"></script>
    <script src="<%=path%>/statics/pugin/My97DatePicker/WdatePicker.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  	<script type="text/javascript">
       
       $(document).ready(function () {
        $("#mqmcId").change(function () {
            $.get("statics/xitong/findByMqmcIdAndConcessionList/"+encodeURI(encodeURI($("#mqmcId").val())),function(data){
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
       
		  function save(){
     		var check = false;
     		var mqmcId = document.getElementById("mqmcId").value;
     		var mxmc = document.getElementById("mxmcId").value;
     		var taxPreferenceItems = document.getElementById("taxPreferenceItemsId").value;
     		var discountAmount = document.getElementById("discountAmountId").value;
     		var batchNumber = document.getElementById("batchNumberId").value;
     		var dateOfApproval = document.getElementById("dateOfApprovalId").value;
     		var approval = document.getElementById("approvalId").value;
     		if(mqmcId!="" && mxmc!="" && taxPreferenceItems !="" && discountAmount !="" && batchNumber !="" && dateOfApproval !="" && approval !=""){
     			alert('保存成功！');
     			check = true;
     		}else{
     			check = false;
     		}
     	}  
            
	</script>
  </head>
  
  <body>
<form method="post" action="${pageContext.request.contextPath }/statics/xitong/basicData/getBasicData.html"> 
<div class="page_title">系统设置&gt;基础资料设置&gt;基础资料新建 </div>
<div class="button_bar">
	
	<button class="common_button"  type="submit"  onClick="save()">保存</button>  
</div>

  <table class="query_form_table">
		<tr>
					<th>墓区名称</th>
					<td><select name="mqmcId" id="mqmcId" style="width:80px;height:24px;">
							<option value="">选择墓区</option>
								<c:forEach var="mq" items="${muquList}">
									<option value="${mq.mqmc}" ${mq.mqmc == param['mqmc']?'selected':''}>${mq.mqmc}</option>
								</c:forEach>
					</select><span class="red_star">*</span></td>
					<th>墓穴名称</th>
					<td><select name="mxmc" id="mxmcId" style="width:80px;height:24px;">
							<option value="">选择墓穴</option>
	
					</select><span class="red_star">*</span>
					</td>
				
		</tr>
	
	<tr>
		<th>优惠项目</th>
		<td>
			 <select name="taxPreferenceItems" id="taxPreferenceItemsId" style="width:80px;height:24px;" required oninvalid="setCustomValidity('优惠项目不能为空')" oninput="setCustomValidity('')">
						<option value="">请选择</option>
							<option value=1>镇政府</option>
							<option value=0>本单位</option>
				 </select><span class="red_star">*</span>
	    </td>
	    <th>优惠金额</th>
		<td>
			<input id="discountAmountId" name="discountAmount"  style="width:80px;height:20px;" type="text" required oninvalid="setCustomValidity('优惠金额不能为空')" oninput="setCustomValidity('')"/><span class="red_star">*</span>
		</td>
	</tr>
	<tr>
		<th>批单编号</th>
		<td>
			<input id="batchNumberId" name="batchNumber"  style="width:80px;height:20px;" type="text" required oninvalid="setCustomValidity('批单编号不能为空')" oninput="setCustomValidity('')"/><span class="red_star">*</span>
	    </td>
	    <th>审批日期</th>
		<td>
			<input id="dateOfApprovalId" type="text" name="dateOfApproval" value="${currentDate }" style="width:80px;height:20px;" class="Wdate" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" required oninvalid="setCustomValidity('审批日期不能为空')" oninput="setCustomValidity('')"/><span class="red_star">*</span>
		</td>
	</tr>
	<tr>
		<th>审批人</th>
		<td>
			<input id="approvalId" name="approval"  style="width:80px;height:20px;"  type="text"  required oninvalid="setCustomValidity('审批人不能为空')" oninput="setCustomValidity('')"/><span class="red_star">*</span>
	    </td>
	    <th></th><td></td>
	</tr>
</table>
</form>
</body>
</html>
