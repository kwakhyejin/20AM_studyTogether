package com.kh.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		String value="";
		if(name!=null && (name.equals("password"))||(name.contentEquals("password_new"))) {
			//암호화 처리하여 값 전송하기
			System.out.println("암호화전 : "+super.getParameter(name));
			value=getSha512(super.getParameter(name));
			System.out.println("암호화 후 : "+value);
		}else {
			value=super.getParameter(name);
		}
		return value;
	}
	
	
	private String getSha512(String password) {
		String encPw=null;
		//sha512암호화를 위한 암호화 객체생성
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes=password.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);//암호화처리
		//byte자료형을 다시 String 방식으로 변환
		//Base64인코더를 이용하여처리
		encPw=Base64.getEncoder().encodeToString(md.digest());
		return encPw;
	}
	
	
}
