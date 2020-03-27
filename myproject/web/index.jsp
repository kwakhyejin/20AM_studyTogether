<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header페이지 불러오기 -->
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/section.css" type="text/css"/>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath() %>/images/c-1.jpg" class="d-block w-100" alt="Seoul">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/images/c-2.jpg" class="d-block w-100" alt="Los Angeles">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/images/c-3.jpg" class="d-block w-100" alt="China">
    </div>
  </div>
  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div id="hr">
  <i>지금 이 순간에도 적들의 책장은 넘어가고 있다.</i></div>
<!-- 현재시간 -->
<div id="clock"></div>
<!-- 후기 -->


<!-- 실시간 게시판 -->
<div id="hr2">
  <p>Let's STUDY 실시간 후기</p>
  </div>

<div class=rollingwrap>
<div class="rolling">
  <ul id="ticker_01" class="ticker">
      <li><p style="font-size: 20px"> 정처기 스터디</p>
          <p>정말 많은 도움이 되었습니다. 혼자였다면 어려웠을거에요.</p><hr>
      </li>
      <li><p style="font-size: 20px">토익 스터디</p>
          <p>부족한 부분이 있었는데 팀원들과 함께 성장했습니다.</p><hr>
      </li>
      <li><p style="font-size: 20px">취업 스터디</p>
          <p>취업에 성공했습니다. 감사합니다.</p><hr>
      </li>
      <li><p style="font-size: 20px">영어회화 스터디</p>
          <p>스터디 날만 기다려집니다.</p><hr>
      </li>
  </ul>
</div>


<!-- 슬라이드 후기 -->
<div class="slide">
  <ul>
    <li><img width="300px" height="auto" src="<%=request.getContextPath() %>/images/1.JPG" ></li>
    <li><img width="300px" height="auto" src="<%=request.getContextPath() %>/images/2.JPG"></li>
    <li><img width="300px" height="auto" src="<%=request.getContextPath() %>/images/3.JPG"></li>
    <li><img width="300px" height="auto" src="<%=request.getContextPath() %>/images/2.JPG"></li>
  </ul>
</div>
  </div>
  <div class="container1">
    <button type="button" class="btn btn-danger" onClick="후기게시판">더 많은 후기 보러가기</button>
  </div>

  <div id="hr">
    <i>행복은 성적순이 아닐지 몰라도 성공은 성적순이다.</i></div>
  <div id="hr2">
    <p>Let's STUDY &nbsp;신규강좌 TOP3</p>
  </div>
<!-- 동영상 강의 -->
  <div class="parent">
    <div class="first">first</div>
    <div class="second">second</div>
    <div class="third">third</div>
</div>
<div class="container1">
  <button type="button" class="btn btn-danger" onClick="location.href='강좌 스터디 목록.html'">더 많은 강좌 보러가기</button>
</div>
<script>

// 현재시간 출력
     //switch문에 비교연산? 가능???
     setInterval(function(){
        var container=document.getElementById("clock");
        var date=new Date();
       container.innerHTML="현재 시간 "+date.getHours()+" : "+date.getMinutes()+" : "+date.getSeconds()+" :   "+date.getMilliseconds();
   

    var min=new Date().getMinutes();//현재시간의 분

},6);

// 게시판롤링
        function tick(){
            $('#ticker_01 li:first').slideUp(function(){$(this).appendTo($('#ticker_01')).slideDown();});
        }
        setInterval(function(){tick()},3000);

</script>
<!-- footer페이지 불러오기 -->
<%@ include file="/views/common/footer.jsp" %>