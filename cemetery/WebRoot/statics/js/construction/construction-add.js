/**
 * Created by LIFEI477 on 2018/7/2.
 */



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
	
	    document.form1.action="<%=basePath%>/muxueGetAdd.html";
	
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
	$.get("findCxdjByCxmc/"+encodeURI(encodeURI($("#cxId").val())),function(data){
                if(data.status){
                     document.getElementById('cxdjId').value=data.obj.cxdj; 
                }
            },"json");
    };
    
    /* 根据墓区墓穴名称确定墓穴类别 */
    $(document).ready(function () {
    	$("#mxmcOneId").change(function(){
    		 var mqmcValue = $("#mqmcId").val();
    		 var mxmcValue = $("#mxmcOneId").val();
    		 var mxlb = $("#mxlbId");
    		 var mxjg = $("#mxjgId");
    		 var clf = $("#clfId");
    		 var lzf = $("#lzfId");
    		 var lhf = $("#lhfId");
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
			    if(data.mxlb=='1'){
			    	mxjg.val(data.mxjg1);
			        clf.val(data.clf1);
			        lzf.val(data.lzf1);
			        lhf.val(data.lhf1);
			        mxmj.val(data.mxmj1);
			        dlmj.val(data.dlmj1);
			    }else if(data.mxlb=='2'){
			    	mxjg.val(data.mxjg2);
			        clf.val(data.clf2);
			        lzf.val(data.lzf2);
			        lhf.val(data.lhf2);
			        mxmj.val(data.mxmj2);
			        dlmj.val(data.dlmj2);
			    
			    }else if(data.mxlb=='3'){
			    	mxjg.val(data.mxjg3);
			        clf.val(data.clf3);
			        lzf.val(data.lzf3);
			        lhf.val(data.lhf3);
			        mxmj.val(data.mxmj3);
			        dlmj.val(data.dlmj3);
			    }else if(data.mxlb=='4'){
			    	mxjg.val(data.mxjg4);
			        clf.val(data.clf4);
			        lzf.val(data.lzf4);
			        lhf.val(data.lhf4);
			        mxmj.val(data.mxmj4);
			        dlmj.val(data.dlmj4);
			    
			    }else{
			    	mxjg.val(data.mxjg);
			        clf.val(data.clf);
			        lzf.val(data.lzf);
			        lhf.val(data.lhf);
			        mxmj.val(data.mxmj);
			        dlmj.val(data.dlmj);
			    }
			 },
			 error:function(data){
				alert("出错了！！:"+data);
			 }
			
	    	  });	
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
			    dmrq.val(data.dmrq);
			    qmje.val(data.qmje);
			 },
			 error:function(data){
				dmrq.val("");
			    qmje.val("");
			 }
			
	    	  });	
    	 });
    });
   
