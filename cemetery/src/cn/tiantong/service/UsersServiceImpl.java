package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.UsersDao;
import cn.tiantong.entity.Users;
import cn.tiantong.util.PageBean;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Resource(name = "usersDao")
	private UsersDao usersDao;

	// ��¼
	public Users login(String user, String pass) {

		return usersDao.login(user, pass);
	}

	// ���id��ѯ��Ϣ
	public Users findUsersById(Integer id) {

		return usersDao.findUsersById(id);
	}

	public Integer modifyPasswordByUsername(Users users) {

		return usersDao.modifyPasswordByUsername(users);
	}

	//新增用户
	public Integer addUser(Users users) {

		return usersDao.addUser(users);
	}

	// 根据用户名查询用户是否存在
	public boolean isUserExist(String username) {
		if (usersDao.findUsersByUsername(username) == null) {
			return false;
		} else {
			return true;
		}

	}
	//根据提供的用户名拿密码
	public String getPasswordByUsername(String username) {

		return usersDao.findUsersByUsername(username).getPass();

	}
	//修改某一用户的密码
	public void modifyPasswordByUsername(String username, String newpassword) {

		Users user = usersDao.findUsersByUsername(username);

		user.setUser(username);

		user.setPass(newpassword);

		usersDao.modifyPasswordByUsername(user);

	}

	
	 //显示所有用户
	public List<Users> findAll() {
		// TODO Auto-generated method stub
		return usersDao.findAll();
	}
     
	
	//删除用户
	public Integer delUser(Integer id) {
		// TODO Auto-generated method stub
		return usersDao.delUser(id);
	}
     
	//获取所有权限
	public List<Users> findAllRight() {
		// TODO Auto-generated method stub
		return usersDao.findAllRight();
	}

	public List<Users> findAllJzy() {
		// TODO Auto-generated method stub
		return usersDao.findAllJzy();
	}

	public List<Users> findAllUser() {
		// TODO Auto-generated method stub
		return usersDao.findAllUser();
	}

	public Users findIdByJzy(String jzy) {
		// TODO Auto-generated method stub
		return usersDao.findIdByJzy(jzy);
	}


}
