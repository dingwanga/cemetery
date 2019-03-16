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
	  </style> 
	  <script type="text/javascript">
		    
		     /*瓷像名称获取瓷像单价  */
		    function dj(){ 
			$.get("findCxdjByCxmc/"+$("#cxId").val(),function(data){
		                if(data.status){
		                     document.getElementById('cxdjId').value=data.obj.cxdj; 
		                }
		            },"json");
		    };
		    
	      function save(){ 
   			alert('保存成功！');
   			document.form1.action="<%=path%>/tombDecorationAdd.html";
	        document.form1.submit();
		}
	
	function isNull(str) {
		
		  if ( str == "" ) {
		
		    return true;
		
		  }
		  var regu = "^[ ]+$";
		
		  var re = new RegExp(regu);
		
		  return re.test(str);
		
		}
		
		 $(document).ready(function () {
	    	 $("#searchZhuangxiuId").click(function () {
	    	   var showSgdbh =  $("#showSgdbh");
			   var showDmrq = $("#showDmrq");
			   var showLxrxm = $("#showLxrxm");
			   var showLxrdh =  $("#showLxrdh");
			   var showLxrdz = $("#showLxrdz");
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
			   var jzyId = $("#jzyId");
			   var kzxId = $("#kzxId");
			   var kzxdjId = $("#kzxdjId");
			   var kzfId = $("#kzfId");
			   var kksId = $("#kksId");
			   var kkdjId = $("#kkdjId");
			   var kkfId = $("#kkfId");
			   var cxId = $("#cxId");
			   var cxdjId = $("#cxdjId");
			   var cxgsId = $("#cxgsId");
			   var cxfId = $("#cxfId");
	    	   var sgdbhId = $("#sgdNum").val();
		     	
		        var datas={
			   		'sgdbhId':sgdbhId
		        };
		     	$.ajax({
				 type: "POST",
				 url:"<%=path%>/searchMuxueZhuangxiu.html",
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
					showMqmcId.val(data.mqmcId);
					showMxmc.val(data.mxmc);
					showMxlb.val(data.mxlb);
					showSyrxm1.val(data.syrxm1);
					showSyrxm2.val(data.syrxm2);
					showSyrxm3.val(data.syrxm3);
					showSyrxm4.val(data.syrxm4);
					showSy1qk.val(data.sy1qk);
					showSy2qk.val(data.sy2qk);
					showSy3qk.val(data.sy3qk);
					showSy4qk.val(data.sy4qk);
					jzyId.val(data.jzy);
					kzxId.val(data.kzx);
					kzxdjId.val(data.kzxdj);
					kzfId.val(data.kzf);
					kksId.val(data.kks);
					kkdjId.val(data.kkdj);
					kkfId.val(data.kkf);
					cxId.val(data.cxmc);
					cxdjId.val(data.cxdj);
			        cxgsId.val(data.cxgs);
			        cxfId.val(data.cxf);
				 },
				 error:function(data){
					alert("出错了！！:"+data);
				 }
				
		    	 });	
    	});
    });
	
		/* 计算 */
		/* $(document).ready(function (){
		  var kzfCount = 0 ;
	      var kkfCount = 0 ;
	      var cxfCount = 0 ;
	      var jine1Count = 0 ;
	      var jine2Count = 0 ;
	      var jine3Count = 0 ;
	      var jine4Count = 0 ;
	      var jine5Count = 0 ;
	      var jine6Count = 0 ;
	      var kzf = $("#kzfId");
          var kkf = $("#kkfId");
          var cxf = $("#cxfId");
          var mxjfhj = $("#mxjfhjId"); 
          
         $("#kzxdjId").blur(function(){
         var kzx = $("#kzxId");
         var kzxdj = $("#kzxdjId");
         var kzxId = $("#kzxId").val();
         var kzxdjId = $("#kzxdjId").val();
          if (kzxdjId.indexOf(".")< 0) {
				$("#kzxdjId").val(kzxdjId+".00");
		  }
		  if(isNaN(kzxId)){
                    alert("你输入的数字不合法!");
                    $("#kzxId").val();
          }
          kzxIdCount = parseFloat(kzxId);
          if(isNaN(kzxIdCount)){
               kzxIdCount=0.00;
          }
          kzxdjIdCount = parseFloat(kzxdjId);
           if(isNaN(kzxdjId)){
               kzxdjId=0.00;
          }
          kzfIdCount =  kzxIdCount * kzxdjIdCount;
          kzf.val(kzfIdCount.toFixed(2));
          mxjfhjCount = kzfIdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          
      });
      
       $("#kkdjId").blur(function(){
         var kks = $("#kksId");
         var kksdj = $("#kkdjId");
         var kksId = $("#kksId").val();
         var kkdjId = $("#kkdjId").val();
          if (kkdjId.indexOf(".")< 0) {
				$("#kkdjId").val(kkdjId+".00");
		  }
		  if(isNaN(kksId)){
                    alert("你输入的数字不合法!");
                    $("#kksId").val();
          }
          kksIdCount = parseFloat(kksId);
          if(isNaN(kksIdCount)){
               kksIdCount=0.00;
          }
          kkdjIdCount = parseFloat(kkdjId);
           if(isNaN(kkdjId)){
               kkdjId=0.00;
          }
          kkfIdCount =  kksIdCount * kkdjIdCount;
          kkf.val(kkfIdCount.toFixed(2));
           mxjfhjCount = kzfIdCount + kkfIdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          
      });
      
       $("#cxgsId").blur(function(){
         var cxgs = $("#cxgsId");
         var cxdj = $("#cxdjId");
         var cxgsId = $("#cxgsId").val();
         var cxdjId = $("#cxdjId").val();
          if (cxdjId.indexOf(".")< 0) {
				$("#cxdjId").val(cxdjId+".00");
		  }
		  if(isNaN(cxgsId)){
                    alert("你输入的数字不合法!");
                    $("#cxgsId").val();
          }
          cxgsIdCount = parseFloat(cxgsId);
          if(isNaN(cxgsIdCount)){
               cxgsIdCount=0.00;
          }
          cxdjIdCount = parseFloat(cxdjId);
           if(isNaN(cxdjId)){
               cxdjId=0.00;
          }
          cxfIdCount =  cxgsIdCount * cxdjIdCount;
          cxf.val(cxfIdCount.toFixed(2));
          mxjfhjCount = kzfIdCount + kkfIdCount + cxfIdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          });
          
          $("#jine1Id").blur(function(){
          var jine1Id = $("#jine1Id").val();
          if (jine1Id.indexOf(".")< 0) {
				$("#jine1Id").val(jine1Id+".00");
		  } 
          jine1IdCount = parseFloat(jine1Id);
          if(isNaN(jine1IdCount)){
		     jine1IdCount = 0.00;
          }
          mxjfhjCount = kzfIdCount + kkfIdCount + cxfIdCount + jine1IdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          });
          
           $("#jine2Id").blur(function(){
          var jine2Id = $("#jine2Id").val();
          if (jine2Id.indexOf(".")< 0) {
				$("#jine2Id").val(jine2Id+".00");
		  } 
          jine2IdCount = parseFloat(jine2Id);
          if(isNaN(jine2IdCount)){
		     jine2IdCount = 0.00;
          }
          mxjfhjCount = kzfIdCount + kkfIdCount + cxfIdCount + jine1IdCount + jine2IdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          });
          
           $("#jine3Id").blur(function(){
          var jine3Id = $("#jine3Id").val();
          if (jine3Id.indexOf(".")< 0) {
				$("#jine3Id").val(jine3Id+".00");
		  } 
          jine3IdCount = parseFloat(jine3Id);
          if(isNaN(jine3IdCount)){
		     jine3IdCount = 0.00;
          }
          mxjfhjCount = kzfIdCount + kkfIdCount + cxfIdCount + jine1IdCount + jine2IdCount + jine3IdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          });
          
           $("#jine4Id").blur(function(){
          var jine4Id = $("#jine4Id").val();
          if (jine4Id.indexOf(".")< 0) {
				$("#jine4Id").val(jine4Id+".00");
		  } 
          jine4IdCount = parseFloat(jine4Id);
          if(isNaN(jine4IdCount)){
		     jine4IdCount = 0.00;
          }
          mxjfhjCount = kzfIdCount + kkfIdCount + cxfIdCount + jine1IdCount + jine2IdCount + jine3IdCount + jine4IdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          });
          
           $("#jine5Id").blur(function(){
          var jine5Id = $("#jine5Id").val();
          if (jine5Id.indexOf(".")< 0) {
				$("#jine5Id").val(jine5Id+".00");
		  } 
          jine5IdCount = parseFloat(jine5Id);
          if(isNaN(jine5IdCount)){
		     jine5IdCount = 0.00;
          }
          mxjfhjCount = kzfIdCount + kkfIdCount + cxfIdCount + jine1IdCount + jine2IdCount + jine3IdCount + jine4IdCount + jine5IdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          });
          
           $("#jine6Id").blur(function(){
          var jine6Id = $("#jine6Id").val();
          if (jine6Id.indexOf(".")< 0) {
				$("#jine6Id").val(jine6Id+".00");
		  } 
          jine6IdCount = parseFloat(jine6Id);
          if(isNaN(jine6IdCount)){
		     jine6IdCount = 0.00;
          }
          mxjfhjCount = kzfIdCount + kkfIdCount + cxfIdCount + jine1IdCount + jine2IdCount + jine3IdCount + jine4IdCount + jine5IdCount + jine6IdCount;
          mxjfhj.val(mxjfhjCount.toFixed(2));
          });
      });
     */
     
     
	 function inscriptionEditor(){
   		 var sgdNum = $("#sgdNum").val();
   		 var kzxId = $("#kzxId").val();
   		 var datas={
	   		'sgdbh':sgdNum,
	   		'wordsNumber':kzxId
	        };
	        $.ajax({
			 type: "POST",
			 url:"<%=path%>/openInscriptionEditor.html",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
			    $(this).val("");
			    alert(data.editorText+data.wordsNumber);
			    $("#editorTextId").val(data.editorText);
			    $("#wordsNumberId").val(data.wordsNumber);
		 }
		
       });	
    	
        var url = '<%=path%>/statics/pugin/UMeditor/inscriptionEditor.jsp';
        var size = 'modal=yes,width=600,height=490,top=210px,left=330px,toolbar=no,menubar=no, scrollbars=no, resizable=no,location=no, status=no';
        sessionStorage.setItem('sgdNum', $("#sgdNum").val());
    	window.open(url,'_blank',size);
    }
    $(document).ready(function(){
       $("#kzxdjId").blur(function(){
           var kzxValue =  $("#kzxId").val();
           /* if (kzxValue=="") {
			    $("#kzxId").val("0.00");
	        }else{
	        	if (kzxValue.indexOf(".")< 0) {
				  $("#kzxId").val(kzxValue+".00");
		        }
	        } */
           var kzxdjValue =  $("#kzxdjId").val();
           if (kzxdjValue=="") {
			    $("#kzxdjId").val("0.00");
	        }else{
	        	if (kzxdjValue.indexOf(".")< 0) {
				  $("#kzxdjId").val(kzxdjValue+".00");
		        }
	        }
           var kzfValue = parseFloat(kzxValue)*parseFloat(kzxdjValue);
       	   $("#kzfId").val(kzfValue.toFixed(2));
       });
        $("#kkdjId").blur(function(){
           var kksValue =  $("#kksId").val();
           /*  if (kksValue=="") {
			    $("#kksId").val("0.00");
	        }else{
	        	if (kksValue.indexOf(".")< 0) {
				  $("#kksId").val(kksValue+".00");
		        }
	        } */
           var kkdjValue =  $("#kkdjId").val();
            if (kkdjValue=="") {
			    $("#kkdjId").val("0.00");
	        }else{
	        	if (kkdjValue.indexOf(".")< 0) {
				  $("#kkdjId").val(kkdjValue+".00");
		        }
	        }
           var kzfValue = parseFloat(kksValue)*parseFloat(kkdjValue);
       	   $("#kkfId").val(kzfValue.toFixed(2));
       });
       
        $("#cxgsId").blur(function(){
      		var cxdjValue = $("#cxdjId").val();
      		if (cxdjValue=="") {
			    $("#cxdjId").val("0.00");
	        }else{
	        	if (cxdjValue.indexOf(".")< 0) {
				  $("#cxdjId").val(cxdjValue+".00");
		        }
	        }
      		var cxgsValue = $("#cxgsId").val();
      		/* if (cxgsValue=="") {
			    $("#cxgsId").val("0.00");
	        }else{
	        	if (cxgsValue.indexOf(".")< 0) {
				  $("#cxgsId").val(cxgsValue+".00");
		        }
	        } */
	        var cxfValue = parseFloat(cxdjValue)*parseFloat(cxgsValue);
	        $("#cxfId").val(cxfValue.toFixed(2));
      		
       });
       $("#calculate").click(function(){
       
              var kzfId = $("#kzfId").val();
              var kkfId =  $("#kkfId").val();
              var cxfId = $("#cxfId").val();
              var jine1Id = $("#jine1Id").val();
              if (jine1Id=="") {
				    $("#jine1Id").val("0.00");
		        }else{
		        	if (jine1Id.indexOf(".")< 0) {
					  $("#jine1Id").val(jine1Id+".00");
			        }
		        }
              var jine2Id = $("#jine2Id").val();
              if (jine2Id=="") {
				    $("#jine2Id").val("0.00");
		        }else{
		        	if (jine2Id.indexOf(".")< 0) {
					  $("#jine2Id").val(jine2Id+".00");
			        }
		        }
              var jine3Id = $("#jine3Id").val();
              if (jine3Id=="") {
				    $("#jine3Id").val("0.00");
		        }else{
		        	if (jine3Id.indexOf(".")< 0) {
					  $("#jine3Id").val(jine3Id+".00");
			        }
		        }
              var jine4Id = $("#jine4Id").val();
              if (jine4Id=="") {
				    $("#jine4Id").val("0.00");
		        }else{
		        	if (jine4Id.indexOf(".")< 0) {
					  $("#jine4Id").val(jine4Id+".00");
			        }
		        }
              var jine5Id = $("#jine5Id").val();
              if (jine5Id=="") {
				    $("#jine5Id").val("0.00");
		        }else{
		        	if (jine5Id.indexOf(".")< 0) {
					  $("#jine5Id").val(jine5Id+".00");
			        }
		        }
              var jine6Id = $("#jine6Id").val();
             if (jine6Id=="") {
				    $("#jine6Id").val("0.00");
		        }else{
		        	if (jine6Id.indexOf(".")< 0) {
					  $("#jine6Id").val(jine6Id+".00");
			        }
		        }
          		var kzfIdCount = parseFloat(kzfId);
		        if(isNaN(kzfIdCount)){
		        	kzfIdCount=0.00;
		        }
		        var kkfIdCount = parseFloat(kkfId);
		        if(isNaN(kkfIdCount)){
		        	kkfIdCount=0.00;
		        }
		        var cxfIdCount = parseFloat(cxfId);
		        if(isNaN(cxfIdCount)){
		        	cxfIdCount=0.00;
		        }
		        var jine1IdCount = parseFloat(jine1Id);
		        if(isNaN(jine1IdCount)){
		        	jine1IdCount=0.00;
		        }
		        var jine2IdCount = parseFloat(jine2Id);
		        if(isNaN(jine2IdCount)){
		        	jine2IdCount=0.00;
		        }
		        var jine3IdCount = parseFloat(jine3Id);
		        if(isNaN(jine3IdCount)){
		        	jine3IdCount=0.00;
		        }
		        var jine4IdCount = parseFloat(jine4Id);
		        if(isNaN(jine4IdCount)){
		        	jine4IdCount=0.00;
		        }
		        var jine5IdCount = parseFloat(jine5Id);
		        if(isNaN(jine5IdCount)){
		        	jine5IdCount=0.00;
		        }
		        var jine6IdCount = parseFloat(jine6Id);
		        if(isNaN(jine6IdCount)){
		        	jine6IdCount=0.00;
		        }
		        
		        var totalCount = kzfIdCount+kkfIdCount+cxfIdCount+jine1IdCount+jine2IdCount+jine3IdCount+jine4IdCount+jine5IdCount+jine6IdCount;
          		$("#mxjfhjId").val(totalCount.toFixed(2));
          	}); 
    });
    
	  </script>
  </head>
  
  <body>
    <div class="page_title">营销管理&gt;墓穴装修&gt;墓穴装修新建</div>
    <input type="hidden" name="editorText" id="editorTextId" />
   <input type="hidden" name="wordsNumber" id="wordsNumberId" />
   <form method="post" name="form1">
    <div class="button_bar">
	<button class="common_button" type="submit" onclick="save()">保存</button>
	</div>
        <table class="query_form_table">
         <tr>			
			<th>施工单编号</th>
			<td><input name="sgdbhId" id="sgdNum" size="12" style="height:25px;" /></td>
			<th><button id="searchZhuangxiuId" type="button">查询</button></th>
				<td>&nbsp;</td>
				<th>&nbsp;</th><td>&nbsp;</td>
	    </tr>
	     <tr>			
			<th>施工单编号</th>
			<td><input name="sgdbh"  id="showSgdbh" readonly size="12" style="height:25px;" /></td> 
			<th>定墓日期</th>
			<td><input name="dmrq"  id="showDmrq" readonly size="12" style="height:25px;" /></td>
			<th>联系人姓名</th>
			<td><input name="lxrxm" id="showLxrxm"  readonly size="12" style="height:25px;" /></td>
	    </tr>
	     <tr>			
			<th>联系人电话</th>
			<td><input name="lxrdh" id="showLxrdh"  readonly size="12" style="height:25px;" /></td>
			<th>联系人地址</th>
			<td><input name="lxrdz" id="showLxrdz"  readonly size="48" /></td>
			<th>&nbsp;</th><td>&nbsp;</td>
			
	    </tr>
	    <tr>			
			<th>墓区名称</th>
			<td><input name="mqmcId" id="showMqmcId"  readonly size="12" style="height:25px;" /></td>
			<th>墓穴名称</th>
			<td><input name="mxmc"  id="showMxmc"  readonly size="12" style="height:25px;" /></td>
			<th>墓穴类别</th>
			<td><input name="mxlb" id="showMxlb"  readonly size="12" style="height:25px;" /></td>
	    </tr>
	    <tr>			
			<th>使用人姓名</th>
			<td>
			  <input name="syrxm1" id="showSyrxm1"   size="8" style="height:25px;"/>-
			   <select name="sy1qk" id="showSy1qk" style="width:60px;height:24px;">
						<option value="">请选择</option>
							<option value="寿">寿</option>
							<option value="故">故</option>
				</select>
			</td>
			<th>
				<input name="syrxm2" id="showSyrxm2"   size="8" style="height:25px;" />-
				 <select name="sy2qk" id="showSy2qk" style="width:60px;height:24px;">
						<option value="">请选择</option>
							<option value="寿">寿</option>
							<option value="故">故</option>
				</select>
			</th>
			
			<td>
			  <input name="syrxm3" id="showSyrxm3"   size="8" style="height:25px;" />-
				 <select name="sy3qk" id="showSy3qk" style="width:60px;height:24px;">
						<option value="">请选择</option>
							<option value="寿">寿</option>
							<option value="故">故</option>
				 </select>
			</td>
			
			<th>
			    <input name="syrxm4" id="showSyrxm4"   size="8" style="height:25px;" />-
				 <select name="sy4qk" id="showSy4qk" style="width:60px;height:24px;">
						<option value="">请选择</option>
							<option value="寿">寿</option>
							<option value="故">故</option>
				</select>
			</th>
			
			<td>&nbsp;</td>
	    </tr>
	     <tr>			
			<th>办理日期</th>
			<td><input name="zxblrq" size="12" style="height:25px;" class="Wdate" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>结账员</th>
			<td><select name="jzyName" id="jzyId" style="width:110px;height:24px;">
				  <option value="">--请选择--</option>
						<c:forEach var="tb" items="${jzyList }">
							<option value="${tb.jzy}"
								<c:if test="${jzy == tb.jzy}">
						          selected=selected
						       </c:if>>${tb.jzy
								}</option>
						</c:forEach>
			</select></td>
			<th>&nbsp;</th>
			<td><button class="inscriptionEditor" onclick="inscriptionEditor()" type="button">碑文编辑</button></td>
	    </tr>
	     <tr>			
			<th>刻字数</th>
			<td><input name="kzx" id="kzxId"  placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>刻字单价</th>
			<td><input name="kzxdj" id="kzxdjId" placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th>刻字费</th>
			<td><input name="kzf" id="kzfId" readonly style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
	    </tr>
	     <tr>			
			<th>刻框数</th>
			<td><input name="kks" id="kksId"  style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>刻框单价</th>
			<td><input name="kkdj"  id="kkdjId"  placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th>刻框费</th>
			<td><input name="kkf" id="kkfId"  readonly style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
	    </tr>
	    <tr>
	    <th>瓷像类型</th>
			<td>
			  <select name="cxmc" style="width:110px;height:24px;" id="cxId" onchange="dj()">
						<option value="">--请选择--</option>

						 <c:forEach var="cx" items="${ciXiangList }">

							<option value="${cx.id}"
								${cx.id == param['id']?'selected':''}>${cx.cxmc
								}</option>
						</c:forEach> 
				</select>
			</td>
			<th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td>
		</tr>
		 <tr>	
			<th>瓷像单价</th>
			<td><input name="cxdj" id="cxdjId" readonly style="height:25px;width:104px" onkeydown="if(event.keyCode==13){return false;}" /><span>元</span></td>
			<th>瓷像数</th>
			<td><input name="cxgs" id="cxgsId"  style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>瓷像费</th>
			<td><input name="cxf" readonly id="cxfId" style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
        </tr>
	     <tr>			
			
			<th>装修项目1</th>
			<td><input name="xiangmu1"  id="xiangmu1" size="40" style="height:25px;" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>装修金额1</th>
			<td><input name="jine1" id="jine1Id" placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	    <tr>			
			
			<th>装修项目2</th>
			<td><input name="xiangmu2"  id="xiangmu2" size="40" style="height:25px;" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>装修金额2</th>
			<td><input name="jine2" id="jine2Id" placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	    <tr>			
			
			<th>装修项目3</th>
			<td><input name="xiangmu3"  id="xiangmu3" size="40" style="height:25px;" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>装修金额3</th>
			<td><input name="jine3" id="jine3Id" placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	    <tr>			
			
			<th>装修项目4</th>
			<td><input name="xiangmu4"  id="xiangmu4" size="40" style="height:25px;" /></td>
			<th>装修金额4</th>
			<td><input name="jine4" id="jine4Id" placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	     <tr>			
			
			<th>装修项目5</th>
			<td><input name="xiangmu5"  id="xiangmu5" size="40" style="height:25px;" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>装修金额5</th>
			<td><input name="jine5"  id="jine5Id" placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	     <tr>			
			
			<th>装修项目6</th>
			<td><input name="xiangmu6"  id="xiangmu6" size="40" style="height:25px;" onkeydown="if(event.keyCode==13){return false;}"/></td>
			<th>装修金额6</th>
			<td><input name="jine6" id="jine6Id" placeholder="请输入..." style="height:25px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	     <tr>			
			<th>&nbsp;</th>
			<td>&nbsp;</td>
			<th>&nbsp;</th>
			<td>&nbsp;</td>
			<th>交费合计</th>
			<td>
			   <input name="mxjfhj" id="mxjfhjId" size="12" style="height:25px;" readonly/><span>元</span>&nbsp;&nbsp;&nbsp;&nbsp;
			   <button id="calculate" type="button">计算</button>
			</td>
	    </tr>
        </table>
        
    </form>
  </body>
</html>
