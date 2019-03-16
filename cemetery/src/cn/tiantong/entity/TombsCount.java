package cn.tiantong.entity;

import java.io.Serializable;

public class TombsCount implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer tombSysSum;
	
	private Integer dingmuSum;
	
	private Integer emptyTombSum;
	
	private Integer tombSum;

	public Integer getTombSysSum() {
		return tombSysSum;
	}

	public void setTombSysSum(Integer tombSysSum) {
		this.tombSysSum = tombSysSum;
	}

	public Integer getDingmuSum() {
		return dingmuSum;
	}

	public void setDingmuSum(Integer dingmuSum) {
		this.dingmuSum = dingmuSum;
	}

	public Integer getEmptyTombSum() {
		return emptyTombSum;
	}

	public void setEmptyTombSum(Integer emptyTombSum) {
		this.emptyTombSum = emptyTombSum;
	}

	public Integer getTombSum() {
		return tombSum;
	}

	public void setTombSum(Integer tombSum) {
		this.tombSum = tombSum;
	}
	
	

	@Override
	public String toString() {
		return "TombsCount [tombSysSum=" + tombSysSum + ", dingmuSum="
				+ dingmuSum + ", emptyTombSum=" + emptyTombSum + ", tombSum="
				+ tombSum + "]";
	}
	
	

}
