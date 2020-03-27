<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.kh.lector.model.vo.Lector" %>

<%
	Lector l=(Lector)request.getAttribute("lector");
%>
<%@ include file="/views/common/header.jsp"%>
<style>

fieldset {
    box-sizing: border-box;
    font-family: Sunflower;
    width: 700px;
    height: 300px;
    margin: 0 auto;
}
button{
    /* background-color: #4CAF50; */
    color: black;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

</style>

<!-- <div id="comment-container">
			<div class="comment-editor">
				<form action=/board/boardCommentInsert" method="post">
					<input type="text" name="commentContent"/>
					<button type="submit" id="btn-insert">등록</button>
					<input type="hidden" name="boardRef" value=""/>
					<input type="hidden" name="commentWriter" value="">
				</form>
			</div>
		</div> -->
		
		
       <h2>강좌 추가하기 </h2><br>
    <form action="<%=request.getContextPath()%>/lectorWatch/lectorOpenEnd" method="post" enctype="multipart/form-data">
   <input type="hidden" name="lectorRef" value="<%=l.getLectorNo()%>"/> 
     강사명 <input type="text" name="refWriter" value="<%=l.getLectorWriter() %>" readonly><br>
    강의 제목<input type="text" name="refTitle" required><br><br>
       
        강좌 분야
      <select id="searchType" type="hidden"> 
     	<option value="카테고리">카테고리</option>
     	 <optgroup label="어학,회화">
          <option value="영어">영어</option>
          <option value="일본어">일본어</option>
          <option value="스페인어">스페인어</option>
          <option value="불어">불어</option>
          <option value="기타">기타</option>
      </optgroup>
      <optgroup label="자격증">
          <option value="제빵">제빵</option>
          <option value="정보처리기사" >정보처리기사</option>
          <option value="컴퓨터활용">컴퓨터활용</option>
          <option value="토익" >토익</option>
          <option value="기타" >기타</option>
      </optgroup>
      <optgroup label="IT">
          <option value="알고리즘" >알고리즘</option>
          <option value="데이터베이스" >데이터베이스</option>
          <option value="자바프로그래밍">자바프로그래밍</option>
          <option value="기타" >기타</option>
      </optgroup>
      </select>
            <br>
      
            <br>
           <!--  <br>한줄 소개<br>
            <textarea name="intro1" cols="100" rows="3" style="resize: none;"  placeholder="*이 강좌의 특성을 간단하게 소개해주세요."></textarea>
            <br/> -->
            상세 소개<br>
            <textarea name="refIntro" cols="100" rows="20" style="resize: none;"  placeholder="*이 강좌에 대해 자세히 소개해주세요."></textarea><br>
            <br>
  <!-- 	썸네일 이미지<br>
            <input type="file" name="lectorImg" /><br><br> -->

            강좌 비디오 첨부<br>
            <input type="file" name="refLectorVideo"/><br><br> 
            <!-- 영상 첨부 추가 될 수 있도록!!!! 변경 -->
       
            <input type="hidden" name="price" placeholder="숫자만 입력" value="" readonly>원<br><br>
             
                <input type="submit" value="등록">
                <input type="reset" value="취소">
             
       </form>  

<%@ include file="/views/common/footer.jsp"%>
