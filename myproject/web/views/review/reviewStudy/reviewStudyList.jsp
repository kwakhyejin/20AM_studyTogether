<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.review.model.vo.ReviewStudy" %>
<%
	List<ReviewStudy> list = (List)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp"%>
   <!-- css파일 호출 -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewBoard.css" type="text/css"/>
 

  
<div id="reviewEntry" style=background-image:url('<%=request.getContextPath() %>/images/latter2.jpg');>
        <h1 id="reviewTitle">스터디 후기</h1>
</div>
    <div>
    <br><br>
     
    <div id="selectReview" style="font-size:15px">
        <a href="<%=request.getContextPath()%>/views/review/reviewStudyList.jsp">스터디 후기</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="<%=request.getContextPath()%>/views/review/reviewLectureList.jsp">강좌 후기</a>
    </div>
    <br>
    <%for(ReviewStudy revS : list) {%>
        <fieldset id="reviewField">
         <hr>
            <td><%=revS.getReviewStuCategory()%></td> 
            <td><span style="float:right;"><%=revS.getReviewStuDate() %></span></td>
            <h2><%=revS.getStudyName() %></h2>
            <%-- <%if(%> --%>
            <p id="star_grade">
                <a href="#">★</a>
                <a href="#">★</a>
                <a href="#">★</a>
                <a href="#">★</a>
                <a href="#">★</a>
            </p>
            <h4><%=revS.getReviewStuContent() %></h4>
        
            <td><span style="float:right;"><%=revS.getReviewStuWriter() %></span></td>
                <br>
             <hr>
            </fieldset>
           
	<%} %>

       		<ul class="pagination" style="margin-left:600px">
			<%=request.getAttribute("pageBar") %>
			</ul>
        <%if(loginMember!=null){%>
			<input type="button" value="후기 작성" id ="rev_WriteBtn" onclick="fn_writeReviewStudy()"/>
		<%} %>
       
    </div>

    <script>
         $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
         function fn_writeReviewStudy(){
 			location.replace("<%=request.getContextPath()%>/review/reviewStudyWrite");
 		}
    </script>
<%@ include file="/views/common/footer.jsp"%>