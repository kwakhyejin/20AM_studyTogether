<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.kh.lector.model.vo.Lector" %>
	
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/lectorList.css" type="text/css"/>

<%
	List<Lector> list=(List)request.getAttribute("list");
	
	String type=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
 	int cPage=(int)request.getAttribute("cPage");

%>
<section>
  <div class="make">
    <a href="<%=request.getContextPath()%>/lector/lectorOpen"><img src="<%=request.getContextPath() %>/images/owl.JPG" width="100px" height="auto" ><br><p>강좌 개설하기</p></a>
  </div>
  	<div id=title>강좌 스터디 찾기 </div>
	<div class="main_list">
	 <!-- 상단 제목 -->
	<div class="main_title">
      <!-- 카테고리 -->
     <select id="searchType" > 
     	<option value="all">전체</option>
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
      <button type="submit">검색</button>
      

  <!-- 리스트 -->
</div>
</div>
 <%if(list.isEmpty()){ %>
<div class="list_start">
	<h3>검색된 강좌가 없습니다.</h3>
<%}else{ %>
	<%for(Lector lector:list){ %>
  <a href="<%=request.getContextPath()%>/lector/lectorWatch?no=<%=lector.getLectorNo()%>">
  
    <div class="list_detail">
      <h4><%=lector.getLectorCategory() %></h4>
      <%if(lector.getLectorOriginalImg()!=null){ %>
      <div>
      <!-- 리네임된 파일업로드  -->
        <img src="<%=request.getContextPath() %>/upload/lector/<%=lector.getLectorOriginalImg() %>" class="" width="200px" height="150px">
      </div>
      <%} %>
      <div id="lectorTitle"><%=lector.getLectorTitle() %><br/><%=lector.getLectorPrice() %>원</div>
     
    </div>
  </a>
  <%}
	}%>
</div>
	 <ul class="pagination">
		<%=request.getAttribute("pageBar") %>
	</ul> 
	
<script>
    $( document ).ready( function() {
  var jbOffset = $( '.mymenu' ).offset();
  $( window ).scroll( function() {
    if ( $( document ).scrollTop() > jbOffset.top ) {
      $( '.mymenu' ).addClass( 'jbFixed' );
    }
    else {
      $( '.mymenu' ).removeClass( 'jbFixed' );
    }
  });
} );
    // 단순fadein효과주기
    
    $(document).ready(function() {
        /* 1 */
        $(window).scroll( function(){
            /* 2 */
            $('.list_detail').each( function(i){
                var bottom_of_object = $(this).offset().top + $(this).outerHeight();
                var bottom_of_window = $(window).scrollTop() + $(window).height();
                /* 3 */
                if( bottom_of_window > bottom_of_object/2 ){
                    $(this).animate({'opacity':'1'},500);
                }
            }); 
        });
    });
    
    

 /*  //온로드
   	$(function(){
  		$("#searchType").change(()=>{
  			//select가 변경됐을때 change함수 이용
  			let type=$("#searchType").val();
  			//userName,userId,gender 값받기
  			let english=$("#search-english");
  			let spanish=$("#search-spanish");
  			let japanese=$("#search-japanese");
  			let french=$("#search-french");
  			let Letc=$("#search-Letc");
  			let bread=$("#search-bread");
  			let inform=$("#search-inform");
  			let computer=$("#search-computer");
  			let toeic=$("#search-toeic");
  			let Jetc=$("#search-Jetc");
  			let algorithm=$("#search-algorithm");
  			let database=$("#search-database");
  			let java=$("#search-java");
  			let Ietc=$("#search-Ietc");
  			all.hide();
  			english.hide();//다 닫힌다
  			spanish.hide();//다 닫힌다
  			japanese.hide(); //다 닫힌다
  			french.hide();//다 닫힌다
  			Letc.hide();//다 닫힌다
  			bread.hide(); //다 닫힌다
  			inform.hide();//다 닫힌다
  			computer.hide();//다 닫힌다
  			toeic.hide(); //다 닫힌다
  			Jetc.hide();//다 닫힌다
  			algorithm.hide();//다 닫힌다
  			database.hide(); //다 닫힌다
  			java.hide();//다 닫힌다
  			Ietc.hide();//다 닫힌다
  			
  			$("#search-"+type).css("display","inline-block");
  		})
  		$("#searchType").trigger("change");//trigger(강제실행)(change)먼저 실행하고 위에 함수 실행
  	}) 
 */
    </script>
<%@ include file="/views/common/footer.jsp"%>
