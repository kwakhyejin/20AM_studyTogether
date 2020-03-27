<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import = "com.kh.faq.model.vo.FAQ" %>

<%
	FAQ f = (FAQ)request.getAttribute("faq");
%>







<%@ include file="/views/common/footer.jsp"%>
