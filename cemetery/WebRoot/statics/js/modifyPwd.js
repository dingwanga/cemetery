/**
 * Created by LIFEI477 on 2018/7/2.
 */

$(document).ready(function(){
     $("#newPass").blur(function(){
         if($("#newPass").val()==$("#oldPassWord").val()){
        	 $("#msg").html("新密码和原密码不能一致！");
         }else{
        	 $("#msg").html("");
         }
     }); 
     $("#surePass").blur(function(){
    	 if($("#surePass").val()!=$("#newPass").val()){
        	 $("#msg").html("新密码和确认密码不一致！");
    	 }else{
    		 $("#msg").html("");
    	 }
     });
 });
