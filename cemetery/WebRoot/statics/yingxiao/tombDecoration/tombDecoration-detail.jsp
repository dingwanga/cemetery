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
    <div class="page_title">营销管理&gt;墓穴装修&gt;墓穴装修新建</div>
    <input type="hidden" name="editorText" id="editorTextId" />
   <input type="hidden" name="wordsNumber" id="wordsNumberId" />
        <table class="query_form_table">
	     <tr>			
			<th>施工单编号</th>
			<td><input name="sgdbh"  id="sgdNum"  value="${tombDecoration.sgdbh}" readonly size="12" style="height:19px;" /></td> 
			<th>定墓日期</th>
			<td><input name="dmrq"  id="showDmrq" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tombDecoration.dmrq}" />" readonly size="12" style="height:19px;" /></td>
			<th>联系人姓名</th>
			<td><input name="lxrxm" id="showLxrxm" value="${tombDecoration.lxrxm}" readonly size="12" style="height:19px;" /></td>
	    </tr>
	     <tr>			
			<th>联系人电话</th>
			<td><input name="lxrdh" id="showLxrdh"  value="${tombDecoration.lxrdz}" readonly size="12" style="height:19px;" /></td>
			<th>联系人地址</th>
			<td><input name="lxrdz" id="showLxrdz"  value="${tombDecoration.lxrdh}" readonly size="48" /></td>
			<th>&nbsp;</th><td>&nbsp;</td>
			
	    </tr>
	    <tr>			
			<th>墓区名称</th>
			<td><input name="mqmcId" id="showMqmcId" value="${tombDecoration.mqmcId}" readonly size="12" style="height:19px;" /></td>
			<th>墓穴名称</th>
			<td><input name="mxmc"  id="showMxmc"  value="${tombDecoration.mxmc}" readonly size="12" style="height:19px;" /></td>
			<th>墓穴类别</th>
			<td><input name="mxlb" id="showMxlb"  value="${tombDecoration.mxlb}" readonly size="12" style="height:19px;" /></td>
	    </tr>
	    <tr>			
			<th>使用人姓名</th>
			<td>
			   <input name="syrxm1" id="showSyrxm1" value="${tombDecoration.syrxm1}"  size="8" style="height:19px;" readonly/>-
			   <input name="sy1qk" id="sy1qk" value="${tombDecoration.sy1qk}"  size="1" style="height:19px;" readonly/>
			</td>
			<th>
			    <input name="syrxm2" id="showSyrxm2"  value="${tombDecoration.syrxm2}"  size="8" style="height:19px;" readonly/>-
			    <input name="sy2qk" id="showSy2qk" value="${tombDecoration.sy2qk}"  size="1" style="height:19px;" readonly/>
		   </th>
			
			<td>
			   <input name="syrxm3" id="showSyrxm3"  value="${tombDecoration.syrxm3}"  size="8" style="height:19px;" readonly/>-
			   <input name="sy3qk" id="showSy3qk" value="${tombDecoration.sy3qk}"  size="1" style="height:19px;" readonly/>
			</td>
			
			<th>
			   <input name="syrxm4" id="showSyrxm4" value="${tombDecoration.syrxm4}" size="8" style="height:19px;" readonly/>-
			   <input name="sy4qk" id="showSy4qk" value="${tombDecoration.sy3qk}"  size="1" style="height:19px;" readonly/>
		    </th>
			
			<td>&nbsp;</td>
	    </tr>
	     <tr>			
			<th>办理日期</th>
			<td><input name="zxblrq" size="12" style="height:19px;" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tombDecoration.zxblrq}" />"  readonly/></td>
			<th>结账员</th>
			<td>
				<input name="jzyName" id="jzyId" value="${tombDecoration.jzy}"  size="8" style="height:19px;" readonly/>
			</td>
			<th>&nbsp;</th>
			<td><button class="inscriptionEditor" onclick="inscriptionEditor()" type="button">碑文编辑</button></td>
	    </tr>
	     <tr>			
			<th>刻字数</th>
			<td><input name="kzx" id="kzxId" value="${tombDecoration.kzx}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>刻字单价</th>
			<td><input name="kzxdj" id="kzxdjId" value="${tombDecoration.kzxdj}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th>刻字费</th>
			<td><input name="kzf" id="kzfId" value="${tombDecoration.kzf}" readonly style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
	    </tr>
	     <tr>			
			<th>刻框数</th>
			<td><input name="kks" id="kksId"  value="${tombDecoration.kks}" style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>刻框单价</th>
			<td><input name="kkdj"  id="kkdjId"  value="${tombDecoration.kkdj}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th>刻框费</th>
			<td><input name="kkf" id="kkfId"  value="${tombDecoration.kkf}" readonly style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
	    </tr>
	    <tr>
	    <th>瓷像类型</th>
			<td>
			  <input name="cxmc" style="height:19px;width:104px" id="cxId" value="${tombDecoration.cxmc}" readonly/>
			</td>
			<th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td>
		</tr>
		 <tr>	
			<th>瓷像单价</th>
			<td><input name="cxdj" id="cxdjId" value="${tombDecoration.cxdj}" readonly style="height:19px;width:104px" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th>瓷像数</th>
			<td><input name="cxgs" id="cxgsId"  value="${tombDecoration.cxgs}" style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>瓷像费</th>
			<td><input name="cxf" readonly id="cxfId" value="${tombDecoration.cxf}" style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
        </tr>
	     <tr>			
			
			<th>装修项目1</th>
			<td><input name="xiangmu1"  id="xiangmu1" value="${tombDecoration.xiangmu1}" size="40" style="height:19px;" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>装修金额1</th>
			<td><input name="jine1" id="jine1Id" value="${tombDecoration.jine1}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	    <tr>			
			
			<th>装修项目2</th>
			<td><input name="xiangmu2"  id="xiangmu2" value="${tombDecoration.xiangmu2}" size="40" style="height:19px;" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>装修金额2</th>
			<td><input name="jine2" id="jine2Id" value="${tombDecoration.jine2}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	    <tr>			
			
			<th>装修项目3</th>
			<td><input name="xiangmu3" id="xiangmu3" value="${tombDecoration.xiangmu3}" size="40" style="height:19px;" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>装修金额3</th>
			<td><input name="jine3" id="jine3Id" value="${tombDecoration.jine3}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	    <tr>			
			
			<th>装修项目4</th>
			<td><input name="xiangmu4"  id="xiangmu4" value="${tombDecoration.xiangmu4}" size="40" style="height:19px;" readonly/></td>
			<th>装修金额4</th>
			<td><input name="jine4" id="jine4Id" value="${tombDecoration.jine4}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	     <tr>			
			
			<th>装修项目5</th>
			<td><input name="xiangmu5"  id="xiangmu5" value="${tombDecoration.xiangmu5}" size="40" style="height:19px;" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>装修金额5</th>
			<td><input name="jine5"  id="jine5Id" value="${tombDecoration.jine5}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	     <tr>			
			
			<th>装修项目6</th>
			<td><input name="xiangmu6"  id="xiangmu6" value="${tombDecoration.xiangmu6}" size="40" style="height:19px;" onkeydown="if(event.keyCode==13){return false;}" readonly/></td>
			<th>装修金额6</th>
			<td><input name="jine6" id="jine6Id" value="${tombDecoration.jine6}"  style="height:19px;width:104px" type="number" onkeydown="if(event.keyCode==13){return false;}" readonly/><span>元</span></td>
			<th></th><td></td>
	    </tr>
	     <tr>			
			<th>&nbsp;</th>
			<td>&nbsp;</td>
			<th>&nbsp;</th>
			<td>&nbsp;</td>
			<th>交费合计</th>
			<td>
			   <input name="mxjfhj" id="mxjfhjId" value="${tombDecoration.mxjfhj}" size="12" style="height:19px;" readonly/><span>元</span>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
	    </tr>
        </table>
  </body>
</html>
