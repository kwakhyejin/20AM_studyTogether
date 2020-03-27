<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import = "com.kh.faq.model.vo.FAQ" %>

<%
	FAQ f = (FAQ)request.getAttribute("faq");
%>


<section id="faq-container">

	<h2>FAQ 수정</h2>
	
	<form action="<%=request.getContextPath() %>/faq/faqUpdateEnd"
	method="post">
		<input type="hidden" name="no" value="<%=f.getFaqNo() %>"/>
		
		<table id="tbl-faq">
			<tr>
				<th>제 목</th>
				<td>
					<input type="text" name="title" value="<%=f.getFaqTitle()%>" id="faq_title" required/>
				</td>
			</tr>
			
			<tr>
				<th>카테고리</th>
					<td>
						<select name="category">
							<option value="">카테고리 선택</option>
							<option value="회원">회원</option>
							<option value="스터디개설">스터디개설</option>
							<option value="결제">결제</option>
							<option value="기타">기타</option>
						</select>
					</td>
				<!-- <input type="text" name="category" required></td> -->
			</tr>
			
			
			
			<tr>
				<th>내 용</th>
				<td>
					<textarea cols="50" rows="5" name="content" style="resize:none;"><%=f.getFaqContent() %></textarea>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="등록"/>
				</th>
			</tr>
		</table>
	
	
	</form>


</section>



<%@ include file="/views/common/footer.jsp"%>
