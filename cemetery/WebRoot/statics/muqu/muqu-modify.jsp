<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'muqu-modify.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	   <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<style>
	 
	     a{text-decoration:none;}
	     a:hover{
	      color:#2894ff;
	     }
	  
	  </style> 
       <script type="text/javascript">
     
       $(document).ready(function(){
         $("#num2").blur(function(){
             var num1 = $("#num1").val();
             var num2 = $("#num2").val(); 
             if(num1 !="" && num2 !=""){
              
                  if(isNaN(num1)){
                    alert("你输入的数字不合法!");
                    $("#num1").val();
                    $("#num1").focus();
                    return;
                  }
                  
                  if(isNaN(num2)){
                    alert("你输入的数字不合法!");
                    $("#num2").val();
                    $("#num2").focus();
                    return;
                  }
                $("#total").val(num1*num2);
              }
           });
       });
     </script>

  </head>
  
  <body>
  
     <div class="page_title">墓区管理&gt;墓区修改 </div>
    <form  method="post" action="${pageContext.request.contextPath }/statics/muqu/getMuquUpdate.html">  
    <div class="button_bar">
		<button class="common_button"  type="submit" onClick="save('${pageContext.request.contextPath }/statics/muqu/muqu-list.html')">保存</button>
		<button class="common_button" onclick="to('${pageContext.request.contextPath }/statics/muqu/orderList.html?id=${mq.id}')">历史记录</button>
		<button class="common_button" type="button" onclick="back();">返回</button>   
	</div>
	

        <table class="query_form_table">
			<tr>
				<th>墓区名称</th>
				<td><input type="text"  name="mqmc" value="${MQ.mqmc }" size="20"/>
				    <input type="hidden"  name="id" value="${MQ.id }" size="20"/>
				</td>
				<th>行数列数</th>
				<td><input type="text" name="hs" value="${MQ.hs }" size="10" id="num1"/> - <input name="ls" size="10" value="${MQ.ls }" id="num2"/></td>
				<th>墓穴个数</th>
		        <td><input type="text" name="mxgs" value="${MQ.hs*MQ.ls }" size="15" id="total" readonly/></td>
				
		   </tr>
	<%-- <tr>
		<th>墓穴类别（穴）</th>
		 <td><select name="mxlb" style="width:156px" id="display">
						<option value="${mxlb}"></option>
						<c:forEach var="lb" items="${liBieList}">
						   <option value="${MQ.mxlb}">
						       <c:if test="${lb.mxlb==1}">单穴</c:if>
						       <c:if test="${lb.mxlb==2}">双穴</c:if>
						       <c:if test="${lb.mxlb==3}">三穴</c:if>
						       <c:if test="${lb.mxlb==4}">四穴</c:if>
						       <c:if test="${lb.mxlb==null}"> </c:if>
						   </option>
						</c:forEach>
				       </select></td>
		<th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td>
	</tr> --%>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费</th>
		<td><input type="text" name="mdf" value="${MQ.mdf}"  size="20" /><span>（元）</span></td>
		<th>材料费</th>
		<td><input type="text" name="clf" value="${MQ.clf}"  size="20" /><span>（元）</span></td>
		<th>落葬费</th>
		<td><input type="text" name="lzf" value="${MQ.lzf}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费</th>
		<td><input type="text" name="lhf" value="${MQ.lhf}"  size="20" /><span>（元）</span></td>
		<th>维护费/年</th>
		<td><input type="text" name="glf" value="${MQ.glf}"  size="20" /><span>（元）</span></td>
		<th>墓穴价格</th>
		<td><input type="text" name="mxjg" value="${MQ.mxjg}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>
	
		<th>墓穴面积（㎡）</th>
		<td><input type="text" name="mxmj" size="20" value="${MQ.mxmj }"/></td>
		<th>道路面积（㎡）</th>
		<td><input type="text" name="dlmj" value="${MQ.dlmj }" size="20"/></td>	
		<th></th>
		<td></td>		
	</tr>
	
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（单）</th>
		<td><input type="text" name="mdf1" value="${MQ.mdf1}"  size="20" /><span>（元）</span></td>
		<th>材料费（单）</th>
		<td><input type="text" name="clf1" value="${MQ.clf1}"  size="20" /><span>（元）</span></td>
		<th>落葬费（单）</th>
		<td><input type="text" name="lzf1" value="${MQ.lzf1}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（单）</th>
		<td><input type="text" name="lhf1" value="${MQ.lhf1}" size="20" /><span>（元）</span></td>
		<th>维护费/年（单）</th>
		<td><input type="text" name="glf1" value="${MQ.glf1}" size="20" /><span>（元）</span></td>
		<th>墓穴价格（单）</th>
		<td><input type="text" name="mxjg1" value="${MQ.mxjg1}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（单）</th>
		<td><input type="text"  name="mxmj1"  value="${MQ.mxmj1}" size="20"/><span>（元）</span></td>
		<th>道路面积（单）</th>
		<td><input type="text" name="dlmj1"  value="${MQ.dlmj1}" size="20"/><span>（元）</span></td>
		<th></th>
		<td></td>
	</tr>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（双）</th>
		<td><input type="text" name="mdf2" value="${MQ.mdf2}" size="20" /><span>（元）</span></td>
		<th>材料费（双）</th>
		<td><input type="text" name="clf2" value="${MQ.clf2}"  size="20" /><span>（元）</span></td>
		<th>落葬费（双）</th>
		<td><input type="text" name="lzf2" value="${MQ.lzf2}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（双）</th>
		<td><input type="text" name="lhf2" value="${MQ.lhf2}"  size="20" /><span>（元）</span></td>
		<th>维护费/年（双）</th>
		<td><input type="text" name="glf2" value="${MQ.glf2}"  size="20" /><span>（元）</span></td>
		<th>墓穴价格（双）</th>
		<td><input type="text" name="mxjg2" value="${MQ.mxjg2}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（双）</th>
		<td><input type="text"  name="mxmj2"  value="${MQ.mxmj2}" size="20"/><span>（元）</span></td>
		<th>道路面积（双）</th>
		<td><input type="text" name="dlmj2"  value="${MQ.dlmj2}" size="20"/><span>（元）</span></td>
		<th></th>
		<td></td>
	</tr>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（三）</th>
		<td><input type="text" name="mdf3" value="${MQ.mdf3}"  size="20" /><span>（元）</span></td>
		<th>材料费（三）</th>
		<td><input type="text" name="clf3" value="${MQ.clf3}"  size="20" /><span>（元）</span></td>
		<th>落葬费（三）</th>
		<td><input type="text" name="lzf3" value="${MQ.lzf3}" size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（三）</th>
		<td><input type="text" name="lhf3" value="${MQ.lhf3}" size="20" /><span>（元）</span></td>
		<th>维护费/年（三）</th>
		<td><input type="text" name="glf3" value="${MQ.glf3}" size="20" /><span>（元）</span></td>
		<th>墓穴价格（三）</th>
		<td><input type="text" name="mxjg3" value="${MQ.mxjg3}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（三）</th>
		<td><input type="text"  name="mxmj3"  value="${MQ.mxmj3}" size="20"/><span>（元）</span></td>
		<th>道路面积（三）</th>
		<td><input type="text" name="dlmj3"  value="${MQ.dlmj3}" size="20"/><span>（元）</span></td>
		<th></th>
		<td></td>
	</tr>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（四）</th>
		<td><input type="text" name="mdf4" value="${MQ.mdf4}"  size="20" /><span>（元）</span></td>
		<th>材料费（四）</th>
		<td><input type="text" name="clf4" value="${MQ.clf4}"  size="20" /><span>（元）</span></td>
		<th>落葬费（四）</th>
		<td><input type="text" name="lzf4" value="${MQ.lzf4}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（四）</th>
		<td><input type="text" name="lhf4" value="${MQ.lhf4}" size="20" /><span>（元）</span></td>
		<th>维护费/年（四）</th>
		<td><input type="text" name="glf4" value="${MQ.glf4}" size="20" /><span>（元）</span></td>
		<th>墓穴价格（四）</th>
		<td><input type="text" name="mxjg4" value="${MQ.mxjg4}"  size="15" /><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（四）</th>
		<td><input type="text"  name="mxmj4"  value="${MQ.mxmj4}" size="20"/><span>（元）</span></td>
		<th>道路面积（四）</th>
		<td><input type="text" name="dlmj4"  value="${MQ.dlmj4}" size="20"/><span>（元）</span></td>
		<th></th>
		<td></td>
	</tr>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>
	
		
		<th>系统时间</th>
		 <%
	        Date d = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
			String now = df.format(d);
	    %>
		<td colspan="5"><%=now %></td>
		<th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td>	
	</tr>
        </table> 
        

	


        
</form>	
  </body>
</html>
