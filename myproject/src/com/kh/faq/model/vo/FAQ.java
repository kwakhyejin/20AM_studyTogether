package com.kh.faq.model.vo;

import java.sql.Date;

public class FAQ {
	
	private int faqNo;
	private String faqTitle;
	private String faqCategory;
	private String faqContent;
	private Date faqDate;
	private String faqDeleteStatus;
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(int faqNo, String faqTitle, String faqCategory, String faqContent, Date faqDate,
			String faqDeleteStatus) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqCategory = faqCategory;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqDeleteStatus = faqDeleteStatus;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqCategory() {
		return faqCategory;
	}

	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public String getFaqDeleteStatus() {
		return faqDeleteStatus;
	}

	public void setFaqDeleteStatus(String faqDeleteStatus) {
		this.faqDeleteStatus = faqDeleteStatus;
	}

	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqCategory=" + faqCategory + ", faqContent="
				+ faqContent + ", faqDate=" + faqDate + ", faqDeleteStatus=" + faqDeleteStatus + "]";
	}
	
	
	
	
}
