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
</style>
<script type="text/javascript">

  /*省市区县二级联动*/
	$(document).ready(function () {
        $("#ssId").change(function () {
            $.get("getQxmcBySsmc/"+encodeURI(encodeURI($("#ssId").val())),function(data){
                if(data.status){
                    var result = "<option>-区/县-</option>";
                    $.each(data.obj,function(n,value){
                        result +="<option value='"+value.qxmc+"'>"+value.qxmc+"</option>";
                    });
                    $("#qxmcId").html('');
                    $("#qxmcId").append(result);
                }
            },"json");
        });
    });
    
    
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
	
     $(document).ready(function () {
          $("#mqmcId").change( function(){
    	    var dmpbValue = $('input[name="dmpb"]:checked').val();
    	    var mqmcValue = $("#mqmcId").val();
    	    var datas={
		   		'dmpbValue':dmpbValue,
		   		'mqmcValue':mqmcValue
	        };
    	 	$.ajax({
			 type: "POST",
			 url:"<%=path%>/queryMxmcByMqmcAndDmpb",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
			     if(data.status){
			     	 var result = "<option value=''>选择墓穴</option>";
				     $.each(data.obj,function(n,value){
                        result +="<option value='"+value.mxmc+"'>"+value.mxmc+"</option>";
                    });
	                 $("#mxmcOneId").html('');
	                 $("#mxmcOneId").append(result); 
			     }
			 },
			 error:function(data){
				alert("出错了！！:"+data);
			 }
			
	    	  },"json");	
    	 });
    	 $('input:radio[name="dmpb"]').click( function(){
    	    var dmpbValue = $('input[name="dmpb"]:checked').val();
    	    var mqmcValue = $("#mqmcId").val();
    	    var datas={
		   		'dmpbValue':dmpbValue,
		   		'mqmcValue':mqmcValue
	        };
    	 	$.ajax({
			 type: "POST",
			 url:"<%=path%>/queryMxmcByMqmcAndDmpb",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
			     if(data.status){
			     	 var result = "<option>选择墓穴</option>";
				     $.each(data.obj,function(n,value){
                        result +="<option value='"+value.mxmc+"'>"+value.mxmc+"</option>";
                    });
	                 $("#mxmcOneId").html('');
	                 $("#mxmcOneId").append(result); 
			     }
			 },
			 error:function(data){
				alert("出错了！！:"+data);
			 }
			
	    	  },"json");	
    	 });
    });
    /*瓷像名称获取瓷像单价  */
    function dj(){ 
	$.get("findCxdjByCxmc/"+$("#cxId").val(),function(data){
                if(data.status){
                     document.getElementById('cxdjId').value=data.obj.cxdj; 
                }
            },"json");
    };
    
    /* 定墓小计计算 */
    var xjCount = 0;
    var ssjeCount = 0;
    var yshjCount = 0;
    var mxcount = 0;
    $(document).ready(function () {
    	$("#mxmcOneId").change(function(){
    		 var mqmcValue = $("#mqmcId").val();
    		 var mxmcValue = $("#mxmcOneId").val();
    		 var mxlb = $("#mxlbId");
    		 var mdf = $("#mdfId");
    		 var clf =  $("#clfId");
    		 var lzf = $("#lzfId");
    		 var lhf = $("#lhfId");
    		 /*  维护单价*/
    		 var glf = $("#glfId");
    		 var mxmj = $("#mxmjId");
    		 var dlmj = $("#dlmjId");
    		 var xj = $("#xjId");
			 var yshj = $("#yshjId");
			 var ssje = $("#ssjeId");
    		 var datas={
		   		'mqmcValue':mqmcValue,
		   		'mxmcValue':mxmcValue
	        };
	        $.ajax({
			 type: "POST",
			 url:"<%=path%>/findMxlbByMqmcIdAndMxmc",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
			    $(this).val("");
			    mxlb.val(data.mxlb);
			    var tdContent = "";
			    if(data.mxlb=='1'){
			        if(typeof(data.mdf1)=="undefined"){
			        	data.mdf1 = 0;
			        }
			        if(typeof(data.clf1)=="undefined"){
			        	data.clf1 = 0;
			        }
			        if(typeof(data.lzf1)=="undefined"){
			        	data.lzf1 = 0;
			        }
			        if(typeof(data.lhf1)=="undefined"){
			        	data.lhf1 = 0;
			        }
			         if(typeof(data.glf1)=="undefined"){
			        	data.glf1 = 0;
			        }
			    	mdf.val(data.mdf1.toFixed(2));
			        clf.val(data.clf1.toFixed(2));
			        lzf.val(data.lzf1.toFixed(2));
			        lhf.val(data.lhf1.toFixed(2));
			        glf.val(data.glf1.toFixed(2));
			        mxmj.val(data.mxmj1);
			        dlmj.val(data.dlmj1);
			        mxcount = data.mdf1+ data.clf1+data.lzf1+data.lhf1;
			        if(isNaN(mxcount)){
			        	mxcount = 0.00;
			        }
			        xjCount = mxcount.toFixed(2);
			        ssjeCount = mxcount.toFixed(2);
			        yshjCount = mxcount.toFixed(2);
			        tdContent +='<th>使用人姓名</th>'+
			                    '<td>'+
			                        '<input name="syxm1" size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">请选择</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>';
			    }else if(data.mxlb=='2'){
			        if(typeof(data.mdf2)=="undefined"){
			        	data.mdf2 = 0;
			        }
			        if(typeof(data.clf2)=="undefined"){
			        	data.clf2 = 0;
			        }
			        if(typeof(data.lzf2)=="undefined"){
			        	data.lzf2 = 0;
			        }
			        if(typeof(data.lhf2)=="undefined"){
			        	data.lhf2 = 0;
			        }
			         if(typeof(data.glf2)=="undefined"){
			        	data.glf2 = 0;
			        }
			    	mdf.val(data.mdf2.toFixed(2));
			        clf.val(data.clf2.toFixed(2));
			        lzf.val(data.lzf2.toFixed(2));
			        lhf.val(data.lhf2.toFixed(2));
			        glf.val(data.glf2.toFixed(2));
			        mxmj.val(data.mxmj2);
			        dlmj.val(data.dlmj2);
			        mxcount = data.mdf2+ data.clf2+data.lzf2+data.lhf2;
			        if(isNaN(mxcount)){
			        	mxcount = 0.00;
			        }
			        xjCount =  mxcount.toFixed(2);
			        ssjeCount = mxcount.toFixed(2);
			        yshjCount = mxcount.toFixed(2);
			         tdContent += '<th>使用人姓名</th>'+
			                      '<td>'+
			                        '<input name="syxm1" size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">请选择</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">请选择</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>';
			                      
			    }else if(data.mxlb=='3'){
			    	mdf.val(data.mdf3);
			        clf.val(data.clf3);
			        lzf.val(data.lzf3);
			        lhf.val(data.lhf3);
			        glf.val(data.glf3);
			        mxmj.val(data.mxmj3);
			        dlmj.val(data.dlmj3);
			        mxcount = data.mdf3+ data.clf3+data.lzf3+data.lhf3;
			        if(isNaN(mxcount)){
			        	mxcount = 0.00;
			        }
			        xjCount = mxcount.toFixed(2);
			        ssjeCount = mxcount.toFixed(2);
			        yshjCount = mxcount.toFixed(2);
			        tdContent += '<th>使用人姓名</th>'+
			                     '<td>'+
			                        '<input name="syxm1" size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">请选择</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">请选择</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>'+
			                      ' <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
				                      '<input name="syxm3"  size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}" />'+
				                      '<select name="sy3qk" style="width:60px;height:24px;">'+
					                      '<option value="" >请选择</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
				                      '</select>'+
			                      '</td>';
			    }else if(data.mxlb=='4'){
			    	mdf.val(data.mdf4);
			        clf.val(data.clf4);
			        lzf.val(data.lzf4);
			        lhf.val(data.lhf4);
			        glf.val(data.glf4);
			        mxmj.val(data.mxmj4);
			        dlmj.val(data.dlmj4);
			        mxcount = data.mdf4+data.clf4+data.lzf4+data.lhf4;
			        if(isNaN(mxcount)){
			        	mxcount = 0.00;
			        }
			        xjCount = mxcount.toFixed(2);
			        ssjeCount = mxcount.toFixed(2);
			        yshjCount = mxcount.toFixed(2);
			         tdContent += '<th>使用人姓名</th>'+
			                     '<td>'+
			                        '<input name="syxm1" size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">请选择</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">请选择</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>'+
			                      ' <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
				                      '<input name="syxm3"  size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}" />'+
				                      '<select name="sy3qk" style="width:60px;height:24px;">'+
					                      '<option value="" >请选择</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
				                      '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm4"  size="10" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy4qk" style="width:60px;height:24px;">'+
					                      '<option value="">请选择</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>';
			    }else{
			    	mdf.val(data.mdf);
			        clf.val(data.clf);
			        lzf.val(data.lzf);
			        lhf.val(data.lhf);
			        glf.val(data.glf);
			        mxmj.val(data.mxmj);
			        dlmj.val(data.dlmj);
			        mxcount = data.mdf+data.clf+data.lzf+data.lhf;
			        if(isNaN(mxcount)){
			        	mxcount = 0.00;
			        }
			        xjCount = mxcount.toFixed(2);
			        ssjeCount = mxcount.toFixed(2);
			        yshjCount = mxcount.toFixed(2);
			    }
			   
			   xj.val (xjCount);
			   ssje.val(ssjeCount);
			   yshj.val(yshjCount);
			   if(data.taxPreferenceItems=='1'){
			     $("#zkmcId").val("镇政府");
			   }else{
			     $("#zkmcId").val("本单位");
			   }
			   $("#zkbmId").val(data.batchNumber);
			   $("#zkjeId").val(data.discountAmount);
			   $("#syrxmAndsyqk").html(tdContent);
			 },
			 error:function(data){
				alert("出错了！！:"+data);
			 }
			
	    	  });	
    	 });
    });
    
    /*计算*/
    $(document).ready(function () {
      var mzfIdCount = 0;
      var fjf1IdCount = 0;
      var fjf2IdCount = 0;
      var fjf3IdCount = 0;
      var fjf4IdCount = 0;
      var glfIdCount = 0;
      var wfhjCount = 0;
      var kzfCount = 0 ;
      var kkfCount = 0 ;
      var cxfCount = 0 ;
      var xj = $("#xjId");
      var wfhj = $("#wfhjId");
      var kzf = $("#kzfId");
      var kkf = $("#kkfId");
      var cxf = $("#cxfId");
      var bwxj = $("#bwxjId");
	  var yshj = $("#yshjId");
	  var ssje = $("#ssjeId");
	 
	  
	   $("#mzfId").blur(function () {
	    var mzfId = $("#mzfId").val();
	     if (mzfId.indexOf(".")< 0) {
				$("#mzfId").val(mzfId+".00");
		  }
		  mzfIdCount = parseFloat(mzfId);
		  if(isNaN(mzfIdCount)){
		     mzfIdCount = 0.00;
          }
          xjCount =  mzfIdCount;
          ssjeCount = mzfIdCount;
          yshjCount = mzfIdCount;
          xj.val (xjCount.toFixed(2));
          ssje.val(ssjeCount.toFixed(2));
	      yshj.val(yshjCount.toFixed(2));
	  }); 
	  
	  $("#mxmcOneId").blur(function(){
	       xjCount =  mzfIdCount + mxcount;
          ssjeCount = mzfIdCount + mxcount;
          yshjCount = mzfIdCount + mxcount;
          xj.val (xjCount.toFixed(2));
          ssje.val(ssjeCount.toFixed(2));
	      yshj.val(yshjCount.toFixed(2));
	  });
	  
      $("#fjf1Id").blur(function(){
          var fjf1Id = $("#fjf1Id").val();
          if (fjf1Id.indexOf(".")< 0) {
				$("#fjf1Id").val(fjf1Id+".00");
		  } 
          fjf1IdCount = parseFloat(fjf1Id);
          if(isNaN(fjf1IdCount)){
		     fjf1IdCount = 0.00;
          }
          xjCount =  fjf1IdCount + mzfIdCount + mxcount;
          ssjeCount = fjf1IdCount + mzfIdCount + mxcount;
          yshjCount = fjf1IdCount + mzfIdCount + mxcount;
          xj.val (xjCount.toFixed(2));
          ssje.val(ssjeCount.toFixed(2));
	      yshj.val(yshjCount.toFixed(2));
      });
      
      $("#fjf2Id").blur(function(){
          var fjf2Id = $("#fjf2Id").val();
          if (fjf2Id.indexOf(".")< 0) {
				$("#fjf2Id").val(fjf2Id+".00");
		  } 
          fjf2IdCount = parseFloat(fjf2Id);
          if(isNaN(fjf2IdCount)){
		     fjf2IdCount = 0.00;
          }
          xjCount =  mzfIdCount + fjf2IdCount + fjf1IdCount + mxcount;
          ssjeCount = mzfIdCount + fjf2IdCount + fjf1IdCount + mxcount;
          yshjCount = mzfIdCount + fjf2IdCount + fjf1IdCount + mxcount;
          xj.val (xjCount.toFixed(2));
          ssje.val(ssjeCount.toFixed(2));
	      yshj.val(yshjCount.toFixed(2));
      });
      $("#fjf3Id").blur(function(){
          var fjf3Id = $("#fjf3Id").val();
          var reg = new RegExp("^[0-9]*$");
          if (fjf3Id.indexOf(".")< 0) {
				$("#fjf3Id").val(fjf3Id+".00");
		  } 
          fjf3IdCount = parseFloat(fjf3Id);
          if(isNaN(fjf3IdCount)){
		     fjf3IdCount = 0.00;
          }
          xjCount =  mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + mxcount;
          ssjeCount = mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + mxcount;
          yshjCount = mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + mxcount;
          xj.val (xjCount.toFixed(2));
          ssje.val(ssjeCount.toFixed(2));
	      yshj.val(yshjCount.toFixed(2));
      });
      $("#fjf4Id").blur(function(){
          var fjf4Id = $("#fjf4Id").val();
          if (fjf4Id.indexOf(".")< 0) {
				$("#fjf4Id").val(fjf4Id+".00");
		  } 
          fjf4IdCount = parseFloat(fjf4Id);
          if(isNaN(fjf4IdCount)){
		     fjf4IdCount = 0.00;
          }
          xjCount =  mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + mxcount;
          ssjeCount = mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + mxcount;
          yshjCount = mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + mxcount;
          xj.val (xjCount.toFixed(2));
          ssje.val(ssjeCount.toFixed(2));
	      yshj.val(yshjCount.toFixed(2));
      });
      
      $("#wfnsId").blur(function(){
         var glf = $("#glfId");
         var glfId = $("#glfId").val();
         var wfnsId = $("#wfnsId").val();
          if (glfId.indexOf(".")< 0) {
				$("#glfId").val(glfId+".00");
		  }
		  glfIdCount = parseFloat(glfId);
		  if(isNaN(glfIdCount)){
               glfIdCount=0.00;
          }
          wfnsCount = parseFloat(wfnsId);
          if(isNaN(wfnsCount)){
               wfnsCount=0.00;
          }
          wfhjCount =  glfIdCount * wfnsCount;
          wfhj.val(wfhjCount.toFixed(2));
          yshjCount = mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          yshj.val(yshjCount.toFixed(2)); 
          ssjeCount = mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          ssje.val(ssjeCount.toFixed(2));
          
      });
      
      
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
          bwxjCount = kzfIdCount;
          bwxj.val(bwxjCount.toFixed(2));
          yshjCount = kzfIdCount + mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          yshj.val(yshjCount.toFixed(2)); 
          ssjeCount = kzfIdCount + mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          ssje.val(ssjeCount.toFixed(2));
      });
      
       $("#kkdjId").blur(function(){
         var kks = $("#kksId");
         var kkdj = $("#kkdjId");
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
          if(isNaN(kkdjIdCount)){
               kkdjIdCount=0.00;
          }
          kkfIdCount =  kksIdCount * kkdjIdCount;
          kkf.val(kkfIdCount.toFixed(2));
          bwxjCount = kzfIdCount + kkfIdCount;
          bwxj.val(bwxjCount.toFixed(2));
          yshjCount = kzfIdCount + kkfIdCount + mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          yshj.val(yshjCount.toFixed(2)); 
          ssjeCount = kzfIdCount + kkfIdCount + mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          ssje.val(ssjeCount.toFixed(2));
      });
      
       $("#cxgsId").blur(function(){
         var cxgs = $("#cxgsId");
         var cxdj = $("#cxdjId");
         var cxdjId = $("#cxdjId").val();
         var cxgsId = $("#cxgsId").val();
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
          if(isNaN(cxdjIdCount)){
               cxdjIdCount=0.00;
          }
          cxfIdCount =  cxgsIdCount * cxdjIdCount;
          cxf.val(cxfIdCount.toFixed(2));
          bwxjCount = kzfIdCount + kkfIdCount + cxfIdCount;
          bwxj.val(bwxjCount.toFixed(2));
          yshjCount = kzfIdCount + kkfIdCount + cxfIdCount + mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          yshj.val(yshjCount.toFixed(2)); 
          ssjeCount = kzfIdCount + kkfIdCount + cxfIdCount + mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount;
          ssje.val(ssjeCount.toFixed(2));
      });
      
      $("#zkjeId").blur(function(){
          var zkje = $("#zkjeId");
          var zkjeId = $("#zkjeId").val();
           if (zkjeId.indexOf(".")< 0) {
				$("#zkjeId").val(zkjeId+".00");
		  }
		  zkjeIdCount = parseFloat(zkjeId);
		  if(isNaN(zkjeIdCount)){
               zkjeIdCount=0.00;
          }
		  ssjeCount = kzfIdCount + kkfIdCount + cxfIdCount + mzfIdCount + fjf2IdCount + fjf1IdCount + fjf3IdCount + fjf4IdCount + wfhjCount + mxcount - zkjeIdCount;
          ssje.val(ssjeCount.toFixed(2));
      });
      $("#jfId").blur(function(){
   	    	var ssjeNum = parseFloat($("#ssjeId").val());
   	    	var qmjeNum = parseFloat($("#qmjeId").val());
   	    	if(isNaN(qmjeNum)){
               qmjeNum=0.00;
             }
   	    	var jfIdNum = parseFloat($("#jfId").val());
   	    	if((ssjeNum-qmjeNum)!=jfIdNum){
   	    		$("#qfhjId").val((ssjeNum-qmjeNum-jfIdNum).toFixed(2));
   	    	}
   		});
      
    });
     
    /* 根据定墓判别，墓区名称，墓穴名称查询定墓金额和日期 */
     $(document).ready(function () {
    	$("#mxmcOneId").change(function(){
    		 var mqmcValue = $("#mqmcId").val();
    		 var mxmcValue = $("#mxmcOneId").val();
    		 var dmpbValue = $("#dmpbId").val();
    		
    		 var dmrq = $("#dmrqId");
    		 var qmje = $("#qmjeId");
    		 var datas={
		   		'mqmcValue':mqmcValue,
		   		'mxmcValue':mxmcValue,
		   		'dmpbValue':dmpbValue
	        };
	        $.ajax({
			 type: "POST",
			 url:"<%=path%>/findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
			    $(this).val("");
			    dmrq.val(getyyyyMMdd(data.dmrq));
			    qmje.val(data.qmje);
			 },
			 error:function(data){
				dmrq.val("");
			    qmje.val("");
			 }
			
	    	  });	
    	 });
    });
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

    /*维护费年数设置  */
   function AddWfnsDate() {
     var startDateStr = $("#startDate").val();
     var startDate = new Date(Date.parse(startDateStr.replace(/-/g,"/")));
     var wfns = parseFloat($("#wfnsId").val());
	 var endYear = startDate.getFullYear()+wfns;
	 var endMonth = startDate.getMonth()+1;
	 var endDay = startDate.getDate();
     var endDateStr = endYear+"-"+endMonth+"-"+endDay;
     $("#endDate").val(endDateStr);
    
};
   
  $(document).ready(function () {
        $("#jzyId").change(function(){
    		 var jzyId = $("#jzyId").val();
    		 var datas={
		   		'jzyId':jzyId
	        };
	        $.ajax({
			 type: "POST",
			 url:"<%=path%>/queryUserByJZY",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
			    $(this).val("");
			    $("#userId").val(data.user);
			 }
			
	    	  });	
    	 });
    });
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
   <input type="hidden" name="editorText" id="editorTextId" />
   <input type="hidden" name="wordsNumber" id="wordsNumberId" />
  <form method="post" name="form1" onsubmit="return save()">
	<div class="page_title">营销管理&gt;施工单&gt;施工单新建</div>
	<div class="button_bar">
		<button class="common_button" type="submit">保存</button>
	</div>
	<table class="query_form_table">
        <tr>
			<th>施工单编号</th>
			<td><input name="sgdbh" id="sgdNum" value="${newSGDNo}" size="12" style="height:19px;" readonly/>
			</td>
			<th>结账日期</th>
			<td><input name="jzskrq" id="jzskrqId" size="12" value="${currentDate}"  style="height:19px;" placeholder="请输入..." class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			    <span class="red_star" id="red_star">*</span>
			</td>
			<th>结账员</th>
			<td><select name="jzyId" id="jzyId" style="width:110px;height:24px;">
						<option value="">--请选择--</option>
						<c:forEach var="jzy" items="${jzyList }">

							<option value="${jzy.id}"
								<c:if test="${jzy == jzy.jzy}">
						          selected=selected
						       </c:if>>${jzy.jzy}
						    </option>
						</c:forEach>
				</select>
				<span class="red_star" id="red_star">*</span>
			</td>
		</tr>
		<tr>
			<th>联系人姓名</th>
			<td><input name="lxrxm" id="lxrxmId" size="12" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>
			    <span class="red_star" id="red_star">*</span>
			</td>
			<th>联系电话</th>
			<td><input name="lxrdh" id="lxrdhId" size="12" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>
			    <span class="red_star" id="red_star">*</span>
			</td>
			<th>来自区县</th>
			<td>
				<select name="ssmc" id="ssId" style="width:60px;height:24px;">
							<option value="">-省/市-</option>
							<c:forEach var="ad" items="${addressList}">
							      <option value="${ad.ssmc}"  ${ad.ssmc == param['ssmc']?'selected':''}>${ad.ssmc}</option>
							</c:forEach>
							
				</select>---<select name="qxmc" id="qxmcId" style="width:60px;height:24px;">
						<option value="" >-区/县-</option>
				</select>
				<span class="red_star" id="red_star">*</span>
			</td>
		</tr>
		<tr>
			<th>联系地址</th>
			<td colspan="3">
			   <input name="lxrdz"  id="lxrdzId" size="50" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			</td>
			<th>邮政编码</th>
			<td>
			   <input name="lxryb" id="lxrybId" size="12" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			</td>
		</tr>
		<tr>
			<th>墓证费</th>
			<td>
			   <input name="mzf" id="mzfId" placeholder="请输入..." size="12" style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			   <span class="red_star" id="red_star">*</span>
			</td>
			<th>业务员</th>
			<td>
			  <input type="text" name="user" id="userId" size="12" readonly="readonly">
			  <%--  <select name="jzyId" style="width:110px;height:24px;">
						<option value="">--请选择--</option>

						<c:forEach var="ul" items="${userList }">

							<option value="${ul.id}"
								<c:if test="${user == ul.user}">
						          selected=selected
						       </c:if>>${ul.user
								}</option>

						</c:forEach>

				</select> --%>
			</td>
			<th></th><td></td>
		</tr>
		
		
		<tr>
			<th>墓区名称：</th>
			<td>
				<select name="mqmcId" style="width:110px;height:24px;" id="mqmcId">
						<option value="">--请选择--</option>
						<c:forEach var="mq" items="${muquList}">
							<option value="${mq.mqmc}" ${mq.mqmc == param['mqmc']?'selected':''}>
								${mq.mqmc}
							 </option>
						</c:forEach>
				</select>
			</td>
			<th>是否定墓</th>
			<td>
			    <input type="radio" name="dmpb" value="1"  id="dmpbId" checked="checked"/>是 
			    <input type="radio" name="dmpb" value="0"  />否
			</td>
			<th>墓穴名称</th>
		    <td>
			    <select name="mxmc" style="width:110px;height:24px;" id="mxmcOneId">
						<option value="">--请选择--</option>
				</select>
		    </td>
					
		</tr>
		<tr>
		    <th>墓穴类别</th>
			<td>
			    <input name="mxlb"  id="mxlbId" size="12" style="height:19px;" readonly />
			</td>
			<th>墓地费</th>
			<td><input name="mdf" id="mdfId" size="12" style="height:19px;" readonly /><span>（元）</span>
			</td>
			<th>材料费</th>
			<td><input name="clf" id="clfId" size="12" style="height:19px;" readonly /><span>（元）</span>
			</td>
			
		</tr>
		<tr>
		    <th>落葬费</th>
			<td><input name="lzf" id="lzfId" size="12" style="height:19px;" readonly /><span>（元）</span>
			</td>
			<th>绿化费</th>
			<td><input name="lhf" id="lhfId" size="12" style="height:19px;" readonly /><span>（元）</span>
			</td>
			<th>墓穴面积</th>
			<td><input type="text" name="mxmj" id="mxmjId" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			</td>
		</tr>
		<tr>
			
			<th>道路面积</th>
			<td><input type="text" name="dlmj" id="dlmjId" size="12" style="height:19px;"  readonly /><span>（㎡）</span>
			</td>
			
			<%-- <th>预约落葬日期</th>
			<td><input type="text" name="dlmj" value="${MQ.dlmj}" size="11"  readonly /><span>（㎡）</span>
			</td> --%>
			<th></th>
			<td></td>
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
			<th>附加材料费名称</th>
			<td><input name="fjf1mc"  size="12" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th><input name="fjf2mc"  size="12" style="height:19px;" placeholder="请输入..."  onkeydown="if(event.keyCode==13){return false;}"/></th>
			<td><input name="fjf3mc"  size="12" style="height:19px;" placeholder="请输入..."  onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th><input name="fjf4mc"  size="12" style="height:19px;" placeholder="请输入..."  onkeydown="if(event.keyCode==13){return false;}"/></th>
			<td></td>
			
		</tr>
		
		<tr>
			<th>附加材料费金额</th>
			<td>
			   <input type="number" name="fjf1" id="fjf1Id" size="8" placeholder="请输入..." style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="number" name="fjf2"  id="fjf2Id" size="8" placeholder="请输入..." style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span></th>
			<td>
			   <input type="number" name="fjf3"  id="fjf3Id" size="8" placeholder="请输入..." style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="number" name="fjf4"  id="fjf4Id" size="8" placeholder="请输入..." style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span></th>
			<td></td>
		</tr>
		<tr>
			<th>附加费交费日期</th>
			<td><input name="fjfrq"  size="12" style="height:19px;" class="Wdate"  placeholder="请输入..." onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>附加费是否交清</th>
			<td>
			    <select name="fjfpb" id="fjfpbId" style="width:110px;height:24px;">
						<option value="">--请选择--</option>
						<option value="1">是</option>
						<option value="0">否</option>
				</select>
			</td>
			<th>附加收款日期</th>
			<td>
			<input name="fjskrq" size="12" style="height:19px;" class="Wdate"  placeholder="请输入..." onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
		</tr>
		<tr>
			
			<th>小计</th>
			<td><input type="text" name="xj" id="xjId"  size="12" placeholder="请输入..." style="height:19px;" readonly/><span>（元）</span>
			</td>
			<th>预约落葬日期</th>
			<td><input type="text" name="yylzrq" 
				size="12" style="height:19px;" class="Wdate"  placeholder="请输入..." onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/><span></span>
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
			<th>维护开始日期</th>
			<td><input name="wfksrq" id="startDate" size="12" placeholder="请输入..." style="height:19px;" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>维护年数</th>
			<td><input name="wfns" id="wfnsId" size="12" value="10" placeholder="请输入..." style="height:19px;" onblur = "AddWfnsDate()" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>维护结束日期</th>
			<td><input name="wfjsrq" id="endDate" size="12" placeholder="请输入..." style="height:19px;" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
		</tr>
		<tr>
		    <th>维护费/年</th>
			<td><input name="glf" id="glfId"  size="12"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span></td>
			<th>维护小计</th>
			<td>
			  <input name="wfhj" id="wfhjId" size="12"  style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
			<th>维护交费日期</th>
			<td><input name="whskrq" id="whskrqId" type="text" size="12" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/></td>
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
			<th></th>
			<td><button class="inscriptionEditor" onclick="inscriptionEditor()" type="button">碑文编辑</button></td>
			<th></th>
			<td></td>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<th>刻字数</th>
			<td><input name="kzx" id="kzxId"  placeholder="请输入..." style="height:19px;width:104px" type="text" value="${wordsNumber}" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>刻字单价</th>
			<td><input name="kzxdj" id="kzxdjId"  placeholder="请输入..." style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>刻字费</th>
			<td><input name="kzf" id="kzfId"  placeholder="请输入..." style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>刻框数</th>
			<td><input type="number" name="kks" id="kksId"  placeholder="请输入..." style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>刻框单价</th>
			<td><input type="number" name="kkdj" id="kkdjId"  placeholder="请输入..." style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>刻框费</th>
			<td><input type="number" name="kkf" id="kkfId"  placeholder="请输入..." style="height:19px;width:104px" readonly/><span>（元）</span>
			</td>
			
		</tr>
		<tr>
		  <th>瓷像类别</th>
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
			<th>瓷像单价</th>
			<td><input name="cxdj" style="height:19px;width:104px" id="cxdjId" readonly="readonly"/><span>（元）</span></td>
		
			<th>瓷像数量</th>
			<td><input name="cxgs" id="cxgsId" size="12" placeholder="请输入..." style="height:19px;" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
		</tr>
		<tr>
			<th>瓷像费</th>
			<td><input name="cxf" id="cxfId" size="12" placeholder="请输入..." style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
			<th>碑文小计</th>
			<td><input name="bwxj" id="bwxjId" size="12" placeholder="请输入..." style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
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
		    <th>应收金额</th>
			   <td><input type = "number" name="yshj" id="yshjId" size="12" placeholder="请输入..." style="height:19px;width:104px" readonly/><span>（元）</span>
			   </td>
			<th>优惠项目</th>
				<td>
					<input name="zkmc" id="zkmcId" size="12"  style="height:19px;"  readonly/>
				</td>
			<th>优惠编号</th>
			<td><input name="zkbm" id="zkbmId" size="12"  style="height:19px;"  readonly/>
			</td>
			
		</tr>
		<tr>
		    <th>优惠金额</th>
			   <td><input name="zkje" id="zkjeId" style="height:19px;width:104px" type="text" readonly/><span>（元）</span>
			</td>
			<th>实收金额</th>
			   <td><input type = "number" name="ssje" id="ssjeId" style="height:19px;width:104px" readonly/><span>（元）</span>
			</td>
			 <th>预付金额</th>
			 <td>
			    <input type="number" name="qmje" id="qmjeId" style="height:19px;width:104px" readonly/><span>（元）</span>
			 </td>
			
		</tr>
		<tr>
		    
			<th>预付日期</th>
			 <td>
			   <input name="dmrq" id="dmrqId" size="12"  style="height:19px;"  readonly/>
			 </td>
			 <th>交费</th>
			<td>
			   <input type="number"  name="jfje"  id="jfId" placeholder="请输入..." style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>欠费合计</th>
			<td><input type="number" name="qfhj" id="qfhjId"  placeholder="请输入..." style="height:19px;width:104px" readonly/><span>（元）</span>
			</td>
			
		</tr>
		<tr>
		 <th></th><td></td><th></th><td></td><th></th><td></td>
		</tr>
			
		 <tr id="syrxmAndsyqk">
			<!-- 使用人姓名 -->
		</tr>
		
	</table>

	
</form>
</body>
</html>
