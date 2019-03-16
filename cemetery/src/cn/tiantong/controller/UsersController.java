package cn.tiantong.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.tiantong.entity.Users;
import cn.tiantong.service.UsersService;


@Controller("UsersController")
@RequestMapping("/login")
public class UsersController {
	 @Resource(name="usersService")
	 private UsersService usersService;
	
	//登录
	@RequestMapping("/doLoginInto.html")
	public String doLogin(
					@RequestParam(value="user",required=false)
					 String user,
					 @RequestParam(value="pass",required=false)
					 String pass,
					 HttpSession session,
					 Model model
					 ){
		
		        Users userLogin=usersService.login(user, pass);
		        
			     if(userLogin!=null){
						session.setAttribute("userLogin", userLogin);
						return "main";
					}else{
						model.addAttribute("msg",  "用户名或密码不正确！");
						return "../login";
					}
		
	}	
	
	
	//显示修改密码
	@RequestMapping("/modifyPass.html")
	public String modifyPass(){
		return "modifyPass";
	}
	
	//�޸�����
	    //修改密码
	@RequestMapping("/modify.html")
	public String updatePass(Users users,
			 @RequestParam("userName") 
	         String userName,
			 @RequestParam(value="pass",required=false)
			 String pass,
			 @RequestParam(value="newPass",required=false)
			 String newPass,
			 @RequestParam(value="surePass",required=false)
			 String surePass,
			 HttpSession session,
			 Model model
			){
		
		if (!usersService.isUserExist(userName)) {
			model.addAttribute("msg", "用户名不存在！");
			return "modifyPass";
		} else {
			if (pass.equals(usersService.getPasswordByUsername(userName))) {
				usersService.modifyPasswordByUsername(userName, newPass);
				model.addAttribute("msg", "恭喜您，修改密码成功了！");
				return "../login";
			} else {
				model.addAttribute("msg", "原密码错误！");
				return "modifyPass";
			}

		}
		
		
	}
	       //退出登录
			@RequestMapping("/loginout.html")
			public String devLogout(HttpSession session){
				session.invalidate();  //完全失效
				return "../login";
			}
			
	   
}
