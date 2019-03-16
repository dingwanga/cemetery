package cn.tiantong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import cn.tiantong.entity.Users;



public interface UsersDao {
       
	
		Users login(
			@Param("user")
			String user,
			@Param("pass")
			String pass
				);
		
		
		 
	      //根据id查询用户
		  Users findUsersById(@Param("id") Integer id);
		  
		  //修改用户
		 Integer modifyPasswordByUsername(Users users);
		 
		 
	    // 新增用户
		 Integer addUser(Users users);
		 
		 //获取所有权限
		 List<Users> findAllRight();
		 
		 //根据用户名查询用户是否存在
		 public Users findUsersByUsername(String username);
		 //显示所有用户
		 List<Users> findAll();
		 
		 
		 //删除用户
		 Integer delUser(@Param("id") Integer id);
		 
		 
		 //查询所有业务员
		 List<Users> findAllJzy();
		 
		 
		 //查询所有的结账员
		 List<Users> findAllUser();
		 
		 
		//根据jzy查询用户id
		 Users findIdByJzy(@Param("jzy") String jzy);
		 
}
