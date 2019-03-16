<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'muqu-add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css"  href="statics/css/style.css">
	  <script src="statics/js/common.js"></script>
	  <script src="statics/js/jquery-2.1.4.min.js"></script>
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
       function save(){
     		var mqmc = document.getElementById("mqmc");
     		var num1 = document.getElementById("num1");
     		var num2 = document.getElementById("num2");
     		if(isNull(mqmc.value)){
     			alert("墓区名称不能为空！");
     			mqmc.focus();
     			return false;
     		}else if(isNull(num1.value)){
     			alert("行数不能为空！");
     			num1.focus();
     			return false;
     		}else if(isNull(num2.value)){
     			alert("列数不能为空！");
     			num2.focus();
     			return false;
     		}else{
     			alert('保存成功！');
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
		
		
		/* //Ajax验证
		var muQuCode = null;
		function(){
		muQuCode = $("#muqu");
		muQuCode.next().html("*");
		}
		muQuCode.bind("blur",function(){
		//validateTip(userCode.next(),{"color":"green"},imgYes+" 该账号可以使用",true);
		//var userCode =$("#userCode").val();
		
		var url = path+"/statics/muqu/checkMuqu";
		//ajax后台验证--userCode是否已存在
		$.ajax({
			type:"POST",//请求类型
			url:url,//请求的url
			data:{"muQuCode":muQuCode.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				if(data.muQuCode == "exist"){//账号已存在，错误提示
					validateTip(muQuCode.next(),{"color":"red"},imgNo+ " 该墓区名称已存在",false);
				}else{//账号可用，正确提示
					validateTip(muQuCode.next(),{"color":"green"},imgYes+" 该墓区名称可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(muQuCode.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
     	 */
     </script>
      
  </head>
  
  <body>
  <form  id="muqu" method="post" action="${pageContext.request.contextPath }/statics/muqu/muqu-add.html" onsubmit="return save()"> 
     <div class="page_title">墓区管理&gt;墓区新建 </div>
    <div class="button_bar">
	
	<button class="common_button"  type="submit">保存</button>
	
	</div>
        <table class="query_form_table">
 
			<tr>
				<th>墓区名称</th>
				<td><input type="text" id="mqmc" name="mqmc" size="12" style="height:20px" /><span class="red_star" id="red_star">*</span></td>
				<th>行数列数</th>
				<td><input type="text"  name="hsls" size="10" id="num1"/> - <input name="ls" type="text" size="10" id="num2" /><span class="red_star" id="red_star">*</span></td>
				<th>墓穴个数</th>
		        <td><input type="text"  name="mxgs"  size="12" style="height:20px" id="total" disabled/></td>
		   </tr>
		  <%--  <tr>
					<th>墓穴类别（穴）</th>
			        <td><select name="mxlb" style="width:156px" id="display">
						<option value="${mxlb}">单穴</option>
						<c:forEach var="lb" items="${liBieList}">
						   <option value="${lb.mxlb}">
						       <c:if test="${lb.mxlb==1}">单穴</c:if>
						       <c:if test="${lb.mxlb==2}">双穴</c:if>
						       <c:if test="${lb.mxlb==3}">三穴</c:if>
						       <c:if test="${lb.mxlb==4}">四穴</c:if>
						       <c:if test="${lb.mxlb==null}"> </c:if>
						   </option>
						</c:forEach>
				       </select><span class="red_star">*</span></td>
				   <th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td>
		   </tr> --%>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（单）</th>
		<td><input type="number"  name="mdf1"  size="12" style="height:20px" /><span>（元）</span></td>
		<th>材料费（单）</th>
		<td><input type="number"  name="clf1"  size="12" style="height:20px" /><span>（元）</span></td>
		<th>落葬费（单）</th>
		<td><input type="number"  name="lzf1"  size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（单）</th>
		<td><input type="number"  name="lhf1"   size="12" style="height:20px"/><span>（元）</span></td>
		<th>维护费/年（单）</th>
		<td><input type="number" name="glf1"   size="12" style="height:20px"/><span>（元）</span></td>
		<th>墓穴价格（单）</th>
		<td><input type="number"  name="mxjg1"  size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（单）</th>
		<td><input type="number"  name="mxmj1"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th>道路面积（单）</th>
		<td><input type="number" name="dlmj1"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th></th>
		<td></td>
	</tr>
	
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（双）</th>
		<td><input type="number" name="mdf2"   size="12" style="height:20px"/><span>（元）</span></td>
		<th>材料费（双）</th>
		<td><input type="number" name="clf2"   size="12" style="height:20px"/><span>（元）</span></td>
		<th>落葬费（双）</th>
		<td><input type="number" name="lzf2"  size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（双）</th>
		<td><input type="number" name="lhf2"  size="12" style="height:20px" /><span>（元）</span></td>
		<th>维护费/年（双）</th>
		<td><input type="number" name="glf2"  size="12" style="height:20px" /><span>（元）</span></td>
		<th>墓穴价格（双）</th>
		<td><input type="number" name="mxjg2"  size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（双）</th>
		<td><input type="number"  name="mxmj2"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th>道路面积（双）</th>
		<td><input type="number" name="dlmj2"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th></th>
		<td></td>
	</tr>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（三）</th>
		<td><input type="number" name="mdf3"  size="12" style="height:20px"/><span>（元）</span></td>
		<th>材料费（三）</th>
		<td><input type="number" name="clf3"   size="12" style="height:20px"/><span>（元）</span></td>
		<th>落葬费（三）</th>
		<td><input type="number" name="lzf3"  size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（三）</th>
		<td><input type="number" name="lhf3"  size="12" style="height:20px" /><span>（元）</span></td>
		<th>维护费/年（三）</th>
		<td><input type="number" name="glf3"  size="12" style="height:20px"/><span>（元）</span></td>
		<th>墓穴价格（三）</th>
		<td><input type="number" name="mxjg3"  size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（三）</th>
		<td><input type="number"  name="mxmj3"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th>道路面积（三）</th>
		<td><input type="number" name="dlmj3"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th></th>
		<td></td>
	</tr>
	<tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>			
		<th>墓地费（四）</th>
		<td><input type="number" name="mdf4"  size="12" style="height:20px"/><span>（元）</span></td>
		<th>材料费（四）</th>
		<td><input type="number" name="clf4"   size="12" style="height:20px"/><span>（元）</span></td>
		<th>落葬费（四）</th>
		<td><input type="number" name="lzf4"  size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>绿化费（四）</th>
		<td><input type="number" name="lhf4"  size="12" style="height:20px"/><span>（元）</span></td>
		<th>维护费/年（四）</th>
		<td><input type="number" name="glf4"   size="12" style="height:20px"/><span>（元）</span></td>
		<th>墓穴价格（四）</th>
		<td><input type="number" name="mxjg4"   size="15"/><span>（元）</span></td>
	</tr>
	<tr>			
		<th>墓穴面积（四）</th>
		<td><input type="number"  name="mxmj4"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th>道路面积（四）</th>
		<td><input type="number" name="dlmj4"   size="12" style="height:20px"/><span>（㎡）</span></td>
		<th></th>
		<td></td>
	</tr>
	<!-- <tr><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td><th>&nbsp;</th><td>&nbsp;</td></tr>
	<tr>
	
		<th>墓穴面积（㎡）</th>
		<td><input type="number" id="mxmj" name="mxmj" size="12" style="height:20px" required oninvalid="setCustomValidity('墓穴面积不能为空')" oninput="setCustomValidity('')" /><span class="red_star" id="red_star">*</span></td>
		<th>道路面积（㎡）</th>
		<td><input type="number" id="dlmj" name="dlmj"  size="12" style="height:20px" required oninvalid="setCustomValidity('道路面积不能为空')" oninput="setCustomValidity('')" /><span class="red_star" id="red_star">*</span></td>
		<th>&nbsp;</th><td>&nbsp;</td>	
				
	</tr> -->
	<!-- <tr>
	    <th>系统时间</th>
		<td colspan="5"><input name=" " size="12" style="height:20px" value=" "/><span class="red_star">*</span></td>
	    </tr> -->
        </table> 
        
</form>	
 </body>
</html>
