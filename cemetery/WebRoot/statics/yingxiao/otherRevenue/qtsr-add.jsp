<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'qtsr-add.jsp' starting page</title>
    
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
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	  
	  </style> 
     <script type="text/javascript">
         /* 计算 */
		/* $(document).ready(function (){
		 
	      var je1Count = 0 ;
	      var je2Count = 0 ;
	      var je3Count = 0 ;
	      var je4Count = 0 ;
	      var je5Count = 0 ;
	      var je6Count = 0 ;
	      var je7Count = 0 ;
	      var je8Count = 0 ;
          var qtsrhj = $("#qtsrhjId"); 
          
         $("#je1Id").blur(function(){
          var je1Id = $("#je1Id").val();
        
          if (je1Id.indexOf(".")< 0) {
				$("#je1Id").val(je1Id+".00");
		  }
		 
          je1IdCount = parseFloat(je1Id);
          if(isNaN(je1IdCount)){
               je1IdCount=0.00;
          }
          qtsrhjCount = je1IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
          $("#je2Id").blur(function(){
          var je2Id = $("#je2Id").val();
        
          if (je2Id.indexOf(".")< 0) {
				$("#je2Id").val(je2Id+".00");
		  }
		 
          je2IdCount = parseFloat(je2Id);
          if(isNaN(je2IdCount)){
               je2IdCount=0.00;
          }
          qtsrhjCount = je1IdCount + je2IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
         $("#je3Id").blur(function(){
          var je3Id = $("#je3Id").val();
        
          if (je3Id.indexOf(".")< 0) {
				$("#je3Id").val(je3Id+".00");
		  }
		 
          je3IdCount = parseFloat(je3Id);
          if(isNaN(je3IdCount)){
               je3IdCount=0.00;
          }
          qtsrhjCount = je1IdCount + je2IdCount + je3IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
         $("#je4Id").blur(function(){
          var je4Id = $("#je4Id").val();
        
          if (je4Id.indexOf(".")< 0) {
				$("#je4Id").val(je4Id+".00");
		  }
		 
          je4IdCount = parseFloat(je4Id);
          if(isNaN(je4IdCount)){
               je4IdCount=0.00;
          }
          qtsrhjCount = je1IdCount + je2IdCount + je3IdCount + je4IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
          $("#je5Id").blur(function(){
          var je5Id = $("#je5Id").val();
        
          if (je5Id.indexOf(".")< 0) {
				$("#je5Id").val(je5Id+".00");
		  }
		 
          je5IdCount = parseFloat(je5Id);
          if(isNaN(je5IdCount)){
               je5IdCount=0.00;
          }
          qtsrhjCount = je1IdCount + je2IdCount + je3IdCount + je4IdCount + je5IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
          $("#je6Id").blur(function(){
          var je6Id = $("#je6Id").val();
        
          if (je6Id.indexOf(".")< 0) {
				$("#je6Id").val(je6Id+".00");
		  }
		 
          je6IdCount = parseFloat(je6Id);
          if(isNaN(je6IdCount)){
               je6IdCount=0.00;
          }
          qtsrhjCount = je1IdCount + je2IdCount + je3IdCount + je4IdCount + je5IdCount + je6IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
          $("#je7Id").blur(function(){
          var je7Id = $("#je7Id").val();
        
          if (je7Id.indexOf(".")< 0) {
				$("#je7Id").val(je7Id+".00");
		  }
		 
          je7IdCount = parseFloat(je7Id);
          if(isNaN(je7IdCount)){
               je7IdCount=0.00;
          }
          qtsrhjCount = je1IdCount + je2IdCount + je3IdCount + je4IdCount + je5IdCount + je6IdCount + je7IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
          $("#je8Id").blur(function(){
          var je8Id = $("#je8Id").val();
        
          if (je8Id.indexOf(".")< 0) {
				$("#je8Id").val(je8Id+".00");
		  }
		 
          je8IdCount = parseFloat(je8Id);
          if(isNaN(je8IdCount)){
               je8IdCount=0.00;
          }
          qtsrhjCount = je1IdCount + je2IdCount + je3IdCount + je4IdCount + je5IdCount + je6IdCount + je7IdCount + je8IdCount;
         qtsrhj.val(qtsrhjCount.toFixed(2));
         });
         
         
      }); */
      $(document).ready(function (){
          $("#calculate").click(function(){
          		var je1Id = $("#je1Id").val();
          		if (je1Id=="") {
				    $("#je1Id").val("0.00");
		        }else{
		        	if (je1Id.indexOf(".")< 0) {
					  $("#je1Id").val(je1Id+".00");
			        }
		        }
		        
          		var je2Id = $("#je2Id").val();
          		if (je2Id=="") {
				    $("#je2Id").val("0.00");
		        }else{
			        if (je2Id.indexOf(".")< 0) {
					  $("#je2Id").val(je2Id+".00");
			        }
		        }
          		var je3Id = $("#je3Id").val();
          		if (je3Id=="") {
				    $("#je3Id").val("0.00");
		        }else{
			        if (je3Id.indexOf(".")< 0) {
					  $("#je3Id").val(je3Id+".00");
			        }
		        }
          		var je4Id = $("#je4Id").val();
          		if (je4Id=="") {
				    $("#je4Id").val("0.00");
		        }else{
			        if (je4Id.indexOf(".")< 0) {
					  $("#je4Id").val(je4Id+".00");
			        }
		        }
          		var je5Id = $("#je5Id").val();
          		if (je5Id=="") {
				    $("#je5Id").val("0.00");
		        }else{
		        	if (je5Id.indexOf(".")< 0) {
					  $("#je5Id").val(je5Id+".00");
			        }
		        }
          		var je6Id = $("#je6Id").val();
          		if (je6Id=="") {
				    $("#je6Id").val("0.00");
		        }else{
		        	if (je6Id.indexOf(".")< 0) {
					  $("#je6Id").val(je6Id+".00");
			        }
		        }
          		var je7Id = $("#je7Id").val();
          		if (je7Id=="") {
				    $("#je7Id").val("0.00");
		        }else{
		        	if (je7Id.indexOf(".")< 0) {
					  $("#je7Id").val(je7Id+".00");
			        }
		        }
          		var je8Id = $("#je8Id").val();
          		if (je8Id=="") {
				    $("#je8Id").val("0.00");
		        }else{
		        	if (je8Id.indexOf(".")< 0) {
					  $("#je8Id").val(je8Id+".00");
			        }
		        }
		        var je1IdCount = parseFloat(je1Id);
		        if(isNaN(je1IdCount)){
		        	je1IdCount=0.00;
		        }
		        var je2IdCount = parseFloat(je2Id);
		         if(isNaN(je2IdCount)){
		        	je2IdCount=0.00;
		        }
		        var je3IdCount = parseFloat(je3Id);
		        if(isNaN(je3IdCount)){
		        	je3IdCount=0.00;
		        }
		        var je4IdCount = parseFloat(je4Id);
		        if(isNaN(je4IdCount)){
		        	je4IdCount=0.00;
		        }
		        var je5IdCount = parseFloat(je5Id);
		        if(isNaN(je5IdCount)){
		        	je5IdCount=0.00;
		        }
		        var je6IdCount = parseFloat(je6Id);
		        if(isNaN(je6IdCount)){
		        	je6IdCount=0.00;
		        }
		        var je7IdCount = parseFloat(je7Id);
		        if(isNaN(je7IdCount)){
		        	je7IdCount=0.00;
		        }
		        var je8IdCount = parseFloat(je8Id);
		        if(isNaN(je8IdCount)){
		        	je8IdCount=0.00;
		        }
		        var totalCount = je1IdCount+je2IdCount+je3IdCount+je4IdCount+je5IdCount+je6IdCount+je7IdCount+je8IdCount;
          		$("#qtsrhjId").val(totalCount.toFixed(2));
          });
      }); 
    /*   $(document).ready(function (){
      $("#qtjfrqId").val(new Date( ).toLocaleDateString());
      }); */
     </script>

  </head>
  
  <body>
   <form  method="post" action="${pageContext.request.contextPath }/qtsrAdd.html"> 
    <div class="page_title">营销管理&gt;其他收入&gt;其他收入新增</div>
    <div class="button_bar">
	<button class="common_button" type="submit">保存</button>
	</div>
	  <table class="query_form_table">
	    <tr>
				
				<th>交费日期</th>
				<td><input class="Wdate"  type="text"  name="qtjfrq"  id="qtjfrqId"   onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" size="10" /></td>
				<th>&nbsp;</th><td>&nbsp;</td>
				
		</tr>
		 <tr>
				
				<th>项目1</th>
				<td><input name="xm1" type="text" style="height:22px;" size="36"/></td>
				<th>金额1</th>
				<td><input name="je1" type="text" id="je1Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>项目2</th>
				<td><input name="xm2" type="text" style="height:22px;" size="36"/></td>
				<th>金额2</th>
				<td><input name="je2" type="text" id="je2Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>项目3</th>
				<td><input name="xm3" type="text"  style="height:22px;" size="36"/></td>
				<th>金额3</th>
				<td><input name="je3" type="text" id="je3Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>项目4</th>
				<td><input name="xm4" type="text"  style="height:22px;" size="36"/></td>
				<th>金额4</th>
				<td><input name="je4" type="text" id="je4Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>项目5</th>
				<td><input name="xm5" type="text" style="height:22px;" size="36"/></td>
				<th>金额5</th>
				<td><input name="je5" type="text" id="je5Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>项目6</th>
				<td><input name="xm6" type="text"  style="height:22px;" size="36"/></td>
				<th>金额6</th>
				<td><input name="je6" type="text" id="je6Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>项目7</th>
				<td><input name="xm7" type="text" style="height:22px;" size="36"/></td>
				<th>金额7</th>
				<td><input name="je7" type="text" id="je7Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>项目8</th>
				<td><input name="xm8" type="text"  style="height:22px;" size="36"/></td>
				<th>金额8</th>
				<td><input name="je8" type="text"  id="je8Id" size="12" style="height:22px;"/><span>元</span></td>
				
		</tr>
		<tr>
				
				<th>&nbsp;</th><td>&nbsp;</td>
				<th>收入合计</th>
				<td>
					<input name="qtsrhj" type="text" size="12" id="qtsrhjId" style="height:22px;" readonly="readonly"/><span>元</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="calculate" type="button">计算</button>
				</td>
				
				
		</tr>
				
	  </table>
	</form>
  </body>
</html>
