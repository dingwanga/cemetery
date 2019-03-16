package cn.tiantong.entity;

public class Address {
     private Integer id;
     private String ssmc;
     private String qxmc;
     
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSsmc() {
		return ssmc;
	}
	public void setSsmc(String ssmc) {
		this.ssmc = ssmc;
	}
	public String getQxmc() {
		return qxmc;
	}
	public void setQxmc(String qxmc) {
		this.qxmc = qxmc;
	}
	public Address(Integer id, String ssmc, String qxmc) {
		super();
		this.id = id;
		this.ssmc = ssmc;
		this.qxmc = qxmc;
	}
	
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
     
     
}
