package cn.tiantong.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class Muxue implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer mxid;
	private String mxmc;
	private Integer dmpb;
	private Integer cid;
	private Double hh;
	private Double lh;
	private String sgdbhId;
	private String syrxm1;
	private String syrxm2;
	private String syrxm3;
	private String syrxm4;
	private String sy1qk;
	private String sy2qk;
	private String sy3qk;
	private String sy4qk;
	private String lxrxm;
	
	private String sflz1;
	private String sflz2;
	private String sflz3;
	private String sflz4;
	private String sqrxm;
	private Date dmrq;
	private String lxdh;
	private String mqmcId;
	private Integer jzyId;
	private String lxdz;
	private String bz;
	private BigDecimal qmje;
	private Date dmskrq;
	private Integer ryqk;
	private Integer mxlb;
	
	
	
	
	public String getLxrxm() {
		return lxrxm;
	}
	public void setLxrxm(String lxrxm) {
		this.lxrxm = lxrxm;
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
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getMxid() {
		return mxid;
	}
	public void setMxid(Integer mxid) {
		this.mxid = mxid;
	}
	public String getMxmc() {
		return mxmc;
	}
	public void setMxmc(String mxmc) {
		this.mxmc = mxmc;
	}
	public Integer getDmpb() {
		return dmpb;
	}
	public void setDmpb(Integer dmpb) {
		this.dmpb = dmpb;
	}
	public Double getHh() {
		return hh;
	}
	public void setHh(Double hh) {
		this.hh = hh;
	}
	public Double getLh() {
		return lh;
	}
	public void setLh(Double lh) {
		this.lh = lh;
	}
	public String getSgdbhId() {
		return sgdbhId;
	}
	public void setSgdbhId(String sgdbhId) {
		this.sgdbhId = sgdbhId;
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
	public String getSflz1() {
		return sflz1;
	}
	public void setSflz1(String sflz1) {
		this.sflz1 = sflz1;
	}
	public String getSflz2() {
		return sflz2;
	}
	public void setSflz2(String sflz2) {
		this.sflz2 = sflz2;
	}
	public String getSflz3() {
		return sflz3;
	}
	public void setSflz3(String sflz3) {
		this.sflz3 = sflz3;
	}
	public String getSflz4() {
		return sflz4;
	}
	public void setSflz4(String sflz4) {
		this.sflz4 = sflz4;
	}
	public String getSqrxm() {
		return sqrxm;
	}
	public void setSqrxm(String sqrxm) {
		this.sqrxm = sqrxm;
	}
	public Date getDmrq() {
		return dmrq;
	}
	public void setDmrq(Date dmrq) {
		this.dmrq = dmrq;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getMqmcId() {
		return mqmcId;
	}
	public void setMqmcId(String mqmcId) {
		this.mqmcId = mqmcId;
	}
	public Integer getJzyId() {
		return jzyId;
	}
	public void setJzyId(Integer jzyId) {
		this.jzyId = jzyId;
	}
	public String getLxdz() {
		return lxdz;
	}
	public void setLxdz(String lxdz) {
		this.lxdz = lxdz;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public BigDecimal getQmje() {
		return qmje;
	}
	public void setQmje(BigDecimal qmje) {
		this.qmje = qmje;
	}
	public Date getDmskrq() {
		return dmskrq;
	}
	public void setDmskrq(Date dmskrq) {
		this.dmskrq = dmskrq;
	}
	public Integer getRyqk() {
		return ryqk;
	}
	public void setRyqk(Integer ryqk) {
		this.ryqk = ryqk;
	}
	public Integer getMxlb() {
		return mxlb;
	}
	public void setMxlb(Integer mxlb) {
		this.mxlb = mxlb;
	}
	@Override
	public String toString() {
		return "Muxue [mxid=" + mxid + ", mxmc=" + mxmc + ", dmpb=" + dmpb
				+ ", cid=" + cid + ", hh=" + hh + ", lh=" + lh + ", sgdbhId="
				+ sgdbhId + ", syrxm1=" + syrxm1 + ", syrxm2=" + syrxm2
				+ ", syrxm3=" + syrxm3 + ", syrxm4=" + syrxm4 + ", sy1qk="
				+ sy1qk + ", sy2qk=" + sy2qk + ", sy3qk=" + sy3qk + ", sy4qk="
				+ sy4qk + ", lxrxm=" + lxrxm + ", sflz1=" + sflz1 + ", sflz2="
				+ sflz2 + ", sflz3=" + sflz3 + ", sflz4=" + sflz4 + ", sqrxm="
				+ sqrxm + ", dmrq=" + dmrq + ", lxdh=" + lxdh + ", mqmcId="
				+ mqmcId + ", jzyId=" + jzyId + ", lxdz=" + lxdz + ", bz=" + bz
				+ ", qmje=" + qmje + ", dmskrq=" + dmskrq + ", ryqk=" + ryqk
				+ ", mxlb=" + mxlb + "]";
	}
	
	
	
	
	
	
	
	
	
	
	

}
