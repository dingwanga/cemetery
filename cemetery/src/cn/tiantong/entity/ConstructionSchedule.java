package cn.tiantong.entity;

import java.io.Serializable;
import java.util.Date;

public class ConstructionSchedule implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer sid;
	private String sgdbh;
	private String sfwg;
	private String sfszp;
	private Date szrq;
	private String sfghzp;
	private Date zpghrq;
	private String sftcx;
	private String sfzxwg;
	private String qtdj1;
	private String qtdj2;
	private String qtdj3;
	private String qtdj4;
	private String bz;
	
	private String lxrxm;
	private String lxrdz;
	private String lxrdh;
	private String mqmcId;
	private String mxmc;
	
	private String syrxm1;
	private String syrxm2;
	private String syrxm3;
	private String syrxm4;
	private String sy1qk;
	private String sy2qk;
	private String sy3qk;
	private String sy4qk;
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSgdbh() {
		return sgdbh;
	}
	public void setSgdbh(String sgdbh) {
		this.sgdbh = sgdbh;
	}
	public String getSfwg() {
		return sfwg;
	}
	public void setSfwg(String sfwg) {
		this.sfwg = sfwg;
	}
	public String getSfszp() {
		return sfszp;
	}
	public void setSfszp(String sfszp) {
		this.sfszp = sfszp;
	}
	public Date getSzrq() {
		return szrq;
	}
	public void setSzrq(Date szrq) {
		this.szrq = szrq;
	}
	public String getSfghzp() {
		return sfghzp;
	}
	public void setSfghzp(String sfghzp) {
		this.sfghzp = sfghzp;
	}
	public Date getZpghrq() {
		return zpghrq;
	}
	public void setZpghrq(Date zpghrq) {
		this.zpghrq = zpghrq;
	}
	public String getSftcx() {
		return sftcx;
	}
	public void setSftcx(String sftcx) {
		this.sftcx = sftcx;
	}
	public String getSfzxwg() {
		return sfzxwg;
	}
	public void setSfzxwg(String sfzxwg) {
		this.sfzxwg = sfzxwg;
	}
	public String getQtdj1() {
		return qtdj1;
	}
	public void setQtdj1(String qtdj1) {
		this.qtdj1 = qtdj1;
	}
	public String getQtdj2() {
		return qtdj2;
	}
	public void setQtdj2(String qtdj2) {
		this.qtdj2 = qtdj2;
	}
	public String getQtdj3() {
		return qtdj3;
	}
	public void setQtdj3(String qtdj3) {
		this.qtdj3 = qtdj3;
	}
	public String getQtdj4() {
		return qtdj4;
	}
	public void setQtdj4(String qtdj4) {
		this.qtdj4 = qtdj4;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
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
	
	@Override
	public String toString() {
		return "ConstructionSchedule [sid=" + sid + ", sgdbh=" + sgdbh
				+ ", sfwg=" + sfwg + ", sfszp=" + sfszp + ", szrq=" + szrq
				+ ", sfghzp=" + sfghzp + ", zpghrq=" + zpghrq + ", sftcx="
				+ sftcx + ", sfzxwg=" + sfzxwg + ", qtdj1=" + qtdj1
				+ ", qtdj2=" + qtdj2 + ", qtdj3=" + qtdj3 + ", qtdj4=" + qtdj4
				+ ", bz=" + bz + ", lxrxm=" + lxrxm + ", lxrdz=" + lxrdz
				+ ", lxrdh=" + lxrdh + ", mqmcId=" + mqmcId + ", mxmc=" + mxmc
				+ ", syrxm1=" + syrxm1 + ", syrxm2=" + syrxm2 + ", syrxm3="
				+ syrxm3 + ", syrxm4=" + syrxm4 + ", sy1qk=" + sy1qk
				+ ", sy2qk=" + sy2qk + ", sy3qk=" + sy3qk + ", sy4qk=" + sy4qk
				+ "]";
	}
	
	
	
	 
}
