<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section>
	<h2>비밀번호 변경 페이지 입니다.</h2>
	<form action="<%=request.getContextPath()%>/updatePassword" method="post">
		변경할 비밀번호<input type="password" name="psw" id="psw" placeholder="변경하실 비밀번호를 입력하세요">
		비밀번호 확인  <input type="password" name="psw" id="psw" placeholder="변경하실 비밀번호를 입력하세요">
	</form>
</section>
<%@ include file="/views/common/footer.jsp" %>