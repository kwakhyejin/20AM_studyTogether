package com.kh.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Google extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("yeongzz93@gmail.com", "tpalvmfhwprxm");
	}
}
