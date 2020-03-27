<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<section id="faq-container">
	<h2>FAQ 작성</h2>
	<form action="<%=request.getContextPath() %>/faq/faqWriteEnd" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<!-- <td><input type="text" name="category" required></td> -->
				<td>
					<select name="category">
						<option value="">카테고리 선택</option>
						<option value="회원">회원</option>
						<option value="스터디개설">스터디개설</option>
						<option value="결제">결제</option>
						<option value="기타">기타</option>
					</select>
				<!-- <input type="text" name="category" required></td> -->
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="8" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록하기">
				</th>
			</tr>
			
		</table>
	</form>


</section>


<%@ include file="/views/common/footer.jsp"%>
