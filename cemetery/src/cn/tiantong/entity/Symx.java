package cn.tiantong.entity;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Symx implements Serializable{
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mqmc;
	private Integer syqkSum;
	private String sy1qk;
	private String sy2qk;
	private String sy3qk;
	private String sy4qk;
	private Integer syqkTotalsh;
	private Integer syqkTotalg;
	private Integer mxlb;
	private BigDecimal ssje;
	public String getMqmc() {
		return mqmc;
	}
	public void setMqmc(String mqmc) {
		this.mqmc = mqmc;
	}
	
	public Integer getSyqkSum() {
		return syqkSum;
	}
	public void setSyqkSum(Integer syqkSum) {
		this.syqkSum = syqkSum;
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
	
	public Integer getSyqkTotalsh() {
		return syqkTotalsh;
	}
	public void setSyqkTotalsh(Integer syqkTotalsh) {
		this.syqkTotalsh = syqkTotalsh;
	}
	public Integer getSyqkTotalg() {
		return syqkTotalg;
	}
	public void setSyqkTotalg(Integer syqkTotalg) {
		this.syqkTotalg = syqkTotalg;
	}
	public Integer getMxlb() {
		return mxlb;
	}
	public void setMxlb(Integer mxlb) {
		this.mxlb = mxlb;
	}
	public BigDecimal getSsje() {
		return ssje;
	}
	public void setSsje(BigDecimal ssje) {
		this.ssje = ssje;
	}
	@Override
	public String toString() {
		return "Symx [mqmc=" + mqmc + ", syqkSum=" + syqkSum + ", sy1qk="
				+ sy1qk + ", sy2qk=" + sy2qk + ", sy3qk=" + sy3qk + ", sy4qk="
				+ sy4qk + ", syqkTotalsh=" + syqkTotalsh + ", syqkTotalg="
				+ syqkTotalg + ", mxlb=" + mxlb + ", ssje=" + ssje + "]";
	}
	
	
}
