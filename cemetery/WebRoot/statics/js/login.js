/**
 * Created by LIFEI477 on 2018/7/2.
 */
$(document).ready(function(){
		  $("#submit").click(function(){
		  	 var userName = $("#userName").val();
		  	 var oldPassWord = $("#oldPassWord").val();
		  	 var newPass = $("#newPass").val();
		  	 var surePass = $("#surePass").val();
		     if(userName==""||userName==null){
		    	 $("#msg").html("用户名不能为空！");
		     }else if(oldPassWord==""||oldPassWord==null){
		    	 $("#msg").html("原密码不能为空！");
		     }else if(newPass==""||newPass==null){
		    	 $("#msg").html("新密码不能为空！");
		     }else if(surePass==""||surePass==null){
		    	 $("#msg").html("确认密码不能为空！");
		     }else if(newPass==oldPassWord){
		    	 $("#msg").html("新密码和原密码不能一致！");
		     }else if(surePass!=newPass){
		    	 $("#msg").html("新密码和确认密码不一致！");
		     }else{
		    	 $("#msg").html("");
		     }
		     
		  });
	});
