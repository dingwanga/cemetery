package cn.tiantong.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BasicData implements Serializable{
     /**
	 * 
	 */
	 private static final long serialVersionUID = 1L;
	
     private String discountAmount;
    /* @DateTimeFormat(pattern="yyyy-MM-dd")*/
     private String dateOfApproval;
     private Integer taxPreferenceItems;
     private String batchNumber;
     private String approval;
     private String mqmcId;
     private String mxmc;
     
     

	public String getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(String discountAmount) {
		this.discountAmount = discountAmount;
	}
	public String getDateOfApproval() {
		return dateOfApproval;
	}
	public void setDateOfApproval(String dateOfApproval) {
		this.dateOfApproval = dateOfApproval;
	}
	public Integer getTaxPreferenceItems() {
		return taxPreferenceItems;
	}
	public void setTaxPreferenceItems(Integer taxPreferenceItems) {
		this.taxPreferenceItems = taxPreferenceItems;
	}
	public String getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
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
	
	
	@Override
	public String toString() {
		return "BasicData [discountAmount=" + discountAmount
				+ ", dateOfApproval=" + dateOfApproval
				+ ", taxPreferenceItems=" + taxPreferenceItems
				+ ", batchNumber=" + batchNumber + ", approval=" + approval
				+ ", mqmcId=" + mqmcId + ", mxmc=" + mxmc + "]";
	}
     
     
	
     
}
