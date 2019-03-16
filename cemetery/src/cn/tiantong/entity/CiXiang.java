package cn.tiantong.entity;

public class CiXiang {
    private Integer id;
    private String cxmc;
    private float cxdj;
    
    
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCxmc() {
		return cxmc;
	}
	public void setCxmc(String cxmc) {
		this.cxmc = cxmc;
	}
	public float getCxdj() {
		return cxdj;
	}
	public void setCxdj(float cxdj) {
		this.cxdj = cxdj;
	}
	public CiXiang(Integer id, String cxmc, float cxdj) {
		super();
		this.id = id;
		this.cxmc = cxmc;
		this.cxdj = cxdj;
	}
	public CiXiang() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
}
