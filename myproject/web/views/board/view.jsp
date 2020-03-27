<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.Board" %>
<%
	Board b=(Board)request.getAttribute("board");
	int maxNo=(int)request.getAttribute("maxNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	/*게시판 전체 크기*/
	.boardContainer{
		width:1401px;
		margin:0 auto;
		padding-top: 50px;
		display:flex;
	}
	/*사이드바 컨테이너*/
    .aside{
        width: 300px;
        padding-right: 50px;
        margin-top: 40px;
        border-right: 2px solid #e6e6e6;
		float: left;
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
    /*-------------*/
    /*게시판 전체내용*/
	.view_content{
		float: left;
		padding-top: 40px;
		width:100%;
		margin-left: 50px;
	}
	/*게시판 커뮤니티 이름*/
	.category_name{
		font-weight: bold;
		font-size: 30px;
		margin-left: 20px;
		margin-bottom: 20px;
	}
	/*게시판 뷰 화면 컨테이너*/
	.view_content2{
		padding: 15px;
		border: 1px solid lightgray;
	}
	/*게시판 뷰 top 메뉴*/
	.view_topMenu{
		list-style-type: none;
	}
	.view_topMenu>li{
		border-right: 5px solid lightgray;
		display: inline;
		padding-right: 10px;
	}
	.view_topMenu>li:last-of-type{
		border-right: 0;
	}
	/*게시판 뷰 top메뉴의 a태그*/
	.view_category{
		text-decoration: none;
		color:gray;
	}
	.view_category:hover{
		text-decoration: none;
		color:lightgray;
	}
	/*게시판 뷰의 게시판 제목*/
	.view_title{
		background-color: lightgray;
		border-bottom: 1px solid gray;
		text-indent: 1em;
		font-weight: 1000;
		font-family: "맑은 고딕";
		font-size: 24px;
		padding: 5px 0px;
		border-top: 2px solid red;
	}
	/*좋아요*/
	.good{
		display: inline-block;
		margin-right: 300px;
		border: 1px solid black;
		padding: 5px;
		width: 80px;
		height: 80px;
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	/*싫어요*/
	.bad{
		display: inline-block;
		border: 1px solid black;
		padding: 5px;
		width: 80px;
		height: 80px;
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	/*게시판 뷰에달린 댓글*/
	.view_comment{
		list-style-type: none;
		padding-left: 0px;
	}
	.view_comment>li{
		border-right: 5px solid lightgray;
		display: inline;
		padding-right: 10px;
		font-size: 11px;
	}
	.view_comment>li:last-of-type{
		border-right: 0;
	}
	/*답글에 대한 a태그*/
	.comment{
		color: gray;
		text-decoration: none;
		font-size: 13px;
	}
	/*댓글 내용*/
	.comment_content{
		border-bottom: 1px dotted blue;
		padding-bottom: 16px;
	}
	/*댓글 등록 컨테이너*/
	.comment_container{
		display: flex; 
		border-top: 1px dotted blue;
		padding-top: 16px;
	}
	/*textarea 속성*/
	.comment_text{
		resize: none; 
		width:90%;
		float: left;
	}
	/*댓글 등록*/
	.comment_insert{
		text-decoration: none;
		text-align: center;
    	border: 1px solid rgb(169,169,169);
		width: 100px;
		height: 78px;
		display: inline-block;
		padding-top: 24px;
		background-color: white;
		color: black;
	}
	.comment_insert:hover{
		text-decoration: none;
		color: black;
	}
	/*글쓰기 답글등 버튼 속성*/
	.listbtn{
		list-style-type: none;
		padding: 0;
	}
	.listbtn>li{
		display: inline;
    	padding: 5px 10px;
    	border: 1px solid lightgrey;
	}
	.listbtn>li>a, .listbtn>li>a:hover{
		text-decoration: none;
		color:gray;
	}
</style>
</head>
<body>
	<div class="boardContainer">
		<div class="aside">
	        <span class="aside_title">커뮤니티</span>
	        <ul class="aside_list">
	            <li style="margin-bottom: 5px;">자유게시판</li>
	            <li>묻고 답하기</li>
			</ul>
		</div>
		<div class="view_content">
			<div class="category_name">서버에서 넘어올 커뮤니티 이름</div>
			<div class="view_content2">	
				<ul class="view_topMenu" style="text-align: right;">
					<li style="color: blue;"><i class="fas fa-home"></i></li>
					<li><a class="view_category" href="#">현재 카테고리 값</a></li>
					<li style="color: red; font-weight: 600;">커뮤니티</li>
				</ul>		
				<div class="view_title">
					<%=b.getTitle() %>
				</div>
				<div style="padding: 5px 0px; border-bottom: 1px solid gray;">
					<ul class="view_topMenu" style="margin-bottom: 0px; padding-left: 20px;">
						<li><%=b.getNickname() %>&nbsp;</li>
						<li><%=b.getWrite_date() %> &nbsp;</li>
						<li>조회수 <%=b.getCnt()+1 %>&nbsp;</li>
						<li>좋아요 <%=b.getGood_cnt() %>&nbsp;</li>
						<li>싫어요 <%=b.getBad_cnt() %>&nbsp;</li>
					</ul>
				</div>
				<div style="border-bottom: 1px solid gray;">
				<%if(b.getFile_upload() != null) {%>
					<div style="text-align: right;">
						<i class="fas fa-download"></i>
						<%=b.getFile_upload() %>
					</div>
				<%} %>
					<p style="text-indent: 1em; margin-top: 16px;"><%=b.getContent() %></p>
					<div style="text-align: center;">
						<a class="good" href="#">
							<i style="color: red"class="far fa-thumbs-up"></i><br>
							<span id="goodAdd"><%=b.getGood_cnt() %></span><br>
							좋아요
						</a>
						<a class="bad" href="#">
							<i style="color: blue"class="far fa-thumbs-down"></i><br>
							<span id="badAdd"><%=b.getBad_cnt() %></span><br>
							싫어요
						</a>
					</div>
					<div style="padding-top: 50px;">
						<ul class="view_topMenu" style="padding-left: 20px;">
							<li>댓글 1</li>
							<li>최신순</li>
						</ul>
					</div>
					<div style="background-color: lightgray; padding: 10px 26px 16px 16px;">
						<ul class="view_comment">
							<li style="font-size: 14px; font-weight: bold;">작성자이름</li>
							<li>작성자이면표시</li>
							<li>댓글쓴 날짜</li>
							<li><a id="comment" class="comment" href="#" onclick="comment();">
								<i class="fas fa-reply fas-lg"></i>답글</a>
							</li>
						</ul>
						<p class="comment_content">댓글내용</p>
						<div style="padding-bottom: 16px;">
							댓글에대한 답글
						</div>
						<div class="comment_container">
							<textarea cols="50" rows="3" class="comment_text"></textarea>
							<div style="float: left; margin-left: 20px;">
								<a href="#" class="comment_insert">등록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 15px;">
				<ul class="listbtn" style="float: left;">
					<li><a href="#"><i class="fas fa-pen"></i> 글쓰기</a></li>
					<li><a href="#"><i class="fas fa-comment-dots"></i> 답글</a></li>
					<li><a href="#">목록</a></li>
				</ul>
				<ul class="listbtn" style="float: right;">
					<li><a href="#">삭제</a></li>
					<li><a href="#">수정</a></li>
				</ul>
			</div>
			<table class="table" style="clear: both; width: 100%; font-size: 13px;">
                <%if(b.getBoard_no()!=maxNo) {%>
                    <tr>
                        <td style="width: 100px;"><a href="javascript:boardView(<%=b.getBoard_no()+1 %>)" style="text-decoration: none; color:black;">
                        <i class="fas fa-angle-up" style="color: orange;"></i> 	
                        	이전글</a>
                       	</td>
                        <td style="width: 530px;">
                        	<a href="javascript:boardView(<%=b.getBoard_no()+1 %>)" style="text-decoration: none; color:black;">글제목</a>
                        </td>
                        <td>작성자명</td>
                        <td style="text-align: center;">작성날짜</td>
                    </tr>
                 <%} %>
                    <tr>
                        <td><a href="javascript:boardView(<%=b.getBoard_no()-1 %>)" style="text-decoration: none; color:black;">
                        <i class="fas fa-angle-down" style="color: orange;"></i> 
                        	다음글</a>
                        </td>
                        <td>
                        	<a href="javascript:boardView(<%=b.getBoard_no()-1 %>)" style="text-decoration: none; color:black;">글제목</a>
                        </td>
                        <td>작성자명</td>
                        <td style="text-align: center;">작성날짜</td>
                    </tr>
                </table>
                <form name="paging">
	                	<input type="hidden" name="no"/>
	            </form>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$("a[class='good']").on({
				mouseenter:function(){
					$(this).css({
						color:"black",
						textDecoration:"none"
					})
				}
			});
			$("a[class='bad']").on({
				mouseenter:function(){
					$(this).css({
						color:"black",
						textDecoration:"none"
					})
				}
			});
			$("#comment").on({
				mouseenter:function(){
					$(this).css({
						color:"gray",
						textDecoration:"none"
					})
				}
			});
		})
	function boardView(no){
    	var f=document.paging;
    	f.no.value=no;
    	f.action="<%=request.getContextPath()%>/board/boardView";
    	f.method="post";
    	f.submit();
    }
	</script>
</body>
</html>