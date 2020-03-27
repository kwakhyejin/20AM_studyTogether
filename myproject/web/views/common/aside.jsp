<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*사이드바 컨테이너*/
    .aside{
        width: 265px;
        padding-right: 50px;
        padding-top: 40px;
        border-right: 2px solid #e6e6e6;
    }
    /*사이드바 메뉴*/
    .aside_list{
        list-style-type: none;
        padding-left: 20px;   
        margin-top: 20px;
    }
    /*커뮤니티 이름*/
    .aside_title{
        display: block;
        font-weight: bold;
        font-size: 24px;
        padding-left: 20px;
        padding-bottom: 20px;
        border-bottom: 2px solid red;
    }
</style>
</head>
<body>
    <div class="aside">
        <span class="aside_title">커뮤니티</span>
        <ul class="aside_list">
            <li style="margin-bottom: 5px;">자유게시판</li>
            <li>묻고 답하기</li>
        </ul>
        <div>
            테스트
        </div>
    </div>
	
</body>
</html>