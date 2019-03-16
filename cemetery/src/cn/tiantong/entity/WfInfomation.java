package cn.tiantong.entity;

import java.math.BigDecimal;
import java.util.Date;

public class WfInfomation {
	private Integer wfID;
	private Integer wfinfonum;
	private String sgdbh;
	private Date wfksrq;
	private Date wfjsrq;
	private Integer wfns;
	private BigDecimal glf;
	private BigDecimal wfhj;
	private Date whskrq;
	public Integer getWfID() {
		return wfID;
	}
	public void setWfID(Integer wfID) {
		this.wfID = wfID;
	}
	public String getSgdbh() {
		return sgdbh;
	}
	
	public Integer getWfinfonum() {
		return wfinfonum;
	}
	public void setWfinfonum(Integer wfinfonum) {
		this.wfinfonum = wfinfonum;
	}
	public void setSgdbh(String sgdbh) {
		this.sgdbh = sgdbh;
	}
	public Date getWfksrq() {
		return wfksrq;
	}
	public void setWfksrq(Date wfksrq) {
		this.wfksrq = wfksrq;
	}
	public Date getWfjsrq() {
		return wfjsrq;
	}
	public void setWfjsrq(Date wfjsrq) {
		this.wfjsrq = wfjsrq;
	}
	public Integer getWfns() {
		return wfns;
	}
	public void setWfns(Integer wfns) {
		this.wfns = wfns;
	}
	public BigDecimal getGlf() {
		return glf;
	}
	public void setGlf(BigDecimal glf) {
		this.glf = glf;
	}
	public BigDecimal getWfhj() {
		return wfhj;
	}
	public void setWfhj(BigDecimal wfhj) {
		this.wfhj = wfhj;
	}
	public Date getWhskrq() {
		return whskrq;
	}
	public void setWhskrq(Date whskrq) {
		this.whskrq = whskrq;
	}
	@Override
	public String toString() {
		return "WfInfomation [wfID=" + wfID + ", wfinfonum=" + wfinfonum
				+ ", sgdbh=" + sgdbh + ", wfksrq=" + wfksrq + ", wfjsrq="
				+ wfjsrq + ", wfns=" + wfns + ", glf=" + glf + ", wfhj=" + wfhj
				+ ", whskrq=" + whskrq + "]";
	}
	
	/**
	 * 昨天分析：
	 * 1，在施工单保存时往wfInfomation表中插入数据，wfid為0；
	 * 2，维护费续交中点击查询，根据维护费信息，查询出相应信息显示在列表
	 * 3，维护费续交中点击保存的sql:UPDATE sgd SET wfksrq='',WFNS='',WFJSRQ='',WFHJ='',WHSKRQ='',userId=''
      WHERE sgdbh='20181007002';
	 */
}
