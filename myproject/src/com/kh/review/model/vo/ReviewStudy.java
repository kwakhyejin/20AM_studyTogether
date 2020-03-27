package com.kh.review.model.vo;

import java.sql.Date;

public class ReviewStudy {
	private int reviewStuNo;
    private String reviewStuWriter;
    private String studyName;
    private String reviewStuCategory;
    private String reviewStuContent;
    private int reviewStuStar;
    private Date reviewStuDate;
    
    public ReviewStudy() {
		// TODO Auto-generated constructor stub
	}

	public ReviewStudy(int reviewStuNo, String reviewStuWriter, String studyName, String reviewStuCategory,
			String reviewStuContent, int reviewStuStar, Date reviewStuDate) {
		super();
		this.reviewStuNo = reviewStuNo;
		this.reviewStuWriter = reviewStuWriter;
		this.studyName = studyName;
		this.reviewStuCategory = reviewStuCategory;
		this.reviewStuContent = reviewStuContent;
		this.reviewStuStar = reviewStuStar;
		this.reviewStuDate = reviewStuDate;
	}

	public int getReviewStuNo() {
		return reviewStuNo;
	}

	public void setReviewStuNo(int reviewStuNo) {
		this.reviewStuNo = reviewStuNo;
	}

	public String getReviewStuWriter() {
		return reviewStuWriter;
	}

	public void setReviewStuWriter(String reviewStuWriter) {
		this.reviewStuWriter = reviewStuWriter;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	public String getReviewStuCategory() {
		return reviewStuCategory;
	}

	public void setReviewStuCategory(String reviewStuCategory) {
		this.reviewStuCategory = reviewStuCategory;
	}

	public String getReviewStuContent() {
		return reviewStuContent;
	}

	public void setReviewStuContent(String reviewStuContent) {
		this.reviewStuContent = reviewStuContent;
	}

	public int getReviewStuStar() {
		return reviewStuStar;
	}

	public void setReviewStuStar(int reviewStuStar) {
		this.reviewStuStar = reviewStuStar;
	}

	public Date getReviewStuDate() {
		return reviewStuDate;
	}

	public void setReviewStuDate(Date reviewStuDate) {
		this.reviewStuDate = reviewStuDate;
	}

	@Override
	public String toString() {
		return "ReviewStudy [reviewStuNo=" + reviewStuNo + ", reviewStuWriter=" + reviewStuWriter + ", studyName="
				+ studyName + ", reviewStuCategory=" + reviewStuCategory + ", reviewStuContent=" + reviewStuContent
				+ ", reviewStuStar=" + reviewStuStar + ", reviewStuDate=" + reviewStuDate + "]";
	}
    
    
}
