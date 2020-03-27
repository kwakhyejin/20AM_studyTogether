<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.member.model.vo.Member, com.kh.common.listener.SessionCheckListener" %>
<%
   //Member m = (Member)request.getAttribute("loginedMember");
   Member loginMember = (Member)session.getAttribute("loginedMember");
   
 //cookie값 받아오기
   Cookie[] cookies = request.getCookies();
   String saveId=null;
   if(cookies != null){
      for(Cookie c : cookies){
         String key = c.getName();
         String value=c.getValue();
         if(key.equals("saveId")){
            saveId=value;
         }
      }
   }
%> 
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- CSS -->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" type="text/css"/>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" type="text/css"/>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/css/section.css" type="text/css"/>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
   
   <!-- JavaScript -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
   
   <title>Study Together</title>
</head>

<body>
<div class=main>
<% if(loginMember==null){ %>
    <a id=mainlogo href="메인.html"><img src="<%=request.getContextPath() %>/images/logo.png" width="180px" height="100px"></a>
    <button class="main2" type="button" onclick="location.href='<%=request.getContextPath() %>/faq/faqList'">고객센터</button>
	<button class="main2" type="button" data-target="#loginModalCenter" data-toggle="modal">회원가입</button>
    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="main2">로그인</button>
   <%}else{ %>
   <a id=mainlogo href="메인.html">
     <img src="<%=request.getContextPath() %>/images/logo.png" width="180px" height="100px">
  </a>
      <button class="main2">고객센터</button>
      <%if(loginMember!=null && loginMember.getUserId().equals("admin")){ %>
         <button onclick="location.href='<%=request.getContextPath()%>/admin/adminPage'" class="main2">관리페이지</button>                                                                              
      <%} %>
         <button onclick="location.href='<%=request.getContextPath()%>/member/memberView'" class="main2">내정보보기</button>                                                                              
     
      <button onclick="location.replace('<%=request.getContextPath()%>/logout.do')" class="main2">로그아웃</button>
   <%} %>
  </div>
  
  <!-- 로그인 한지현 -->
<div id="id01" class="modal">
  <form class="modal-content animate" style="width:30%" action="<%=request.getContextPath()%>/login" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img id="loginLogo" src="<%=request.getContextPath() %>/images/logo.png">
      <!-- <h1>로고</h1> -->
    </div>

    <div class="containerlogin">
      <!-- <label for="uname"><b>아이디</b></label> -->
      <input type="text" placeholder="ID" id="uname" name="uname" required>

      <!-- <label for="psw"><b>비밀번호</b></label> -->
      <input type="password" placeholder="Password" id="psw" name="psw" required>
        
      <button onclick="loginCheck();" class="form-button" type="submit">Login</button>

      <label>
        <input type="checkbox" id="store">아이디 저장
      </label>
      <label>
      <input type="checkbox" checked="checked" name="remember"> 로그인유지
    </label>
    </div>
    
   
    <div class="containerlogin" style="background-color:#f1f1f1">
 	<a id="myBtn">비밀번호 찾기</a> &nbsp;
     <a href="#">회원가입</a>
    </div>
  </form>
</div>
  <!-- 로그인 끝 --> 
     <!-- lookPw Modal -->
<div id="myModal" class="modal">
	<div class="modal-content2">
		<form action="<%=request.getContextPath()%>/lookforpassword" method="post">
			아이디<br><input type="text" name="id" id="userId" placeholder="ID"><br>
			이름<br><input type="text" name="name" id="name" placeholder="이름"><br>
			이메일<br><input type="email" name="email" id="email" placeholder="EMAIL">
			<input class="form-button" type="submit" value="전송">
		</form>
	</div>
</div> 
<!-- Join Modal -->
<div class="modal fade" id="loginModalCenter" tabindex="-1" role="dialog" aria-labelledby="loginModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <h2 class="text-center">회원가입</h2>       
                <div class="join-form">
                    <form action="<%=request.getContextPath() %>/member/memberEnrollEnd" method="post" onsubmit="return validate();">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <div class="form-group">
                                        <input type="text" id="id" class="form-control" name="id" placeholder="ID" required>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-idSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        아이디가 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-idDanger">
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        영문 대.소문자, 숫자 _,-만 입력 가능합니다
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                        <input type="password" id="password1" class="form-control" name="password" placeholder="Password" required>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-pwSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        비밀번호가 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-pwDanger">
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        영문 대,소문자, 숫자, 특수문자를 8글자 이상 입력하세요
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                        <input type="password" id="password2" class="form-control" placeholder="Password Check" required>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-pwSameSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        비밀번호가 일치합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-pwSameDanger">                                        
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        비밀번호가 서로 일치하지 않습니다
                                    </div>
                                </tr>
                                <tr>    
                                    <div class="form-group">
                                        <input type="text" id="name" class="form-control" name="userName" placeholder="Username" required>
                                    </div>                
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-nameSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        이름이 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-nameDanger">                                        
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        2~6글자의 한글만 2글자 이상 입력하세요
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                        <input type="email" id="email" class="form-control" name="email" placeholder="Email" required>
                                    </div>        
                                </tr>
                                <tr>
                                    <div class="alert alert-success" id="alert-emailSuccess">
                                        <svg class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        이메일이 적합합니다
                                    </div>
                                    <div class="alert alert-danger" id="alert-emailDanger">
                                        <svg class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                            <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                        </svg>                                        
                                        이메일 형식에 맞게 작성하세요 예)aa01@aa.aa
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group" id="submit">
                                        <button type="submit" class="btn btn-warning btn-block">가입하기</button>
                                    </div>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Join Modal End-->

<!-- Navigation Bar -->
<div id='submenu'>
  <ul class='mymenu'>
    <li class='menu1'>
      <a href="<%=request.getContextPath()%>/lector/lectorList">강좌 스터디</a>
    </li>
    <li class='menu2'>
      <a href="일반 스터디 목록.html">일반 스터디</a>
    </li>
    <li class='menu3'>
      <a href="<%=request.getContextPath()%>/review/reviewStudy/reviewStudyList">스터디 후기</a>
    </li>
    <li class='menu4'>
      <a href="">커뮤니티</a>
        <ul  class='menu4-submenu'>
          <li>
            <a href="">대나무 숲</a>
          </li>
          <li>
            <a href="">자유 게시판</a>
          </li>
        </ul>
    </li>
  </ul>
</div>
<!-- Navigation Bar End -->

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
   });
   //캐러셀
   $(document).ready(function(){
       // Activate Carousel
      // $("#myCarousel1").carousel();
       // Enable Carousel Indicators
       $(".item1").click(function(){
         $("#myCarousel").carousel(0);
       });
       $(".item2").click(function(){
         $("#myCarousel").carousel(1);
       });
       $(".item3").click(function(){
         $("#myCarousel").carousel(2);
       });  
       // Enable Carousel Controls
       $(".left").click(function(){
         $("#myCarousel").carousel("prev");
       });
       $(".right").click(function(){
         $("#myCarousel").carousel("next");
       });
     });
   
	//비밀번호 찾기
   // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
		var btn = document.getElementById("myBtn");


// When the user clicks on the button, open the modal 
   btn.onclick = function() {
        modal.style.display = "block";
   }
   window.onclick = function(event) {
       if (event.target == modal) {
           modal.style.display = "none";
       }
   }
   
   
</script>