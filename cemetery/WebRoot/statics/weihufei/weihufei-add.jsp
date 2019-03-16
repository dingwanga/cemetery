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
	  <script src="statics/pugin/My97DatePicker/WdatePicker.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	      html,body{
			overflow-x:hidden;
		 }
		 .data_list_table{
			width:100%;
		 }
	  
	  </style> 
	  <script type="text/javascript">
	     var glfcount = 0;
	     <%-- $(document).ready(function () {
	    	 $("#searchWhfId").click(function () {
	    	   var showSgdbh =  $("#showSgdbh");
			   var showDmrq = $("#showDmrq");
			   var showLxrxm = $("#showLxrxm");
			   var showLxrdh =  $("#showLxrdh");
			   var showLxrdz = $("#showLxrdz");
			   var showLxryb = $("#showLxryb");
			   var showMqmcId = $("#showMqmcId");
			   var showMxmc =  $("#showMxmc");
			   var showMxlb = $("#showMxlb");
			   var showSyrxm1 = $("#showSyrxm1");
			   var showSyrxm2 = $("#showSyrxm2");
			   var showSyrxm3 = $("#showSyrxm3");
			   var showSyrxm4 = $("#showSyrxm4");
			   var showSy1qk = $("#showSy1qk");
			   var showSy2qk = $("#showSy2qk");
			   var showSy3qk = $("#showSy3qk");
			   var showSy4qk = $("#showSy4qk");
			   var showSsmc = $("#showSsmc");
			   var showQxmc = $("#showQxmc");
			   var glf = $("#showGlf");
			   var wfns = $("#showWfns");
	    	   var sgdbhId = $("#sgdbhId").val();
		     	
		        var datas={
			   		'sgdbhId':sgdbhId
		        };
		     	$.ajax({
				 type: "POST",
				 url:"<%=path%>/searchWhf.html",
				 data:datas,
				 async:false,
				 dataType: "json",
				 success:function(data){
					$(this).val("");
					showSgdbh.val(data.sgdbh);
					showDmrq.val(data.dmrq);
					showLxrxm.val(data.lxrxm);
					showLxrdh.val(data.lxrdh);
					showLxrdz.val(data.lxrdz);
					showLxryb.val(data.lxryb);
					showMqmcId.val(data.mqmcId);
					showMxmc.val(data.mxmc);
					showMxlb.val(data.mxlb);
					if(data.mxlb=='1'){
			        if(typeof(data.glf1)=="undefined"){
			        	data.glf1 = 0;
			          }
			        glf.val(data.glf1.toFixed(2));
			        }else if(data.mxlb=='2'){
			        if(typeof(data.glf2)=="undefined"){
			        	data.glf2 = 0;
			          }
				        glf.val(data.glf2.toFixed(2));
			        }else if(data.mxlb=='3'){
			        if(typeof(data.glf3)=="undefined"){
			        	data.glf3 = 0;
			          }
				        glf.val(data.glf3.toFixed(2));
			        }else if(data.mxlb=='4'){
			        if(typeof(data.glf4)=="undefined"){
			        	data.glf4 = 0;
			          }
				        glf.val(data.glf4.toFixed(2));
			        }else{
			    	  glf.val(data.glf.toFixed(2));
			    	 }
			    	
					showSyrxm1.val(data.syrxm1);
					showSyrxm2.val(data.syrxm2);
					showSyrxm3.val(data.syrxm3);
					showSyrxm4.val(data.syrxm4);
					showSy1qk.val(data.sy1qk);
					showSy2qk.val(data.sy2qk);
					showSy3qk.val(data.sy3qk);
					showSy4qk.val(data.sy4qk);
					showSsmc.val(data.ssmc);
					showQxmc.val(data.qxmc);
				 },
				 error:function(data){
					alert("出错了！！:"+data);
				 }
				
			    	 });	
	    	});
	    }); --%>
		
		    /*维护费年数设置  */
		   function AddWfnsDate() {
		     var startDateStr = $("#startDate").val();
		     var startDate = new Date(Date.parse(startDateStr.replace(/-/g,"/")));
		     var wfns = parseFloat($("#showWfns").val());
			 var endYear = startDate.getFullYear()+wfns;
			 var endMonth = startDate.getMonth()+1;
			 var endDay = startDate.getDate();
		     var endDateStr = endYear+"-"+endMonth+"-"+endDay;
		     $("#endDate").val(endDateStr);
		};
		
	        
	     /* 维护费计算 */
		$(document).ready(function(){
		     wfhjCount = 0;
		     var wfhj = $("#wfhjId");
		    $("#showWfns").blur(function(){
		        var glf = $("#showGlf");
		        var showWfns = $("#showWfns").val();
		        var showGlf = $("#showGlf").val();
		        showGlfCount = parseFloat(showGlf);
		        showWfnsCount = parseFloat(showWfns);
		        wfhjCount =  showGlfCount * showWfnsCount;
		        wfhj.val(wfhjCount.toFixed(2));
			    });
		  });   
	
	     function save(){ 
			var wfksrq = document.getElementById("startDate");
     		var wfns = document.getElementById("showWfns");
     		var wfjsrq = document.getElementById("endDate");
     		var whskrq = document.getElementById("whskrqId");
     		var jzy = document.getElementById("jzyId");
     		if(isNull(wfksrq.value)){
     			alert("维护开始日期不能为空");
     			wfksrq.focus();
     			return false;
     		}else if(isNull(wfns.value)){
     			alert("续交年数不能为空！");
     			wfns.focus();
     			return false;
     		}else if(isNull(wfjsrq.value)){
     			alert("维护结束日期不能为空！");
     			wfjsrq.focus();
     			return false;
     		}else if(isNull(whskrq.value)){
     			alert("维护收款不能为空！");
     			whskrq.focus();
     			return false;
     		}else if(isNull(jzy.value)){
     			alert("结账员不能为空");
     			jzy.focus();
     			return false;
     		}else{
     			alert('保存成功！');
     			document.form1.action="<%=path%>/whfGetAdd.html";
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
		function search(){
			document.form1.action="<%=path%>/weihufei-add.html";
		    document.form1.submit();
		}
	  </script>
</head>

<body>
    <div class="page_title">维护费管理&gt;维护费续交</div>
    <form method="post" name="form1" onsubmit="return save()">
    <div class="button_bar">
	<button class="common_button"  type="submit" >保存</button> 
	</div>


        <table class="query_form_table">
 
			 <tr>			
			<th>施工单编号</th>
			<td><input name="sgdbh" value="${whf.sgdbh}" id="sgdbhId" size="10" style="height:19px;" /></td>
			<th><button id="searchWhfId" type="button" onclick="search()">查询</button></th>
				<td>&nbsp;</td>
				<th>&nbsp;</th><td>&nbsp;</td>
	    </tr>
	     <tr>			
			<th>墓区名称</th>
			<td><input name="mqmcId" id="showMqmcId" value="${whf.mqmcId}" readonly size="10" style="height:19px;" /></td>
			<th>墓穴名称</th>
			<td><input name="mxmc"  id="showMxmc" value="${whf.mxmc}" readonly size="10" style="height:19px;" /></td>
			<th>墓穴类别</th>
			<td><input name="mxlb" id="showMxlb" value="${whf.mxlb}" readonly size="10" style="height:19px;" /></td>
	    </tr>
	     <tr>
	        <th>联系人姓名</th>
			<td><input name="lxrxm" id="showLxrxm" value="${whf.lxrxm}" readonly size="10" style="height:19px;" /></td>			
			<th>联系人电话</th>
			<td><input name="lxrdh" id="showLxrdh"  value="${whf.lxrdh}"  readonly size="10" style="height:19px;" /></td>
			<th>联系人地址</th>
			<td><input name="lxrdz" id="showLxrdz" value="${whf.lxrdz}" readonly size="20" style="height:19px;" /></td>
	    </tr>
	     <tr>
	        <th>定墓日期</th>
			<td><input name="dmrq"  id="showDmrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${whf.dmrq}" type="date" />" readonly size="10" style="height:19px;" /></td>	
			<th>来自区县</th>
			<td><input name="ssmc" id="showSsmc" value="${whf.ssmc}" readonly size="2" style="height:19px;" />-<input name="qxmc" id="showQxmc" value="${whf.qxmc}" readonly size="2" style="height:19px;" /></td>
			<th>邮政编码</th>
			<td><input name="lxryb" id="showLxryb" value="${whf.lxryb}" readonly size="10" style="height:19px;" /></td>
	    </tr>
	   
	   
	    <tr>			
			<th>使用人姓名</th>
			<td>
			<input name="syrxm1" id="showSyrxm1"  value="${whf.syrxm1}" readonly size="8" style="height:19px;"/>-<input name="sy1qk"  id="showSy1qk"  value="${whf.sy1qk}" readonly size="3" style="height:19px;"/></td>
			<th><input name="syrxm2" id="showSyrxm2"  value="${whf.syrxm2}" readonly size="8" style="height:19px;" />-<input name="sy2qk" id="showSy2qk"  value="${whf.sy2qk}" readonly size="3" style="height:19px;"/></th>
			
			<td><input name="syrxm3" id="showSyrxm3"  value="${whf.syrxm3}" readonly size="8" style="height:19px;" />-<input name="sy3qk" id="showSy3qk"  value="${whf.sy3qk}" readonly size="3" style="height:19px;"/></td>
			
			<th><input name="syrxm4" id="showSyrxm4"  value="${whf.syrxm4}" readonly size="8" style="height:19px;" />-<input name="sy4qk" id="showSy4qk"  value="${whf.sy4qk}" readonly size="3" style="height:19px;"/></th>
			
			<td>&nbsp;</td>
	    </tr>
			
		</table>

<br />
				<table class="data_list_table">
						<tr>
							<th>序号</th>
							<th>施工单编号</th>
							<th>维护开始日期</th>
							<th>维护结束日期</th>
							<th>维护数年数</th>
							<th>维护费单价</th>
							<th>维护费合计</th>
							<th>维护日期</th>
						</tr>
						<c:forEach var="wfInfo" items="${wfInfos}" varStatus="status">
						<tr class="" id="id">
							<td>${wfInfo.wfinfonum}</td>
							<td>${wfInfo.sgdbh}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${wfInfo.wfksrq}" type="date" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${wfInfo.wfjsrq}" type="date" /></td>
							<td>${wfInfo.wfns}</td>
							<td>${wfInfo.glf}</td>
							<td>${wfInfo.wfhj}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${wfInfo.whskrq}" type="date" /></td>
						</tr>
						</c:forEach>
				</table>
				<br />
	
	 <table class="query_form_table">
	    <tr>	
			<th>维护费开始日期</th>
			<td><input class="Wdate" name="wfksrq"  id="startDate" type="text"  value="" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" /></td>
			 <th>续交年数</th>
			<td><input name="wfns" id="showWfns" value="10" size="10" onblur = "AddWfnsDate()" style="height:19px;" /></td>	
			<th>维护费结束日期</th>
			<td><input class="Wdate" name="wfjsrq" id="endDate" type="text"  value="" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" /></td>
	    </tr>
	     <tr>
	        <th>维护费/年</th>
	         <c:choose>
	         	<c:when test="${whf.mxlb ==1}">
				    <td><input name="glf" id="showGlf" value="${whf.glf1}" size="12" style="height:19px;" readonly /><span>（元）</span>
			        </td>
				</c:when>
				<c:when test="${whf.mxlb ==2}">
				    <td><input name="glf" id="showGlf" value="${whf.glf2}" size="12" style="height:19px;" readonly /><span>（元）</span>
			        </td>
				</c:when>
				<c:when test="${whf.mxlb ==3}">
				    <td><input name="glf" id="showGlf" value="${whf.glf3}" size="12" style="height:19px;" readonly /><span>（元）</span>
			        </td>
				</c:when>
				<c:when test="${whf.mxlb ==4}">
				    <td><input name="glf" id="showGlf" value="${whf.glf4}" size="12" style="height:19px;" readonly /><span>（元）</span>
			        </td>
				</c:when>
				<c:otherwise>
				   <td><input name="glf" id="showGlf" value="${whf.glf}" size="12" style="height:19px;" readonly /><span>（元）</span>
			        </td>
				</c:otherwise>
	         </c:choose>
			<th>维护费合计</th>
			<td><input name="wfhj"  id="wfhjId" size="10" style="height:19px;" readonly /><span>元</span></td>
			<th>维护交费日期</th>
			<td><input name="whskrq" id="whskrqId"   value="${currentDate}"  size="10" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
	    </tr>
	     <tr>
	         <th>续交次数</th>
			<td><input name="xjcs"  value="${xjcs}" size="10" style="height:19px;" readonly="readonly"/></td>				
			<th>经办人</th>
			<td><select name="jzy" id="jzyId" style="width:92px;height:24px;">
				  <option value="">--请选择--</option>
						<c:forEach var="whf" items="${jzyList }">
							<option value="${whf.jzy}"
								<c:if test="${jzy == whf.jzy}">
						          selected=selected
						       </c:if>>${whf.jzy
								}</option>
						</c:forEach>
			</select></td>
			<th>&nbsp;</th>
			<td>&nbsp;</td>
	    </tr>
	    
	 </table>
	 </form>			
</body>
</html>