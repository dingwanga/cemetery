package cn.tiantong.service;






import java.util.List;

import org.apache.ibatis.annotations.Param;



import cn.tiantong.entity.Users;


public interface UsersService {
	        //登录
			Users login(String user,String pass);
			
			// 根据id查询用户
			  Users findUsersById(Integer id);
				//根據jzy查询user
			   // Users findUserByJZY(String jzy);
			  //修改密码
			  Integer modifyPasswordByUsername(Users users);
			 
			 
		     //新增用户
			 Integer addUser(Users users);
			 
			//获取所有权限
			 List<Users> findAllRight();

			//根据用户名查询用户是否存在
			 public boolean isUserExist(String username);
			 
			 
			 //根据提供的用户名拿密码
			 public String getPasswordByUsername(String username);
			 
			 
			//修改某一用户的密码
			 public void modifyPasswordByUsername(String username, String newpassword);
			 
			 
			 //显示所有用户
			 List<Users> findAll();
			 
			 //删除用户
			 Integer delUser(Integer id);
			 
			 
			 //查询所有业务员
			 List<Users> findAllJzy();
			 
			 
			 //查询所有的结账员
			 List<Users> findAllUser();
			 
			 //根据jzy查询用户id
			 Users findIdByJzy(String jzy);
}
