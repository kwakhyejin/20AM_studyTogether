<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewBoard.css" type="text/css"/>

  <!-- 참여한 강좌가 없으면 row가 0이면..등록이 안되도록
참여한 강좌 리스트에는 로그인 되어있는 강좌만 표시 되도롣!!!! -->

<form>
<div>스터디후기작성</div>
	<table class="revWrite" style="padding-top:0px" align = "center" width="800" border="0" cellpadding="2" >
      <tr>
        <td>작성자</td>
        <td><%=loginMember.getUserId() %><input type="hidden" name="writer" value="<%=loginMember.getUserId()%>" readonly required/></td>
       </tr>
        
        <tr>
            <td>스터디</td>
            <td>
                <select name="allStudy" > 
                    <option value="스터디 선택">스터디 선택</option>
                </select>
            </td>
        </tr>
        <tr>
          <td>분야</td>
          <td><select name="field" > 
            <option value="카테고리">카테고리</option>
            <optgroup label="어학,회화">
                <option value="불어">불어</option>
                <option value="스페인어">스페인어</option>
                <option value="영어">영어</option>
                <option value="일본어">일본어</option>
                <option value="중국어">중국어</option>
                <option value="어학 기타">어학 기타</option>
            </optgroup>
            
            <optgroup label="자격증">
                <option value="공인중개사">제빵</option>
                <option value="미용">미용</option>
                <option value="정보처리기사">정보처리기사</option>
                <option value="컴퓨터활용">컴퓨터활용</option>
                <option value="토익">토익</option>
                <option value="자격증 기타">자격증 기타</option>
            </optgroup>

            <optgroup label="취미">
                <option value="공예">공예</option>
                <option value="맛집탐방">맛집탐방</option>
                <option value="밴드">밴드</option>
                <option value="요리">요리</option>
                <option value="운동">운동</option>
                <option value="취미 기타">취미 기타</option>
            </optgroup>
    

            <optgroup label="IT">
                <option value="알고리즘">알고리즘</option>
                <option value="데이터베이스">데이터베이스</option>
                <option value="자바프로그래밍">자바프로그래밍</option>
                <option value="운영체제">운영체제</option>
                <option value="HTML">HTML</option>
                <option value="IT 기타">IT 기타</option>
            </optgroup>

            <optgroup label="대학생">
                <option value="취업">취업</option>
                <option value="면접">면접</option>
                <option value="인문학과">인문학과</option>
                <option value="자연과학">자연과학</option>
                <option value="예체능">예체능</option>
                <option value="대학생 기타">대학생 기타</option>
            </optgroup>
            </select>
            </td>
        </tr>
        <tr>
            <td>만족도</td>
            <td><p id="star_grade">
                <a href="#">★</a>
                <a href="#">★</a>
                <a href="#">★</a>
                <a href="#">★</a>
                <a href="#">★</a>
             </p></td>
        </tr>
        <tr>
        	<td>내용</td>
        	<td><textarea name="content" cols=85 rows=5 style="resize:none;"></textarea></td>
        </tr>
	</table>
	<div align="right">
	            <button type="reset" onclick ="cancelChk()" id="revWCancelBtn" >취소</button>
	            <button onclick="revWriteChk()" type="submit" id="revWenrollBtn">등록</button>
</form>
      <script>
          var starCnt=0;
          $('#star_grade a').click(function(){
              $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
              $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
              starCnt =  $('#star_grade a').length - 1;
              console.log(starCnt);
              return false;
          });
  
          function cancelChk(){
        	  if (confirm("정말 취소하시겠습니까??") == true){    //확인
        		 	 location.replace("<%=request.getContextPath()%>/review/reviewStudy/reviewStudyList");
        		 }else{   //취소
        			 return false;
        		 }
           }
          function revWriteChk(){
        	  
          }
      </script>
<%@ include file="/views/common/footer.jsp"%>