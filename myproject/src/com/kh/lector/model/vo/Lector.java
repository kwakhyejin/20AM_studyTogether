package com.kh.lector.model.vo;

import java.util.Date;

public class Lector {
	
       private int lectorNo;
	   private String lectorTitle;
	   private String lectorWriter;
	   private String lectorCategory;
	   private String lectorDetail;
	   private int lectorPrice;
	   private String lectorOriginalImg;
	   private String lectorRenamedImg;
	   private String lectorOriginalVideo;
	   private String lectorRenamedVideo;
	   private Date lectorDate;
	   private String lectorAssign;
	   
	   
	public Lector() {
	}


	public Lector(int lectorNo, String lectorTitle, String lectorWriter, String lectorCategory, String lectorDetail,
			int lectorPrice, String lectorOriginalImg, String lectorRenamedImg, String lectorOriginalVideo,
			String lectorRenamedVideo, Date lectorDate, String lectorAssign) {
		super();
		this.lectorNo = lectorNo;
		this.lectorTitle = lectorTitle;
		this.lectorWriter = lectorWriter;
		this.lectorCategory = lectorCategory;
		this.lectorDetail = lectorDetail;
		this.lectorPrice = lectorPrice;
		this.lectorOriginalImg = lectorOriginalImg;
		this.lectorRenamedImg = lectorRenamedImg;
		this.lectorOriginalVideo = lectorOriginalVideo;
		this.lectorRenamedVideo = lectorRenamedVideo;
		this.lectorDate = lectorDate;
		this.lectorAssign = lectorAssign;
	}


	public int getLectorNo() {
		return lectorNo;
	}


	public void setLectorNo(int lectorNo) {
		this.lectorNo = lectorNo;
	}


	public String getLectorTitle() {
		return lectorTitle;
	}


	public void setLectorTitle(String lectorTitle) {
		this.lectorTitle = lectorTitle;
	}


	public String getLectorWriter() {
		return lectorWriter;
	}


	public void setLectorWriter(String lectorWriter) {
		this.lectorWriter = lectorWriter;
	}


	public String getLectorCategory() {
		return lectorCategory;
	}


	public void setLectorCategory(String lectorCategory) {
		this.lectorCategory = lectorCategory;
	}


	public String getLectorDetail() {
		return lectorDetail;
	}


	public void setLectorDetail(String lectorDetail) {
		this.lectorDetail = lectorDetail;
	}


	public int getLectorPrice() {
		return lectorPrice;
	}


	public void setLectorPrice(int lectorPrice) {
		this.lectorPrice = lectorPrice;
	}


	public String getLectorOriginalImg() {
		return lectorOriginalImg;
	}


	public void setLectorOriginalImg(String lectorOriginalImg) {
		this.lectorOriginalImg = lectorOriginalImg;
	}


	public String getLectorRenamedImg() {
		return lectorRenamedImg;
	}


	public void setLectorRenamedImg(String lectorRenamedImg) {
		this.lectorRenamedImg = lectorRenamedImg;
	}


	public String getLectorOriginalVideo() {
		return lectorOriginalVideo;
	}


	public void setLectorOriginalVideo(String lectorOriginalVideo) {
		this.lectorOriginalVideo = lectorOriginalVideo;
	}


	public String getLectorRenamedVideo() {
		return lectorRenamedVideo;
	}


	public void setLectorRenamedVideo(String lectorRenamedVideo) {
		this.lectorRenamedVideo = lectorRenamedVideo;
	}


	public Date getLectorDate() {
		return lectorDate;
	}


	public void setLectorDate(Date lectorDate) {
		this.lectorDate = lectorDate;
	}


	public String getLectorAssign() {
		return lectorAssign;
	}


	public void setLectorAssign(String lectorAssign) {
		this.lectorAssign = lectorAssign;
	}


	@Override
	public String toString() {
		return "Lector [lectorNo=" + lectorNo + ", lectorTitle=" + lectorTitle + ", lectorWriter=" + lectorWriter
				+ ", lectorCategory=" + lectorCategory + ", lectorDetail=" + lectorDetail + ", lectorPrice="
				+ lectorPrice + ", lectorOriginalImg=" + lectorOriginalImg + ", lectorRenamedImg=" + lectorRenamedImg
				+ ", lectorOriginalVideo=" + lectorOriginalVideo + ", lectorRenamedVideo=" + lectorRenamedVideo
				+ ", lectorDate=" + lectorDate + ", lectorAssign=" + lectorAssign + "]";
	}

	
	
	
	
	
}
