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
td input{
	border: 0;
    background: #eeeeff;
}
th input{
 border: 0;
 background:#6EC2FD;

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
	
	    document.form1.action="<%=basePath%>/sgdGetUpdate.html";
	
	    document.form1.submit();
	
	}
	
	function search(){
	
	    document.form1.action="<%=basePath%>/searchMuxue.html";
	
	    document.form1.submit();
	
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
     var endDateStr = endYear+"-"+"0"+endMonth+"-"+endDay;
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
</script> 
</head>

<body>
   <input type="hidden" name="editorText" id="editorTextId" />
   <input type="hidden" name="wordsNumber" id="wordsNumberId" />
  <form method="post" name="form1">
	<div class="page_title">营销管理&gt;施工单&gt;施工单详情</div>
	<table class="query_form_table">
        <tr>
			<th>施工单编号</th>
			<td><input name="sgdbh" id="sgdNum" value="${con.sgdbh}" size="12" style="height:19px;" readonly/>
			</td>
			<th>结账日期</th>
			<td><input name="jzskrq" size="12" style="height:19px;" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.jzskrq }" />" readonly/>
			</td>
			<th>结账员</th>
			<td>
			 <input name="jzyId" id="jzyId" size="12" style="height:19px;" value="${con.jzy}" readonly/>
			</td>
		</tr>
		<tr>
			<th>联系人姓名</th>
			<td><input name="lxrxm" value="${con.lxrxm}" size="12" style="height:19px;"  readonly/>
			</td>
			<th>联系电话</th>
			<td><input name="lxrdh" value="${con.lxrdh}" size="12" style="height:19px;" readonly/>
			</td>
			<th>来自区县</th>
			<td>
			   <input name="ssmc" id="ssId" size="12" style="height:19px;" value="${con.ssmc}" readonly/>
				---
			   <input name="qxmc" id="qxmcId" size="12" style="height:19px;" value="${con.qxmc}" readonly/>
			</td>
		</tr>
		<tr>
			<th>联系地址</th>
			<td colspan="3">
			   <input name="lxrdz" value="${con.lxrdz}" size="50" style="height:19px;" readonly/>
			</td>
			<th>邮政编码</th>
			<td>
			   <input name="lxryb" value="${con.lxryb}" size="12" style="height:19px;" readonly/>
			</td>
		</tr>
		<tr>
			<th>墓证费</th>
			<td>
			   <input name="mzf" value="${con.mzf}" id="mzfId"  size="12" style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
			<th>业务员</th>
			<td>
			  <input type="text" name="user" id="userId" value="${con.user}" size="12" readonly="readonly">
			 
			</td>
			<th></th><td></td>
		</tr>
		
		
		<tr>
			<th>墓区名称：</th>
			<td>
			    <input name="mqmcId" size="12" style="height:19px;" value="${con.mqmcId}" readonly="readonly"/>
			</td>
			<th>是否定墓</th>
			<td>
			    <input type="radio" name="dmpb" value="1"  <c:if test="${con.dmpb=='1'}"> checked='checked'</c:if> disabled="disabled"/>是 
			    <input type="radio" name="dmpb" value="0"  <c:if test="${con.dmpb=='0'}"> checked='checked'</c:if> disabled="disabled"/>否
			</td>
			<th>墓穴名称</th>
		    <td>
		        <input name="mqmcId" size="12" style="height:19px;" value="${con.mxmc}" readonly="readonly"/>
		    </td>
					
		</tr>
		<tr>
		    <th>墓穴类别</th>
			<td>
			    <input name="mxlb"  id="mxlbId" value="${con.mxlb}"  size="12" style="height:19px;" readonly />
			</td>
			<th>墓地费</th>
		   <c:choose>
		     <c:when test="${con.mxlb ==1 }">
				<td><input name="mdf" id="mdfId" value="${con.mdf1}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==2 }">
				<td><input name="mdf" id="mdfId" value="${con.mdf2}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==3 }">
				<td><input name="mdf" id="mdfId" value="${con.mdf3}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==4 }">
				<td><input name="mdf" id="mdfId" value="${con.mdf4}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
			<c:otherwise>
			    <td><input name="mdf" id="mdfId" value="${con.mdf}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:otherwise>
		   </c:choose>
			<th>材料费</th>
			<c:choose>
				 <c:when test="${con.mxlb ==1 }">
				    <td><input name="clf" id="clfId" value="${con.clf1}" size="12" style="height:19px;" readonly /><span>（元）</span>
			        </td>
				</c:when>
			     <c:when test="${con.mxlb ==2 }">
					<td><input name="clf" id="clfId" value="${con.clf2}" size="12" style="height:19px;" readonly /><span>（元）</span>
				    </td>
				</c:when>
			     <c:when test="${con.mxlb ==3 }">
					<td><input name="clf" id="clfId" value="${con.clf3}" size="12" style="height:19px;" readonly /><span>（元）</span>
				    </td>
				</c:when>
			     <c:when test="${con.mxlb ==4 }">
					<td><input name="clf" id="clfId" value="${con.clf4}" size="12" style="height:19px;" readonly /><span>（元）</span>
				    </td>
				</c:when>
				<c:otherwise>
				    <td><input name="clf" id="clfId" value="${con.clf}" size="12" style="height:19px;" readonly /><span>（元）</span>
				    </td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
		    <th>落葬费</th>
		    <c:choose>
		     <c:when test="${con.mxlb ==1 }">
			    <td><input name="lzf" id="lzfId" value="${con.lzf1}" size="12" style="height:19px;" readonly /><span>（元）</span>
		        </td>
			</c:when>
		     <c:when test="${con.mxlb ==2 }">
				<td><input name="lzf" id="lzfId" value="${con.lzf2}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==3 }">
				<td><input name="lzf" id="lzfId" value="${con.lzf3}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==4 }">
				<td><input name="lzf" id="lzfId" value="${con.lzf4}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
			<c:otherwise>
			    <td><input name="lzf" id="lzfId" value="${con.lzf}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:otherwise>
			</c:choose>
			<th>绿化费</th>
			<c:choose>
			<c:when test="${con.mxlb ==1 }">
			    <td><input name="lhf" id="lhfId" value="${con.lhf1}" size="12" style="height:19px;" readonly /><span>（元）</span>
		        </td>
			</c:when>
		     <c:when test="${con.mxlb ==2 }">
				<td><input name="lhf" id="lhfId" value="${con.lhf2}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==3 }">
				<td><input name="lhf" id="lhfId" value="${con.lhf3}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==4 }">
				<td><input name="lhf" id="lhfId" value="${con.lhf4}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
			<c:otherwise>
			    <td><input name="lhf" id="lhfId" value="${con.lhf}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:otherwise>
			</c:choose>
			<th>墓穴面积</th>
			<c:choose>
			<c:when test="${con.mxlb ==1 }">
			    <td><input name="lhf" id="lhfId" value="${con.mxmj1}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
		        </td>
			</c:when>
		     <c:when test="${con.mxlb ==2 }">
				<td><input name="lhf" id="lhfId" value="${con.mxmj2}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==3 }">
				<td><input name="lhf" id="lhfId" value="${con.mxmj3}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==4 }">
				<td><input name="lhf" id="lhfId" value="${con.mxmj4}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:when>
			<c:otherwise>
			    <td><input name="lhf" id="lhfId" value="${con.mxmj}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			
			<th>道路面积</th>
			<c:choose>
			<c:when test="${con.mxlb ==1 }">
			    <td><input name="lhf" id="lhfId" value="${con.dlmj1}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
		        </td>
			</c:when>
		     <c:when test="${con.mxlb ==2 }">
				<td><input name="lhf" id="lhfId" value="${con.dlmj2}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==3 }">
				<td><input name="lhf" id="lhfId" value="${con.dlmj3}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==4 }">
				<td><input name="lhf" id="lhfId" value="${con.dlmj4}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:when>
			<c:otherwise>
			    <td><input name="lhf" id="lhfId" value="${con.dlmj}" size="12" style="height:19px;" readonly /><span>（㎡）</span>
			    </td>
			</c:otherwise>
			</c:choose>
			
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
			<td><input name="fjf1mc" value="${con.fjf1mc}" size="12" style="height:19px;"  readonly="readonly"/>
			</td>
			<th><input name="fjf2mc" id="fjf2mc" value="${con.fjf2mc}" size="12" style="height:19px;"  readonly="readonly"/></th>
			<td><input name="fjf3mc"  value="${con.fjf3mc}" size="12" style="height:19px;"   readonly="readonly"/>
			</td>
			<th><input name="fjf4mc" id="fjf4mc" value="${con.fjf4mc}" size="12" style="height:19px;"   readonly="readonly"/></th>
			<td></td>
			
		</tr>
		
		<tr>
			<th>附加材料费金额</th>
			<td>
			   <input type="number" name="fjf1" value="${con.fjf1}" id="fjf1Id" size="8"  style="height:19px;width:104px" readonly="readonly"/><span>（元）</span>
			</td>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="number" name="fjf2" value="${con.fjf2}" id="fjf2Id" size="8"  style="height:19px;width:104px" readonly="readonly"/><span>（元）</span></th>
			<td>
			   <input type="number" name="fjf3" value="${con.fjf3}" id="fjf3Id" size="8"  style="height:19px;width:104px" readonly="readonly"/><span>（元）</span>
			</td>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="number" name="fjf4" value="${con.fjf4}" id="fjf4Id" size="8"  style="height:19px;width:104px" readonly="readonly"/><span>（元）</span></th>
			<td></td>
		</tr>
		<tr>
			<th>附加费交费日期</th>
			<td><input name="fjfrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.fjfrq }" />" size="12" style="height:19px;" readonly="readonly"/>
			</td>
			<th>附加费是否交清</th>
			<td>
			   <input name="fjfpb"  value="${con.fjfpb}" size="12" style="height:19px;" readonly="readonly"/>
			</td>
			<th>附加收款日期</th>
			<td>
			<input name="fjskrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.fjskrq }" />"  size="12" style="height:19px;" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			
			<th>小计</th>
			<td><input type="text" name="xj" value="${con.xj}" id="xjId"  size="12"  style="height:19px;" readonly/><span>（元）</span>
			</td>
			<th>预约落葬日期</th>
			<td><input type="text" name="yylzrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.yylzrq }" />"  size="12" style="height:19px;" readonly="readonly"/><span></span>
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
			<td><input name="wfksrq" id="startDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.wfksrq }" />" size="12"  style="height:19px;" readonly="readonly"/>
			</td>
			<th>维护年数</th>
			<td><input name="wfns" value="${con.wfns}" id="wfnsId" size="12" value="10"  style="height:19px;" readonly="readonly"/>
			</td>
			<th>维护结束日期</th>
			<td><input name="wfjsrq" id="endDate"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.wfjsrq }" />"  size="12"  style="height:19px;" readonly="readonly"/>
			</td>
		</tr>
		<tr>
		    <th>维护费/年</th>
		    <c:choose>
			<c:when test="${con.mxlb ==1 }">
			    <td><input name="glf" id="glfId" value="${con.glf1}" size="12" style="height:19px;" readonly /><span>（元）</span>
		        </td>
			</c:when>
		     <c:when test="${con.mxlb ==2 }">
				<td><input name="glf" id="glfId" value="${con.glf2}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==3 }">
				<td><input name="glf" id="glfId" value="${con.glf3}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
		     <c:when test="${con.mxlb ==4 }">
				<td><input name="glf" id="glfId" value="${con.glf4}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:when>
			<c:otherwise>
			    <td><input name="glf" id="glfId" value="${con.glf}" size="12" style="height:19px;" readonly /><span>（元）</span>
			    </td>
			</c:otherwise>
			</c:choose>
			<th>维护小计</th>
			<td>
			  <input name="wfhj" value="${con.wfhj}" id="wfhjId" size="12"  style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
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
			<th></th>
			<td><button class="inscriptionEditor" onclick="inscriptionEditor()" type="button">碑文编辑</button></td>
			<th></th>
			<td></td>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<th>刻字数</th>
			<td><input name="kzx" value="${con.kzx}" id="kzxId"   style="height:19px;width:104px" type="text"  readonly="readonly"/>
			</td>
			<th>刻字单价</th>
			<td><input name="kzxdj" value="${con.kzxdj}" id="kzxdjId"   style="height:19px;width:104px" type="number" readonly="readonly"/><span>（元）</span>
			</td>
			<th>刻字费</th>
			<td><input name="kzf" value="${con.kzf}" id="kzfId"   style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>刻框数</th>
			<td><input type="number" name="kks" value="${con.kks}" id="kksId"   style="height:19px;width:104px" readonly="readonly"/>
			</td>
			<th>刻框单价</th>
			<td><input type="number" name="kkdj" value="${con.kkdj}" id="kkdjId"   style="height:19px;width:104px" readonly="readonly"/><span>（元）</span>
			</td>
			<th>刻框费</th>
			<td><input type="number" name="kkf" id="kkfId"  value="${con.kkf}" style="height:19px;width:104px" readonly/><span>（元）</span>
			</td>
			
		</tr>
		<tr>
		  <th>瓷像类别</th>
			<td>
			<input name="cxmc"  value="${con.cxmc}" style="height:19px;width:104px" id="cxId" readonly="readonly"/>
			</td>
			<th>瓷像单价</th>
			<td><input name="cxdj"  value="${con.cxdj}" style="height:19px;width:104px" id="cxdjId" readonly="readonly"/><span>（元）</span></td>
		
			<th>瓷像数量</th>
			<td><input name="cxgs" value="${con.cxgs}" id="cxgsId" size="12"  style="height:19px;" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>瓷像费</th>
			<td><input name="cxf" value="${con.cxf}" id="cxfId" size="12"  style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
			<th>碑文小计</th>
			<td><input name="bwxj" value="${con.bwxj}" id="bwxjId" size="12"  style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
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
			   <td><input type = "number" value="${con.yshj}" name="yshj" id="yshjId" size="12"  style="height:19px;width:104px" readonly/><span>（元）</span>
			   </td>
			<th>优惠项目</th>
				<td>
				    <input name="zkmc" size="12" style="height:19px;" value="${con.zkmc}" readonly="readonly"/>
				</td>
			<th>优惠编号</th>
			<td><input name="zkbm" value="${con.zkbm}" size="12"  style="height:19px;" readonly="readonly"/>
			</td>
			
		</tr>
		<tr>
		    <th>优惠金额</th>
			   <td><input name="zkje" value="${con.zkje}" id="zkjeId"  style="height:19px;width:104px" type="number" readonly="readonly"/><span>（元）</span>
			</td>
			<th>实收金额</th>
			   <td><input type = "number" name="ssje" value="${con.ssje}" id="ssjeId"   style="height:19px;width:104px" readonly/><span>（元）</span>
			</td>
			 <th>预付金额</th>
			 <td>
			    <input type="number" name="qmje"  value="${con.qmje}" id="qmjeId"   style="height:19px;width:104px" readonly/><span>（元）</span>
			 </td>
			
		</tr>
		<tr>
		    
			<th>预付日期</th>
			 <td>
			   <input name="dmrq" id="dmrqId"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.dmrq }" />"  size="12"  style="height:19px;"  readonly/>
			 </td>
			 <th>交费</th>
			<td>
			   <input type="number"  name="jfje" value="${con.jfje}"  id="jfId"  style="height:19px;width:104px" readonly="readonly"/><span>（元）</span>
			</td>
			<th>欠费合计</th>
			<td><input type="number" name="qfhj" value="${con.qfhj}" id="qfhjId"   style="height:19px;width:104px" readonly/><span>（元）</span>
			</td>
			
		</tr>
		<tr>
		 <th>补交金额</th>
		 <td><input type="text" name="bjje" id="bjjeId"  value="${con.bjje}" style="height:19px;width:104px" /><span>（元）</span></td>
		 <th>补交日期</th>
		 <td>
		 	<input name="bjrq" id="bjrqId"  size="12" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.bjrq}"/>"  style="height:19px;" readonly />
		 </td>
		 <th>	</th><td></td>
		</tr>
			
		 <tr>
			<th>使用人姓名</th>
			<td>
			   <input name="syxm1"  value="${con.syxm1}" size="10" style="height:19px;"  readonly="readonly"/>
			   <input name="sy1qk" size="1" style="height:19px;" value="${con.sy1qk}" readonly="readonly"/>
			</td>
			<th>
			   <input name="syxm2"  value="${con.syxm2}" size="10" style="height:19px;"  readonly="readonly"/>
			   <input name="sy2qk" size="1" style="height:19px;" value="${con.sy2qk}" readonly="readonly"/>
			</th>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input name="syxm3"  value="${con.syxm3}" size="10" style="height:19px;"  readonly="readonly"/>
			    <input name="sy3qk" size="1" style="height:19px;" value="${con.sy3qk}" readonly="readonly"/>
			</td>
			<th>
			    <input name="syxm4"  value="${con.syxm4}" size="10" style="height:19px;"  readonly="readonly"/>
			    <input name="sy4qk" size="1" style="height:19px;" value="${con.sy4qk}" readonly="readonly"/>
			</th>
			<td></td>
		</tr>
		
	</table>

	
</form>
</body>
</html>
