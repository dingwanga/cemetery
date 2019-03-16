package cn.tiantong.entity;

import java.io.Serializable;

public class Users implements Serializable{
     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 private Integer id;
     private String user;
     private String pass;
     private String right;
     private String jzy;
     
     
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRight() {
		return right;
	}
	public void setRight(String right) {
		this.right = right;
	}
	public String getJzy() {
		return jzy;
	}
	public void setJzy(String jzy) {
		this.jzy = jzy;
	}
	
	public Users(Integer id, String user, String pass, 
			String right, String jzy) {
		super();
		this.id = id;
		this.user = user;
		this.pass = pass;
		this.right = right;
		this.jzy = jzy;
	}
	public Users() {
		super();
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", user=" + user + ", pass=" + pass
				+ ", right=" + right + ", jzy=" + jzy + "]";
	}
	
     
     
}
