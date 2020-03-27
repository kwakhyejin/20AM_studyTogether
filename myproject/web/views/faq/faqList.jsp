<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import="java.util.List,com.kh.faq.model.vo.FAQ" %>

<%
	List<FAQ> list = (List)request.getAttribute("list");
%>	

<script>
	function fn_faqWrite(){
		location.replace("<%=request.getContextPath()%>/faq/faqWrite");
	}
</script>

<section id="faq-container">
	<h2>FAQ 자주 묻는 질문</h2>
<%-- 		<% if(loginMember!=null&&loginMember.getUserId().equals("admin")){ %> --%>
<!-- 			<!-- null && 로 안하면 nullpoint exception 뜨겠지 --> 
 			<button type="button" id="btn-faq-write" onclick="fn_faqWrite();">FAQ 작성</button>
<%-- 		<% } %> --%>

	<table id="tbl-faq">
		<tr>
			<th>카테고리</th>
			<th>제목</th>			
		</tr>
	<% if(list.isEmpty()){ %>
		<tr>
			<td colspan='2'> 검색된 FAQ가 없습니다!</td>
		</tr>
	<% } else{ %>
		<%	for(FAQ f : list){ %>
		<tr>
			<td><%= f.getFaqCategory() %></td>				
			<td><a href="<%= request.getContextPath() %>/faq/faqView?no=<%=f.getFaqNo() %>">
					<%= f.getFaqTitle() %>
				</a>
			</td>
		</tr>
		<%} %>
	<%} %>
	</table>
	
	<div id="pageBar">
		<%= request.getAttribute("pageBar") %>
	</div>

</section>


<%@ include file="/views/common/footer.jsp"%>
