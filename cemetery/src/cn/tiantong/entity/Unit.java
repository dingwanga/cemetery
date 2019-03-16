package cn.tiantong.entity;

import java.io.Serializable;

public class Unit implements Serializable{
	private String units;   //单位名称
	private String dz;    //地址
	private String dh;   //电话
	private int id;
	
	
	
	public Unit(int id) {
		super();
		this.id = id;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getUnits() {
		return units;
	}



	public void setUnits(String units) {
		this.units = units;
	}



	public String getDz() {
		return dz;
	}



	public void setDz(String dz) {
		this.dz = dz;
	}



	public String getDh() {
		return dh;
	}



	public void setDh(String dh) {
		this.dh = dh;
	}

     

	public Unit(String units, String dz, String dh) {
		super();
		this.units = units;
		this.dz = dz;
		this.dh = dh;
	}



	public Unit() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
