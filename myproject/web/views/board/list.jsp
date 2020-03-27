<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kh.board.model.vo.Board" %>
<%
		List<Board> list=(List)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 테스트</title>
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
	/*-------------*/
    /*커뮤니티 이름*/
    .aside_title{
        display: block;
        font-weight: bold;
        font-size: 24px;
        padding-left: 20px;
        padding-bottom: 20px;
        border-bottom: 2px solid red;
    }
	/*게시판 전체내용*/
	.board_content{
		float: left;
		padding-top: 40px;
		width:100%;
		text-align: center;
		margin-left: 50px;
	}
	/*게시판 커뮤니티 이름*/
	.category_name{
		display: block;
		font-weight: bold;
		font-size: 30px;
		margin-left: 20px;
		margin-bottom: 20px;
	}
	/*글쓰기 버튼*/
	.write_btn{
		color: black;
		padding: 10px;
		border: 1px solid lightgray;
	}
	/*제목 속성*/
	.board_title, .board_title:hover{
		color:black;
		text-decoration: none;
	}
	/*검색 버튼*/
	.search_btn, .search_btn:active, .search_btn:focus{
		height: 100%;
		color: white;
		background-color: orange;
		border: 0px;
		padding: 3px 6px;
		outline: none;
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
		<div class="board_content">
			<span class="category_name">서버에서 넘어올 커뮤니티 이름</span>
			<table class="table">
        		<thead>
            	<tr>
	            	<th></th>  
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th>조회</th>
	                <th>좋아요</th>
	                <th>싫어요</th>
            	</tr>
	            </thead>
	            <tbody>
	            <%if(list==null||list.isEmpty()) {%>
	            	<tr>
	                	<td colspan="7">등록된 게시물이 존재하지 않습니다.</td>
	                </tr>
	            <%}else {%>
	            <%for(Board b : list) {%>
		        	<tr>
						<td><%=b.getBoard_no() %></td>
						<td>
							<a class="board_title" href="javascript:boardView(<%=b.getBoard_no()%>)">
								<%=b.getTitle() %>
							</a>
						</td>
						<td><%=b.getNickname() %></td>
						<td><%=b.getWrite_date() %></td>
						<td><%=b.getCnt() %></td>
						<td><%=b.getGood_cnt() %></td>
						<td><%=b.getBad_cnt() %></td>
					</tr>
	            <%}
	            }%>
	            </tbody>
    		</table>
    		<div style="text-align: right;">
            	<a id="write_btn" class="write_btn" href="<%=request.getContextPath()%>/board/boardwrite"><i class="fas fa-edit"></i>글쓰기</a>
			</div>
			<div>
				<ul class="pagination justify-content-center">
					 <%=request.getAttribute("pageBar") %>
				</ul>
				<div>
					<form action="#" >
						<select name="searchDate" id="searchDate" style="background-color:white;">
							<option value="full" selected>전체기간</option>
							<option value="week">1주일</option>
							<option value="month">1개월</option>
							<option value="halfyear">6개월</option>
							<option value="year">1년</option>
						</select>
						<select name="searchContent" id="searchContent" style="background-color:white;">
							<option value="titleContent" selected>제목+내용</option>
							<option value="title">제목만</option>
							<option value="writer">글작성자</option>
							<option value="replyContent">댓글내용</option>
							<option value="replyWriter">댓글작성자</option>
						</select>
						<input type="text" placeholder="검색어를 입력해주세요" size="30"><!--
						--><input type="submit" class="search_btn" value="검색"/>
					</form>
				</div>
			</div>
		</div>
		<form name="paging">
	    	<input type="hidden" name="no"/>
	        <input type="hidden" name="cPage"/>
	    </form>
	</div>
	<script>
		$(document).ready(function(){
			$("#write_btn").on({
				mouseenter:function(){
					$(this).css({
						color:"black"
					});
				}
			});
			$("#board_title").on({
				mouseenter:function(){
					$(this).css({
						color:"black",
						textDecoration:"none"
					});
				}
			});
		})
	function boardView(no){
    	var f=document.paging;
    	f.no.value=no;
    	//alert(f.no.value);
    	f.action="<%=request.getContextPath()%>/board/boardView";
    	f.method="post";
    	f.submit();
    }
    function boardList(cPage){
    	var f=document.paging;
    	f.cPage.value=cPage;
    	f.action="<%=request.getContextPath()%>/board/boardList";
    	f.method="post";
    	f.submit();
	}
	</script>
</body>
</html>