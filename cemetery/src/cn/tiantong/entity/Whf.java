package cn.tiantong.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Whf implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sgdbh;
	private Date dmrq;
	private String lxrxm;
	private String lxrdz;
	private String lxrdh;
	private String lxryb;
	private String ssmc;
	private String qxmc;
	private String jzy;
	
	private String mqmcId;
	private String mxmc;
	private Integer mxlb;
	private Date wfksrq;
	private Date wfjsrq;
	private Integer wfns;
	
	private BigDecimal glf;  //维护费
	private BigDecimal glf1;
	private BigDecimal glf2;
	private BigDecimal glf3;
	private BigDecimal glf4;
	private BigDecimal wfhj;
	private Date whskrq;
	private Integer xjcs;
	
	private String syrxm1;
	private String syrxm2;
	private String syrxm3;
	private String syrxm4;
	private String sy1qk;
	private String sy2qk;
	private String sy3qk;
	private String sy4qk;
	private Integer whcs;
	
	public Integer getXjcs() {
		return xjcs;
	}
	public void setXjcs(Integer xjcs) {
		this.xjcs = xjcs;
	}
	public String getJzy() {
		return jzy;
	}
	public void setJzy(String jzy) {
		this.jzy = jzy;
	}
	public String getSyrxm1() {
		return syrxm1;
	}
	public void setSyrxm1(String syrxm1) {
		this.syrxm1 = syrxm1;
	}
	public String getSyrxm2() {
		return syrxm2;
	}
	public void setSyrxm2(String syrxm2) {
		this.syrxm2 = syrxm2;
	}
	public String getSyrxm3() {
		return syrxm3;
	}
	public void setSyrxm3(String syrxm3) {
		this.syrxm3 = syrxm3;
	}
	public String getSyrxm4() {
		return syrxm4;
	}
	public void setSyrxm4(String syrxm4) {
		this.syrxm4 = syrxm4;
	}
	public String getSy1qk() {
		return sy1qk;
	}
	public void setSy1qk(String sy1qk) {
		this.sy1qk = sy1qk;
	}
	public String getSy2qk() {
		return sy2qk;
	}
	public void setSy2qk(String sy2qk) {
		this.sy2qk = sy2qk;
	}
	public String getSy3qk() {
		return sy3qk;
	}
	public void setSy3qk(String sy3qk) {
		this.sy3qk = sy3qk;
	}
	public String getSy4qk() {
		return sy4qk;
	}
	public void setSy4qk(String sy4qk) {
		this.sy4qk = sy4qk;
	}
	public String getSgdbh() {
		return sgdbh;
	}
	public void setSgdbh(String sgdbh) {
		this.sgdbh = sgdbh;
	}
	public Date getDmrq() {
		return dmrq;
	}
	public void setDmrq(Date dmrq) {
		this.dmrq = dmrq;
	}
	public String getLxrxm() {
		return lxrxm;
	}
	public void setLxrxm(String lxrxm) {
		this.lxrxm = lxrxm;
	}
	public String getLxrdz() {
		return lxrdz;
	}
	public void setLxrdz(String lxrdz) {
		this.lxrdz = lxrdz;
	}
	public String getLxrdh() {
		return lxrdh;
	}
	public void setLxrdh(String lxrdh) {
		this.lxrdh = lxrdh;
	}
	public String getLxryb() {
		return lxryb;
	}
	public void setLxryb(String lxryb) {
		this.lxryb = lxryb;
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
	public String getMqmcId() {
		return mqmcId;
	}
	public void setMqmcId(String mqmcId) {
		this.mqmcId = mqmcId;
	}
	public String getMxmc() {
		return mxmc;
	}
	public void setMxmc(String mxmc) {
		this.mxmc = mxmc;
	}
	public Integer getMxlb() {
		return mxlb;
	}
	public void setMxlb(Integer mxlb) {
		this.mxlb = mxlb;
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
	public BigDecimal getGlf1() {
		return glf1;
	}
	public void setGlf1(BigDecimal glf1) {
		this.glf1 = glf1;
	}
	public BigDecimal getGlf2() {
		return glf2;
	}
	public void setGlf2(BigDecimal glf2) {
		this.glf2 = glf2;
	}
	public BigDecimal getGlf3() {
		return glf3;
	}
	public void setGlf3(BigDecimal glf3) {
		this.glf3 = glf3;
	}
	public BigDecimal getGlf4() {
		return glf4;
	}
	public void setGlf4(BigDecimal glf4) {
		this.glf4 = glf4;
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
	
	public Integer getWhcs() {
		return whcs;
	}
	public void setWhcs(Integer whcs) {
		this.whcs = whcs;
	}
	@Override
	public String toString() {
		return "Whf [sgdbh=" + sgdbh + ", dmrq=" + dmrq + ", lxrxm=" + lxrxm
				+ ", lxrdz=" + lxrdz + ", lxrdh=" + lxrdh + ", lxryb=" + lxryb
				+ ", ssmc=" + ssmc + ", qxmc=" + qxmc + ", jzy=" + jzy
				+ ", mqmcId=" + mqmcId + ", mxmc=" + mxmc + ", mxlb=" + mxlb
				+ ", wfksrq=" + wfksrq + ", wfjsrq=" + wfjsrq + ", wfns="
				+ wfns + ", glf=" + glf + ", glf1=" + glf1 + ", glf2=" + glf2
				+ ", glf3=" + glf3 + ", glf4=" + glf4 + ", wfhj=" + wfhj
				+ ", whskrq=" + whskrq + ", xjcs=" + xjcs + ", syrxm1="
				+ syrxm1 + ", syrxm2=" + syrxm2 + ", syrxm3=" + syrxm3
				+ ", syrxm4=" + syrxm4 + ", sy1qk=" + sy1qk + ", sy2qk="
				+ sy2qk + ", sy3qk=" + sy3qk + ", sy4qk=" + sy4qk + ", whcs="
				+ whcs + "]";
	}
	
}
