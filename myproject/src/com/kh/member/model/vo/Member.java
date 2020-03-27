package com.kh.member.model.vo;

import java.sql.Date;

public class Member {

	private String userId;
	private String password;
	private String userName;
	private String email;
	private Date enrollDate;
	private String nickName;
	private String gender;
	private Date birthDate;
	private String phone;
	private String address;
	private char adminStatus;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	
	public Member(String userId, String password, String userName, String email, Date enrollDate, String nickName,
			String gender, Date birthDate, String phone, String address, char adminStatus) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.enrollDate = enrollDate;
		this.nickName = nickName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.phone = phone;
		this.address = address;
		this.adminStatus = adminStatus;
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public char getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(char adminStatus) {
		this.adminStatus = adminStatus;
	}


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", userName=" + userName + ", email=" + email
				+ ", enrollDate=" + enrollDate + ", nickName=" + nickName + ", gender=" + gender + ", birthDate="
				+ birthDate + ", phone=" + phone + ", address=" + address + ", adminStatus=" + adminStatus + "]";
	}
	
	

}
