package cn.tiantong.entity;

import java.io.Serializable;

public class InscriptionEditor implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 907778226709903869L;
	private Integer eId;
	private String sgdbh;
	private Integer wordsNumber;
	private String editorText;
	public Integer geteId() {
		return eId;
	}
	public void seteId(Integer eId) {
		this.eId = eId;
	}
	public String getSgdbh() {
		return sgdbh;
	}
	public void setSgdbh(String sgdbh) {
		this.sgdbh = sgdbh;
	}
	public Integer getWordsNumber() {
		return wordsNumber;
	}
	public void setWordsNumber(Integer wordsNumber) {
		this.wordsNumber = wordsNumber;
	}
	public String getEditorText() {
		return editorText;
	}
	public void setEditorText(String editorText) {
		this.editorText = editorText;
	}
	@Override
	public String toString() {
		return "InscriptionEditor [eId=" + eId + ", sgdbh=" + sgdbh
				+ ", wordsNumber=" + wordsNumber + ", editorText=" + editorText
				+ "]";
	}
	

}
