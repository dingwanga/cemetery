<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tombDecoration-add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	 <script src="statics/js/common.js"></script>
	 <script src="statics/js/jquery-2.1.4.min.js"></script>
     <script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	     select{
	     	width: 65px;
            height: 20px;
	     }
	  </style> 
	  <script type="text/javascript">
	      $(document).ready(function () {
	    	 $("#searchZhuangxiuId").click(function () {
	    	   var showSgdbh =  $("#showSgdbh");
			   //var showDmrq = $("#showDmrq");
			   var showLxrxm = $("#showLxrxm");
			   var showLxrdh =  $("#showLxrdh");
			   var showLxrdz = $("#showLxrdz");
			   var showMqmcId = $("#showMqmcId");
			   var showMxmc =  $("#showMxmc");
			   //var showMxlb = $("#showMxlb");
			   var showSyrxm1 = $("#showSyrxm1");
			   var showSyrxm2 = $("#showSyrxm2");
			   var showSyrxm3 = $("#showSyrxm3");
			   var showSyrxm4 = $("#showSyrxm4");
			   var showSy1qk = $("#showSy1qk");
			   var showSy2qk = $("#showSy2qk");
			   var showSy3qk = $("#showSy3qk");
			   var showSy4qk = $("#showSy4qk");
			   
			   var sfwgId = $("#sfwgId");
			   var sfszpId = $("#sfszpId");
			   var szrqId = $("#szrqId");
			   var sfghzpId = $("#sfghzpId");
			   var zpghrqId = $("#zpghrqId");
			   var sftcxId = $("#sftcxId");
			   var sfzxwgId = $("#sfzxwgId");
			   var qtdj1Id = $("#qtdj1Id");
			   var qtdj2Id = $("#qtdj2Id");
			   var qtdj3Id = $("#qtdj3Id");
			   var qtdj4Id = $("#qtdj4Id");
	    	   var sgdbhId = $("#sgdbhId").val();
		     	
		        var datas={
			   		'sgdbhId':sgdbhId
		        };
		     	$.ajax({
				 type: "POST",
				 url:"<%=path%>/queryConstructionSchedule.html",
				 data:datas,
				 async:false,
				 dataType: "json",
				 success:function(data){
					$(this).val("");
					showSgdbh.val(data.sgdbh);
					//showDmrq.val(data.dmrq);
					showLxrxm.val(data.lxrxm);
					showLxrdh.val(data.lxrdh);
					showLxrdz.val(data.lxrdz);
					showMqmcId.val(data.mqmcId);
					showMxmc.val(data.mxmc);
					//showMxlb.val(data.mxlb);
					showSyrxm1.val(data.syrxm1);
					showSyrxm2.val(data.syrxm2);
					showSyrxm3.val(data.syrxm3);
					showSyrxm4.val(data.syrxm4);
					showSy1qk.val(data.sy1qk);
					showSy2qk.val(data.sy2qk);
					showSy3qk.val(data.sy3qk);
					showSy4qk.val(data.sy4qk);
					sfwgId.val(data.sfwg);
					sfszpId.val(data.sfszp);
					szrqId.val(data.szrq.substring(0,10));
					sfghzpId.val(data.sfghzp);
					zpghrqId.val(data.zpghrq.substring(0,10));
					sftcxId.val(data.sftcx);
					sfzxwgId.val(data.sfzxwg);
					qtdj1Id.val(data.qtdj1);
					qtdj2Id.val(data.qtdj2);
					qtdj3Id.val(data.qtdj3);
					qtdj4Id.val(data.qtdj4);
					$("#remark").val(data.bz);
				 },
				 error:function(data){
					alert("出错了！！:"+data);
				 }
				
		    	 });
		    });	
		});
		 $(document).ready(function () {
		 	 $("#savesgdjd").click(function () {
		 	 	var sgdbhId = $("#sgdbhId").val();
		 	 	var sfwgId =$("#sfwgId").val();
			    var sfszpId = $("#sfszpId").val();
			    var szrqId = $("#szrqId").val();
			    var sfghzpId = $("#sfghzpId").val();
			    var zpghrqId = $("#zpghrqId").val();
			    var sftcxId = $("#sftcxId").val();
			    var sfzxwgId =$("#sfzxwgId").val();
			    var qtdj1Id = $("#qtdj1Id").val();
			    var qtdj2Id = $("#qtdj2Id").val();
			    var qtdj3Id = $("#qtdj3Id").val();
			    var qtdj4Id = $("#qtdj4Id").val();
			    var remark = $("#remark").val();
		        var datas={
			   		'sgdbhId':sgdbhId,
			   		'sfwg':sfwgId,
			   		'sfszp':sfszpId,
			   		'szrqId':szrqId,
			   		'sfghzp':sfghzpId,
			   		'zpghrqId':zpghrqId,
			   		'sftcx':sftcxId,
			   		'sfzxwg':sfzxwgId,
			   		'qtdj1Id':qtdj1Id,
			   		'qtdj2Id':qtdj2Id,
			   		'qtdj3Id':qtdj3Id,
			   		'qtdj4Id':qtdj4Id,
			   		'remark':remark
		        };
		        $.ajax({
				 type: "POST",
				 url:"<%=path%>/updateSgjd.html",
				 data:datas,
				 async:false,
				 dataType: "json",
				 success:function(data){}
				 });
				
		 	 });
		 });
	  </script>
  </head>
  
  <body>
  <%-- <form action="${pageContext.request.contextPath }/updateSgjd.html" method="post"> --%>
     <div class="page_title">营销管理&gt;施工进度</div>
    <div class="button_bar">
	<button class="common_button" id="savesgdjd" type="submit" >保存</button>
	</div>
	

        <table class="query_form_table">
         <tr>			
			<th>施工单编号</th>
			<td><input name="sgdbhId" id="sgdbhId" size="12" style="height:20px;" /></td>
			<th><button id="searchZhuangxiuId" type="button">查询</button></th>
				<td>&nbsp;</td>
				<th>&nbsp;</th><td>&nbsp;</td>
	    </tr>
	     <tr>			
			<th>施工单编号</th>
			<td><input name="sgdbh"  id="showSgdbh" readonly size="12" style="height:20px;"/></td>
			<th>墓区名称</th>
			<td><input name="mqmcId" id="showMqmcId" readonly size="12" style="height:20px;"/></td>
			<th>墓穴名称</th>
			<td><input name="mxmc"  id="showMxmc" readonly size="12" style="height:20px;"/></td>
	    </tr>
	     <tr>
	        <th>联系人姓名</th>
			<td><input name="lxrxm" id="showLxrxm" readonly size="12" style="height:20px;"/></td>			
			<th>联系人电话</th>
			<td><input name="lxrdh" id="showLxrdh" readonly size="12" style="height:20px;"/></td>
			<th>联系人地址</th>
			<td><input name="lxrdz" id="showLxrdz" readonly size="30" style="height:20px;"/></td>
	    </tr>
	   
	    <tr>			
			<th>使用人姓名</th>
			<td>
			<input name="syrxm1" id="showSyrxm1" readonly size="10" style="height:20px;"/>-<input name="sy1qk"  id="showSy1qk" readonly size="5" /></td>
			<th><input name="syrxm2" id="showSyrxm2" readonly size="10" style="height:20px;"/>-<input name="sy2qk"  id="showSy2qk" readonly size="5" /></th>
			
			<td><input name="syrxm3" id="showSyrxm3" readonly size="10" style="height:20px;"/>-<input name="sy3qk"  id="showSy3qk" readonly size="5" /></td>
			
			<th><input name="syrxm4" id="showSyrxm4" readonly size="10" style="height:20px;"/>-<input name="sy4qk"  id="showSy4qk" readonly size="5" /></th>
			
			<td>&nbsp;</td>
	    </tr>
	   <tr>			
			<th>手续寄全或照片邮寄：</th>
			<td colspan="5"></td>
			
	    </tr>
	    <tr>			
			<th>是否完工</th>
			<td>
				<select name="sfwg" id="sfwgId">
				  <option>是</option>
				  <option selected = "selected">否</option>
				</select>
			<!-- <input type="radio" name="sfwg" id="sfwgId" value="0">是 
                <input type="radio" name="sfwg" id="sfwgId" value="1">否 -->
            </td>
			<th>是否收到照片</th>
			<td>
			    <select name="sfszp" id="sfszpId">
				  <option>是</option>
				  <option selected = "selected">否</option>
				</select>
			   <!--  <input type="radio" name="sfszp" id="sfszpId" value="0">是 
                <input type="radio" name="sfszp" id="sfszpId" value="1">否 -->
            </td>
			<th>收到照片日期</th>
			<td><input name="szrq" id="szrqId" size="10" style="height:20px;" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
	    </tr>
	    <tr>			
			<th>瓷像情况：</th>
			<td colspan="5"></td>
			
	    </tr>
	    <tr>			
			<th>是否更换照片</th>
			<td>
				<select name="sfghzp" id="sfghzpId">
				  <option>是</option>
				  <option selected = "selected">否</option>
				</select>
			   <!--  <input type="radio" name="sfghzp" id="sfghzpId"  value="0">是 
                <input type="radio" name="sfghzp" id="sfghzpId" value="1">否 -->
            </td>
            <th>更换照片日期</th>
			<td><input name="zpghrq" id="zpghrqId" style="height:20px;" size="10" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
			<th>瓷像是否已贴</th>
			<td>
				<select name="sftcx" id="sftcxId">
				  <option>是</option>
				  <option selected = "selected">否</option>
				</select>
			    <!-- <input type="radio" name="sftcx" id="sftcxId" value="0">是 
                <input type="radio" name="sftcx" id="sftcxId" value="1">否 -->
            </td>
			
	    </tr>
	     <tr>			
			<th>装修情况：</th>
			<td colspan="5"></td>
			
	    </tr>
	    <tr>			
			<th>装修是否完工</th>
			<td>
			   <select name="sfzxwg" id="sfzxwgId">
				  <option>是</option>
				  <option selected = "selected">否</option>
				</select>
			    <!-- <input type="radio" name="sfzxwg" id="sfzxwgId" value="0">是 
                <input type="radio" name="sfzxwg" id="sfzxwgId" value="1">否 -->
            </td>
            <th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td>
        </tr>
	     <tr>
		<th>其他登记(1)</th>
		<td colspan="5"><input name="qtdj1"  id="qtdj1Id" size="52" style="height:20px;"/></td>
	    </tr>
	    <tr>
		<th>其他登记(2)</th>
		<td colspan="5"><input name="qtdj2"  id="qtdj2Id" size="52" style="height:20px;"/></td>
	    </tr>
	    <tr>
		<th>其他登记(3)</th>
		<td colspan="5"><input name="qtdj3"  id="qtdj3Id" size="52" style="height:20px;"/></td>
	    </tr>
	    <tr>
		<th>其他登记(4)</th>
		<td colspan="5"><input name="qtdj4"  id="qtdj4Id" size="52" style="height:20px;"/></td>
	    </tr>
	    <tr>
		<th>备注</th>
		<td colspan="5"><textarea rows="6" cols="39" id="remark"></textarea></td>
	    </tr>
        </table>
 <!-- 	</form> -->
  </body>
</html>
