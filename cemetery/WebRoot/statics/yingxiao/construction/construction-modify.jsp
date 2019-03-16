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
    
    
	<%-- function save(){ 
	
	    document.form1.action="<%=basePath%>/sgdGetUpdate.html";
	
	    document.form1.submit();
	
	}
	
	function search(){
	
	    document.form1.action="<%=basePath%>/searchMuxue.html";
	
	    document.form1.submit();
	
	} --%>
	
     $(document).ready(function () {
          $("#mqmcId").change( function(){
    	    var dmpbValue = $('input[name="dmpb"]:checked').val();
    	    var mqmcValue = $("#mqmcId").val();
    	    var sgdNumValue = $("#sgdNum").val();
    	    var datas={
		   		'dmpbValue':dmpbValue,
		   		'mqmcValue':mqmcValue,
		   		'sgdNumValue':sgdNumValue
	        };
    	 	$.ajax({
			 type: "POST",
			 url:"<%=path%>/queryModifyMxmcByMqmcAndDmpb",
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
			 }
	    	  },"json");	
    	 });
    	 $('input:radio[name="dmpb"]').click( function(){
    	    var dmpbValue = $('input[name="dmpb"]:checked').val();
    	    var mqmcValue = $("#mqmcId").val();
    	    var sgdNumValue = $("#sgdNum").val();
    	    var datas={
		   		'dmpbValue':dmpbValue,
		   		'mqmcValue':mqmcValue,
		   		'sgdNumValue':sgdNumValue
	        };
    	 	$.ajax({
			 type: "POST",
			 url:"<%=path%>/queryModifyMxmcByMqmcAndDmpb",
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
    window.onload = function(){
       var mxlb = $("#mxlbId").val();
       var tdContent = "";
       if(mxlb == '1'){
       	  tdContent +='<th>使用人姓名</th>'+
			                    '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>';
       }else if(mxlb=='2'){
          tdContent += '<th>使用人姓名</th>'+
			                      '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" value="${con.syxm2}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy2qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>';
       	
       }else if(mxlb=='3'){
         tdContent += '<th>使用人姓名</th>'+
			                     '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" value="${con.syxm2}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy2qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>'+
			                      ' <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
				                      '<input name="syxm3"  size="10" value="${con.syxm3}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}" />'+
				                      '<select name="sy3qk" style="width:60px;height:24px;">'+
					                      '<option value="" >${con.sy3qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
				                      '</select>'+
			                      '</td>';
       	
       }else if(mxlb=='4'){
       		tdContent += '<th>使用人姓名</th>'+
			                     '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" value="${con.syxm2}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy2qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>'+
			                      ' <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
				                      '<input name="syxm3"  size="10" value="${con.syxm3}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}" />'+
				                      '<select name="sy3qk" style="width:60px;height:24px;">'+
					                      '<option value="" >${con.sy3qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
				                      '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm4"  size="10" value="${con.syxm4}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy4qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy4qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>';
       }
       $("#syrxmAndsyqk").html(tdContent);
    }
    /* 定墓小计计算 */
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
			        tdContent +='<th>使用人姓名</th>'+
			                    '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
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
			        tdContent += '<th>使用人姓名</th>'+
			                      '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" value="${con.syxm2}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy2qk}</option>'+
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
			        tdContent += '<th>使用人姓名</th>'+
			                     '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" value="${con.syxm2}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy2qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>'+
			                      ' <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
				                      '<input name="syxm3"  size="10" value="${con.syxm3}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}" />'+
				                      '<select name="sy3qk" style="width:60px;height:24px;">'+
					                      '<option value="" >${con.sy3qk}</option>'+
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
			        tdContent += '<th>使用人姓名</th>'+
			                     '<td>'+
			                        '<input name="syxm1" size="10" value="${con.syxm1}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>' +
				                    '<select name="sy1qk" style="width:60px;height:24px;">'+
				                        '<option value="">${con.sy1qk}</option>'+
				                        '<option value="寿">寿</option>'+
				                        '<option value="故">故</option>'+
				                     '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm2"  size="10" value="${con.syxm2}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy2qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy2qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
			                          '</select>'+
			                      '</th>'+
			                      ' <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
				                      '<input name="syxm3"  size="10" value="${con.syxm3}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}" />'+
				                      '<select name="sy3qk" style="width:60px;height:24px;">'+
					                      '<option value="" >${con.sy3qk}</option>'+
					                      '<option value="寿">寿</option>'+
					                      '<option value="故">故</option>'+
				                      '</select>'+
			                      '</td>'+
			                      '<th>'+
			                         '<input name="syxm4"  size="10" value="${con.syxm4}" style="height:19px;" placeholder="请输入..." onkeydown="if(event.keyCode==13){return false;}"/>'+
			                          '<select name="sy4qk" style="width:60px;height:24px;">'+
					                      '<option value="">${con.sy4qk}</option>'+
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
			    }
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
	  $("#calculateFj").click(function(){
	       var mzfId = $("#mzfId").val();
	        if (mzfId=="") {
			    $("#mzfId").val("0.00");
	        }else{
	        	if (mzfId.indexOf(".")< 0) {
				  $("#mzfId").val(mzfId+".00");
		        }
	        }
          var mzfIdCount = parseFloat(mzfId);
	        if(isNaN(mzfIdCount)){
	        	mzfIdCount=0.00;
	        }
	        var mdfId = $("#mdfId").val();
              if (mdfId=="") {
			    $("#mdfId").val("0.00");
	        }else{
	        	if (mdfId.indexOf(".")< 0) {
				  $("#mdfId").val(mdfId+".00");
		        }
	        }
	        var mdfIdCount = parseFloat(mdfId);
	        if(isNaN(mdfIdCount)){
	        	mdfIdCount=0.00;
	        }
	      var clfId = $("#clfId").val();
	       if (clfId=="") {
			    $("#clfId").val("0.00");
	        }else{
	        	if (clfId.indexOf(".")< 0) {
				  $("#clfId").val(clfId+".00");
		        }
	        }
	        
	      var clfIdCount = parseFloat(clfId);
	        if(isNaN(clfIdCount)){
	        	clfIdCount=0.00;
	        }
	      var lzfId = $("#lzfId").val();
	       if (lzfId=="") {
			    $("#lzfId").val("0.00");
	        }else{
	        	if (lzfId.indexOf(".")< 0) {
				  $("#lzfId").val(lzfId+".00");
		        }
	        }
	        var lzfIdCount = parseFloat(lzfId);
	        if(isNaN(lzfIdCount)){
	        	lzfIdCount=0.00;
	        }
	       var lhfId = $("#lhfId").val();
	       if (lhfId=="") {
			    $("#lhfId").val("0.00");
	        }else{
	        	if (lhfId.indexOf(".")< 0) {
				  $("#lhfId").val(lhfId+".00");
		        }
	        }    
           var lhfIdCount = parseFloat(lhfId);
	        if(isNaN(lhfIdCount)){
	        	lhfIdCount=0.00;
	        }
		   var fjf1Id = $("#fjf1Id").val();
		    if (fjf1Id=="") {
			    $("#fjf1Id").val("0.00");
	        }else{
	        	if (fjf1Id.indexOf(".")< 0) {
				  $("#fjf1Id").val(fjf1Id+".00");
		        }
	        }
	         var fjf1IdCount = parseFloat(fjf1Id);
	        if(isNaN(fjf1IdCount)){
	        	fjf1IdCount=0.00;
	        }
	         var fjf2Id = $("#fjf2Id").val();
		    if (fjf2Id=="") {
			    $("#fjf2Id").val("0.00");
	        }else{
	        	if (fjf2Id.indexOf(".")< 0) {
				  $("#fjf2Id").val(fjf2Id+".00");
		        }
	        }
	         var fjf2IdCount = parseFloat(fjf2Id);
	        if(isNaN(fjf2IdCount)){
	        	fjf2IdCount=0.00;
	        }
	         var fjf3Id = $("#fjf3Id").val();
		    if (fjf3Id=="") {
			    $("#fjf3Id").val("0.00");
	        }else{
	        	if (fjf3Id.indexOf(".")< 0) {
				  $("#fjf3Id").val(fjf3Id+".00");
		        }
	        }
	        var fjf3IdCount = parseFloat(fjf3Id);
	        if(isNaN(fjf3IdCount)){
	        	fjf3IdCount=0.00;
	        }
	         var fjf4Id = $("#fjf4Id").val();
		    if (fjf4Id=="") {
			    $("#fjf4Id").val("0.00");
	        }else{
	        	if (fjf4Id.indexOf(".")< 0) {
				  $("#fjf4Id").val(fjf4Id+".00");
		        }
	        }
	        var fjf4IdCount = parseFloat(fjf4Id);
	        if(isNaN(fjf4IdCount)){
	        	fjf4IdCount=0.00;
	        }
	       var xjCount = mzfIdCount + mdfIdCount + clfIdCount+ lzfIdCount + lhfIdCount + fjf1IdCount + fjf2IdCount + fjf3IdCount + fjf4IdCount;
	       $("#xjId").val(xjCount.toFixed(2));
	        var xjId = $("#xjId").val();
                if (xjId=="") {
				    $("#xjId").val("0.00");
		        }else{
		        	if (xjId.indexOf(".")< 0) {
					  $("#xjId").val(xjId+".00");
			        }
		        }
		        var xjIdCount = parseFloat(xjId);
		        if(isNaN(xjIdCount)){
		        	xjIdCount=0.00;
		        }
		        
		        var wfhjId = $("#wfhjId").val();
                if (wfhjId=="") {
				    $("#wfhjId").val("0.00");
		        }else{
		        	if (wfhjId.indexOf(".")< 0) {
					  $("#wfhjId").val(wfhjId+".00");
			        }
		        }
		        var wfhjIdCount = parseFloat(wfhjId);
		        if(isNaN(wfhjIdCount)){
		        	wfhjIdCount=0.00;
		        }
		        
		        var yshjIdCount = xjIdCount + wfhjIdCount;
		        $("#yshjId").val(yshjIdCount.toFixed(2));
	     
	  });
	  
	 $("#startDate").click(function(){
 		    var wfnsId = $("#wfnsId").val();
		   /*  if (wfnsId=="") {
			    $("#wfnsId").val("0.00");
	        }else{
	        	if (wfnsId.indexOf(".")< 0) {
				  $("#wfnsId").val(wfnsId+".00");
		        }
	        }
	        var wfnsIdCount = parseFloat(wfnsId); 
	        if(isNaN(wfnsIdCount)){
	        	wfnsIdCount=0.00;
	        }*/
	        var glfId = $("#glfId").val();
		    if (glfId=="") {
			    $("#glfId").val("0.00");
	        }else{
	        	if (glfId.indexOf(".")< 0) {
				  $("#glfId").val(glfId+".00");
		        }
	        }
	        var glfIdCount = parseFloat(glfId);
	        if(isNaN(glfIdCount)){
	        	glfIdCount=0.00;
	        }
	        var wfhjCount = wfnsId*glfIdCount;
	        $("#wfhjId").val(wfhjCount.toFixed(2));
	         var xjId = $("#xjId").val();
               if (xjId=="") {
			    $("#xjId").val("0.00");
	        }else{
	        	if (xjId.indexOf(".")< 0) {
				  $("#xjId").val(xjId+".00");
		        }
	        }
	        var xjIdCount = parseFloat(xjId);
	        if(isNaN(xjIdCount)){
	        	xjIdCount=0.00;
	        }
	        
	        var wfhjId = $("#wfhjId").val();
               if (wfhjId=="") {
			    $("#wfhjId").val("0.00");
	        }else{
	        	if (wfhjId.indexOf(".")< 0) {
				  $("#wfhjId").val(wfhjId+".00");
		        }
	        }
	        var wfhjIdCount = parseFloat(wfhjId);
	        if(isNaN(wfhjIdCount)){
	        	wfhjIdCount=0.00;
	        }
	        
	        var yshjIdCount = xjIdCount + wfhjIdCount;
	        $("#yshjId").val(yshjIdCount.toFixed(2));
 		});
	          
 		$("#wfnsId").blur(function(){
 		    var wfnsId = $("#wfnsId").val();
		   /*  if (wfnsId=="") {
			    $("#wfnsId").val("0.00");
	        }else{
	        	if (wfnsId.indexOf(".")< 0) {
				  $("#wfnsId").val(wfnsId+".00");
		        }
	        }
	        var wfnsIdCount = parseFloat(wfnsId);
	        if(isNaN(wfnsIdCount)){
	        	wfnsIdCount=0.00;
	        } */
	        var glfId = $("#glfId").val();
		    if (glfId=="") {
			    $("#glfId").val("0.00");
	        }else{
	        	if (glfId.indexOf(".")< 0) {
				  $("#glfId").val(glfId+".00");
		        }
	        }
	        var glfIdCount = parseFloat(glfId);
	        if(isNaN(glfIdCount)){
	        	glfIdCount=0.00;
	        }
	        var wfhjCount = wfnsId*glfIdCount;
	        $("#wfhjId").val(wfhjCount.toFixed(2));
	         var xjId = $("#xjId").val();
               if (xjId=="") {
			    $("#xjId").val("0.00");
	        }else{
	        	if (xjId.indexOf(".")< 0) {
				  $("#xjId").val(xjId+".00");
		        }
	        }
	        var xjIdCount = parseFloat(xjId);
	        if(isNaN(xjIdCount)){
	        	xjIdCount=0.00;
	        }
	        
	        var wfhjId = $("#wfhjId").val();
               if (wfhjId=="") {
			    $("#wfhjId").val("0.00");
	        }else{
	        	if (wfhjId.indexOf(".")< 0) {
				  $("#wfhjId").val(wfhjId+".00");
		        }
	        }
	        var wfhjIdCount = parseFloat(wfhjId);
	        if(isNaN(wfhjIdCount)){
	        	wfhjIdCount=0.00;
	        }
	        
	        var yshjIdCount = xjIdCount + wfhjIdCount;
	        $("#yshjId").val(yshjIdCount.toFixed(2));
	        AddWfnsDate();
 		});
 		 $("#kzxdjId").blur(function(){
 		   var kzxdjId = $("#kzxdjId").val();
 		   if (kzxdjId=="") {
			    $("#kzxdjId").val("0.00");
	        }else{
	        	if (kzxdjId.indexOf(".")< 0) {
				  $("#kzxdjId").val(kzxdjId+".00");
		        }
	        }
	        var kzxdjIdCount = parseFloat(kzxdjId);
	        if(isNaN(kzxdjIdCount)){
	        	kzxdjIdCount=0.00;
	        }
	        var kzxId = $("#kzxId").val();
	        kzxIdCount = parseFloat(kzxId);
            if(isNaN(kzxIdCount)){
               kzxIdCount=0;
            }
           var kzfIdCount =  kzxIdCount * kzxdjIdCount;
            $("#kzfId").val(kzfIdCount.toFixed(2));
         });
          $("#kzxId").blur(function(){
 		   var kzxdjId = $("#kzxdjId").val();
 		   if (kzxdjId=="") {
			    $("#kzxdjId").val("0.00");
	        }else{
	        	if (kzxdjId.indexOf(".")< 0) {
				  $("#kzxdjId").val(kzxdjId+".00");
		        }
	        }
	        var kzxdjIdCount = parseFloat(kzxdjId);
	        if(isNaN(kzxdjIdCount)){
	        	kzxdjIdCount=0.00;
	        }
	        var kzxId = $("#kzxId").val();
	        kzxIdCount = parseFloat(kzxId);
            if(isNaN(kzxIdCount)){
               kzxIdCount=0;
            }
            var kzfIdCount =  kzxIdCount * kzxdjIdCount;
             $("#kzfId").val(kzfIdCount.toFixed(2));
         });
         $("#kksId").blur(function(){
 		    var kkdjId = $("#kkdjId").val();
 		   if (kkdjId=="") {
			    $("#kkdjId").val("0.00");
	        }else{
	        	if (kkdjId.indexOf(".")< 0) {
				  $("#kkdjId").val(kkdjId+".00");
		        }
	        }
	        var kkdjIdCount = parseFloat(kkdjId);
	        if(isNaN(kkdjIdCount)){
	        	kkdjIdCount=0.00;
	        }
	        var kksId = $("#kksId").val();
	        kksIdCount = parseFloat(kksId);
            if(isNaN(kksIdCount)){
               kksIdCount=0;
            }
            var kkfIdCount =  kksIdCount * kkdjIdCount;
             $("#kkfId").val(kkfIdCount.toFixed(2));
         });
          $("#kkdjId").blur(function(){
 		    var kkdjId = $("#kkdjId").val();
 		   if (kkdjId=="") {
			    $("#kkdjId").val("0.00");
	        }else{
	        	if (kkdjId.indexOf(".")< 0) {
				  $("#kkdjId").val(kkdjId+".00");
		        }
	        }
	        var kkdjIdCount = parseFloat(kkdjId);
	        if(isNaN(kkdjIdCount)){
	        	kkdjIdCount=0.00;
	        }
	        var kksId = $("#kksId").val();
	        kksIdCount = parseFloat(kksId);
            if(isNaN(kksIdCount)){
               kksIdCount=0;
            }
            var kkfIdCount =  kksIdCount * kkdjIdCount;
             $("#kkfId").val(kkfIdCount.toFixed(2));
         });
          
          $("#cxgsId").blur(function(){
	       	  var cxdjId = $("#cxdjId").val();
	       	   if (cxdjId=="") {
			    $("#cxdjId").val("0.00");
	        }else{
	        	if (cxdjId.indexOf(".")< 0) {
				  $("#cxdjId").val(cxdjId+".00");
		        }
	        }
	        var cxdjIdCount = parseFloat(cxdjId);
	        if(isNaN(cxdjIdCount)){
	        	cxdjIdCount=0.00;
	        }
	        var cxgsId = $("#cxgsId").val();
	        var cxgsIdCount = parseFloat(cxgsId);
            if(isNaN(cxgsIdCount)){
               cxgsIdCount=0;
            }
            var cxfIdCount =  cxdjIdCount * cxgsIdCount;
             $("#cxfId").val(cxfIdCount.toFixed(2));
          });
          
            $("#calculateBw").click(function(){
                var cxdjId = $("#cxdjId").val();
	       	   if (cxdjId=="") {
				    $("#cxdjId").val("0.00");
		        }else{
		        	if (cxdjId.indexOf(".")< 0) {
					  $("#cxdjId").val(cxdjId+".00");
			        }
		        }
		        var cxdjIdCount = parseFloat(cxdjId);
		        if(isNaN(cxdjIdCount)){
		        	cxdjIdCount=0.00;
		        }
		        var cxgsId = $("#cxgsId").val();
		        var cxgsIdCount = parseFloat(cxgsId);
	            if(isNaN(cxgsIdCount)){
	               cxgsIdCount=0;
	            }
	            var cxfIdCount =  cxdjIdCount * cxgsIdCount;
	             $("#cxfId").val(cxfIdCount.toFixed(2));
	             
	            var kzfId = $("#kzfId").val();
	             if (kzfId=="") {
				    $("#kzfId").val("0.00");
		        }else{
		        	if (kzfId.indexOf(".")< 0) {
					  $("#kzfId").val(kzfId+".00");
			        }
		        }
		        var kzfIdCount = parseFloat(kzfId);
		        if(isNaN(kzfIdCount)){
		        	kzfIdCount=0.00;
		        }
            	var kkfId = $("#kkfId").val();
            	 if (kkfId=="") {
				    $("#kkfId").val("0.00");
		        }else{
		        	if (kkfId.indexOf(".")< 0) {
					  $("#kkfId").val(kkfId+".00");
			        }
		        }
		        var kkfIdCount = parseFloat(kkfId);
		        if(isNaN(kkfIdCount)){
		        	kkfIdCount=0.00;
		        }
		        var bwxjCount = cxfIdCount + kzfIdCount + kkfIdCount;
		        $("#bwxjId").val(bwxjCount.toFixed(2))
		         var xjId = $("#xjId").val();
                if (xjId=="") {
				    $("#xjId").val("0.00");
		        }else{
		        	if (xjId.indexOf(".")< 0) {
					  $("#xjId").val(xjId+".00");
			        }
		        }
		        var xjIdCount = parseFloat(xjId);
		        if(isNaN(xjIdCount)){
		        	xjIdCount=0.00;
		        }
		        
		        var wfhjId = $("#wfhjId").val();
                if (wfhjId=="") {
				    $("#wfhjId").val("0.00");
		        }else{
		        	if (wfhjId.indexOf(".")< 0) {
					  $("#wfhjId").val(wfhjId+".00");
			        }
		        }
		        var wfhjIdCount = parseFloat(wfhjId);
		        if(isNaN(wfhjIdCount)){
		        	wfhjIdCount=0.00;
		        }
		        
		         var bwxjId = $("#bwxjId").val();
                if (bwxjId=="") {
				    $("#bwxjId").val("0.00");
		        }else{
		        	if (bwxjId.indexOf(".")< 0) {
					  $("#bwxjId").val(bwxjId+".00");
			        }
		        }
		        var bwxjIdCount = parseFloat(bwxjId);
		        if(isNaN(bwxjIdCount)){
		        	bwxjIdCount=0.00;
		        }
		        var yshjIdCount = xjIdCount + wfhjIdCount + bwxjIdCount;
		        $("#yshjId").val(yshjIdCount.toFixed(2));
            });
            $("#zkjeId").blur(function(){
              var yshjId =  $("#yshjId").val();
	          if (yshjId=="") {
				    $("#yshjId").val("0.00");
		        }else{
		        	if (yshjId.indexOf(".")< 0) {
					  $("#yshjId").val(yshjId+".00");
			        }
		        }
			  var yshjIdCount = parseFloat(yshjId);
			  if(isNaN(yshjIdCount)){
	               yshjIdCount=0.00;
	          }
              var zkjeId =  $("#zkjeId").val();
	          if (zkjeId=="") {
				    $("#zkjeId").val("0.00");
		        }else{
		        	if (zkjeId.indexOf(".")< 0) {
					  $("#zkjeId").val(zkjeId+".00");
			        }
		        }
			  var zkjeIdCount = parseFloat(zkjeId);
			  if(isNaN(zkjeIdCount)){
	               zkjeIdCount=0.00;
	          }
			  var ssjeCount = yshjIdCount - zkjeIdCount;
	          $("#ssjeId").val(ssjeCount.toFixed(2));
	      });
	      $("#jfId").blur(function(){
	      	 var jfId = $("#jfId").val();
	      	 if (jfId=="") {
				    $("#jfId").val("0.00");
		        }else{
		        	if (jfId.indexOf(".")< 0) {
					  $("#jfId").val(jfId+".00");
			        }
		        }
			  var jfIdCount = parseFloat(jfId);
			  if(isNaN(jfIdCount)){
	               jfIdCount=0.00;
	          }
	          
	         var qmjeId =  $("#qmjeId").val();
	          var qmjeId = $("#qmjeId").val();
	          if (qmjeId=="") {
				    $("#qmjeId").val("0.00");
		        }else{
		        	if (qmjeId.indexOf(".")< 0) {
					  $("#qmjeId").val(qmjeId+".00");
			        }
		        }
			  var qmjeIdCount = parseFloat(qmjeId);
			  if(isNaN(qmjeIdCount)){
	               qmjeIdCount=0.00;
	          }
	         var ssjeId = $("#ssjeId").val();
	          if (ssjeId=="") {
				    $("#ssjeId").val("0.00");
		        }else{
		        	if (ssjeId.indexOf(".")< 0) {
					  $("#ssjeId").val(ssjeId+".00");
			        }
		        }
			  var ssjeIdCount = parseFloat(ssjeId);
			  if(isNaN(ssjeIdCount)){
	               ssjeIdCount=0.00;
	          }
	          var qfhjIdCount = ssjeIdCount - qmjeIdCount - jfIdCount;
	          $("#qfhjId").val(qfhjIdCount.toFixed(2));
	      });
	      $("#bjjeId").blur(function(){
	      	 var jfId = $("#jfId").val();
	      	  if (jfId=="") {
				    $("#jfId").val("0.00");
		        }else{
		        	if (jfId.indexOf(".")< 0) {
					  $("#jfId").val(jfId+".00");
			        }
		        }
			  var jfIdCount = parseFloat(jfId);
			  if(isNaN(jfIdCount)){
	               jfIdCount=0.00;
	          }
	          var qfhjId = $("#qfhjId").val();
	          if (qfhjId=="") {
				    $("#qfhjId").val("0.00");
		        }else{
		        	if (qfhjId.indexOf(".")< 0) {
					  $("#qfhjId").val(qfhjId+".00");
			        }
		        }
			  var qfhjIdCount = parseFloat(qfhjId);
			  if(isNaN(qfhjIdCount)){
	               qfhjIdCount=0.00;
	          }
	        var bjjeId = $("#bjjeId").val();
	         if (bjjeId=="") {
				    $("#bjjeId").val("0.00");
		        }else{
		        	if (bjjeId.indexOf(".")< 0) {
					  $("#bjjeId").val(bjjeId+".00");
			        }
		        }
			  var bjjeIdCount = parseFloat(bjjeId);
			  if(isNaN(bjjeIdCount)){
	               bjjeIdCount=0.00;
	          }
	         var jfIdCount1 = jfIdCount + bjjeIdCount;
	         $("#jfId").val(jfIdCount1.toFixed(2));
	         var qfhjIdCount1 = qfhjIdCount - bjjeIdCount;
	         $("#qfhjId").val(qfhjIdCount1.toFixed(2)) 
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
   		    alert('修改成功！');
	        document.form1.action="<%=basePath%>/updateSGD.html";
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
  <!--  <div style="display:none;">
      <textarea rows="30" cols="20" id="editorTextId"> </textarea>
   </div> -->
   <input type="hidden" name="editorText" id="editorTextId" />
   <input type="hidden" name="wordsNumber" id="wordsNumberId" />
 
  <form method="post" name="form1" onsubmit="return save()">
	<div class="page_title">营销管理&gt;施工单&gt;施工单修改</div>
	<div class="button_bar">
		<button class="common_button" type="submit">保存</button>
	</div>
	<table class="query_form_table">
        <tr>
			<th>施工单编号</th>
			<td><input name="sgdbh" id="sgdNum" value="${con.sgdbh}" size="12" style="height:19px;" readonly/>
			</td>
			<th>结账日期</th>
			<td>
			   <input name="jzskrq" id="jzskrqId" size="12" style="height:19px;" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.jzskrq }" />" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			</td>
			<th>结账员</th>
			<td><select name="jzyId" id="jzyId" style="width:60px;height:24px;">
			           <option value="">${con.jzy}</option>
						<c:forEach var="jzy" items="${jzyList }">
							<option ${con.jzy eq '${jzy.jzy}'?'selected':''} value="${jzy.id}">${jzy.jzy}
						    </option>
						</c:forEach>
				</select>
				<span class="red_star" id="red_star">*</span>
			</td>
		</tr>
		<tr>
			<th>联系人姓名</th>
			<td><input name="lxrxm" id="lxrxmId" value="${con.lxrxm}" size="12" style="height:19px;"  onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			</td>
			<th>联系电话</th>
			<td><input name="lxrdh" id="lxrdhId" value="${con.lxrdh}" size="12" style="height:19px;"  onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			</td>
			<th>来自区县</th>
			<td>
				<select name="ssmc" id="ssId" style="width:60px;height:24px;">
							 <option>${con.ssmc}</option>
							<c:forEach var="ad" items="${addressList}">
							      <option value="${ad.ssmc}"  ${ad.ssmc == param['ssmc']?'selected':''}>${ad.ssmc}</option>
							</c:forEach>
							
				</select>---<select name="qxmc" id="qxmcId" style="width:60px;height:24px;">
						<option>${con.qxmc}</option>
				</select>
				<span class="red_star" id="red_star">*</span>
			</td>
		</tr>
		<tr>
			<th>联系地址</th>
			<td colspan="3">
			   <input name="lxrdz" id="lxrdzId" value="${con.lxrdz}" size="50" style="height:19px;"  onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			</td>
			<th>邮政编码</th>
			<td>
			   <input name="lxryb" id="lxrybId" value="${con.lxryb}" size="12" style="height:19px;"  onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			</td>
		</tr>
		<tr>
			<th>墓证费</th>
			<td>
			   <input name="mzf" id="mzfId" value="${con.mzf}" id="mzfId"  size="12" style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/>
			   <span class="red_star" id="red_star">*</span>
			   <span>（元）</span>
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
				<select name="mqmcId" style="width:110px;height:24px;" id="mqmcId">
						<option value="">${con.mqmcId}</option>
						<c:forEach var="mq" items="${muquList}">
							<option value="${mq.mqmc}" ${con.mqmcId eq '${mq.mqmc}'?'selected':''}>
								${mq.mqmc}
							 </option>
						</c:forEach>
				</select>
			</td>
			<th>是否定墓</th>
			<td>
			    <input type="radio" name="dmpb" value="1"  <c:if test="${con.dmpb=='1'}"> checked='checked'</c:if> />是 
			    <input type="radio" name="dmpb" value="0"  <c:if test="${con.dmpb=='0'}"> checked='checked'</c:if>/>否
			</td>
			<th>墓穴名称</th>
		    <td>
			    <select name="mxmc" style="width:110px;height:24px;" id="mxmcOneId">
						<option value="">${con.mxmc}</option>
				</select>
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
			<td><input name="fjf1mc" value="${con.fjf1mc}" size="12" style="height:19px;"  onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th><input name="fjf2mc" value="${con.fjf2mc}" size="12" style="height:19px;"   onkeydown="if(event.keyCode==13){return false;}"/></th>
			<td><input name="fjf3mc"  value="${con.fjf3mc}" size="12" style="height:19px;"   onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th><input name="fjf4mc" value="${con.fjf4mc}" size="12" style="height:19px;"   onkeydown="if(event.keyCode==13){return false;}"/></th>
			<td></td>
			
		</tr>
		
		<tr>
			<th>附加材料费金额</th>
			<td>
			   <input type="number" name="fjf1" value="${con.fjf1}" id="fjf1Id" size="8"  style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="number" name="fjf2" value="${con.fjf2}" id="fjf2Id" size="8"  style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span></th>
			<td>
			   <input type="number" name="fjf3" value="${con.fjf3}" id="fjf3Id" size="8"  style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="number" name="fjf4" value="${con.fjf4}" id="fjf4Id" size="8"  style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span></th>
			<td></td>
		</tr>
		<tr>
			<th>附加费交费日期</th>
			<td><input name="fjfrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.fjfrq}" />" size="12" style="height:19px;" class="Wdate"   onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>附加费是否交清</th>
			<td>
			    <select name="fjfpb" value="${con.fjfpb}" id="fjfpbId" style="width:110px;height:24px;">
						<option value="">--请选择--</option>
						<option value="1">是</option>
						<option value="0">否</option>
				</select>
			</td>
			<th>附加收款日期</th>
			<td>
			<input name="fjskrq"  value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.fjskrq}"/>" size="12" style="height:19px;" class="Wdate"   onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
		</tr>
		<tr>
			<th>预约落葬日期</th>
			<td><input type="text" name="yylzrq" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.yylzrq}"/>"
				 size="12" style="height:19px;" class="Wdate"   onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/><span></span>
			</td>
			<th>小计</th>
			<td>
			   <input type="text" name="xj" value="${con.xj}" id="xjId"  size="12"  style="height:19px;" readonly/><span>（元）</span>
			   <button id="calculateFj" type="button">计算</button>
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
			<td><input name="wfksrq" id="startDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.wfksrq}"/>" size="12"  style="height:19px;" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>维护年数</th>
			<td><input name="wfns" value="${con.wfns}" id="wfnsId" size="12" value="10"  style="height:19px;"  onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>维护结束日期</th>
			<td><input name="wfjsrq" id="endDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.wfjsrq}"/>" size="12"  style="height:19px;" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
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
			<th>维护交费日期</th>
			<td><input name="whskrq" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.whskrq}" />"  id="whskrqId" type="text" size="12" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
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
			<td><input name="kzx" value="${con.kzx}" id="kzxId"   style="height:19px;width:104px" type="text"  onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>刻字单价</th>
			<td><input name="kzxdj" value="${con.kzxdj}" id="kzxdjId"   style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>刻字费</th>
			<td><input name="kzf" value="${con.kzf}" id="kzfId"   style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
		</tr>
		<tr>
			<th>刻框数</th>
			<td><input type="number" name="kks" value="${con.kks}" id="kksId"   style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
			<th>刻框单价</th>
			<td><input type="number" name="kkdj" value="${con.kkdj}" id="kkdjId"   style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
			</td>
			<th>刻框费</th>
			<td><input type="number" name="kkf" id="kkfId"  value="${con.kkf}" style="height:19px;width:104px" readonly/><span>（元）</span>
			</td>
			
		</tr>
		<tr>
		  <th>瓷像类别</th>
			<td>
			<select name="cxmc" style="width:110px;height:24px;" id="cxId" onchange="dj()">
						<option value="">${cixiang.cxmc}</option>

						 <c:forEach var="cx" items="${ciXiangList }">

							<option value="${cx.id}"
								${cx.id == param['id']?'selected':''}>${cx.cxmc
								}</option>
						</c:forEach> 
				</select>
			</td>
			<th>瓷像单价</th>
			<td><input name="cxdj"  value="${cixiang.cxdj}" style="height:19px;width:104px" id="cxdjId" readonly="readonly"/><span>（元）</span></td>
		
			<th>瓷像数量</th>
			<td><input name="cxgs" value="${con.cxgs}" id="cxgsId" size="12"  style="height:19px;" onkeydown="if(event.keyCode==13){return false;}"/>
			</td>
		</tr>
		<tr>
			<th>瓷像费</th>
			<td><input name="cxf" value="${con.cxf}" id="cxfId" size="12"  style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
			</td>
			<th>碑文小计</th>
			<td>
				<input name="bwxj" value="${con.bwxj}" id="bwxjId" size="12"  style="height:19px;width:104px" type="number" readonly/><span>（元）</span>
				<button id="calculateBw" type="button">计算</button>
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
		    <th>应收金额</th>
			   <td>
			      <input type = "number" value="${con.yshj}" name="yshj" id="yshjId" size="12"  style="height:19px;width:104px" readonly/><span>（元）</span>
			   </td>
			<th>优惠项目</th>
				<td>
					<input name="zkmc" id="zkmcId" value="${con.zkmc}" size="12" placeholder="请输入..." style="height:19px;"  readonly/>
				</td>
			<th>优惠编号</th>
			<td><input name="zkbm" value="${con.zkbm}" size="12"  style="height:19px;"  readonly/>
			</td>
			
		</tr>
		<tr>
		    <th>优惠金额</th>
			   <td><input name="zkje" value="${con.zkje}" id="zkjeId"  style="height:19px;width:104px" type="text" readonly/><span>（元）</span>
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
			   <input name="dmrq" id="dmrqId" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.dmrq}"/>"  size="12"  style="height:19px;"  readonly/>
			 </td>
			 <th>交费总额</th>
			<td>
			   <input type="number"  name="jfje" value="${con.jfje}"  id="jfId"  style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}"/><span>（元）</span>
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
		 	<input name="bjrq" id="bjrqId"  size="12" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.bjrq}"/>"  style="height:19px;" class="Wdate"  onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onkeydown="if(event.keyCode==13){return false;}"/>
		 </td>
		 <th>	</th><td></td>
		</tr>
		 <tr id="syrxmAndsyqk">
			<!-- 使用人姓名 -->
		</tr>
		
	</table>

	
</form>
</body>
</html>
