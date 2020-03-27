<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.Board" %>
<%
	Board b=(Board)request.getAttribute("board");
	int maxNo=(int)request.getAttribute("maxNo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>조회</title>
    <script src="../../jquery/jquerywork/js/jquery-3.4.1.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
        /*부트스트랩 컨테이너 속성*/
        .container-fluid{
            width: 1401px;
            margin-left: 251px;
        }
        /*글조회 상단 ul태그 css*/
        .ulinline{
            list-style-type: none;
            padding-left: 0px;
            text-indent: 1em;
        }
        /*글조회 상단 ul태그 css*/
        .ulinline li{
            border-right: lightgray 5px solid;
            display: inline;
        }
        /*글조회 상단 ul태그 css*/
        .ulinline li:last-of-type{
            border-right: 0px;
        }
        /*a태그 속성*/
        a.button{
            text-decoration: none;
            color: gray;
        }
        /*a태그에 올려놨을때 속성*/
        a.button:hover{
            text-decoration: none;
            color: gray;
        }
        /* 글제목에 쓰여질 css */
        .title{
            background-color: lightgray; 
            border-bottom: 1px solid gray;
            text-indent: 1em;
            font-weight: 1000;
            font-family: "맑은 고딕";
            font-size: 24px;
            padding: 5px 0px;
        }
        /*댓글달았을때 작성자이름 날짜 등등*/
        .replystyle{
            display: inline-block; 
            position: absolute; top: 0px;
            font-size: 13px;          
        }
        /*댓글내용*/
        .replycontent{
            padding-left: 66px;
            padding-bottom: 50px;
            border-bottom: white 1px solid;
        }
        /*댓글달 textarea*/
        .reply_text{
            resize: none;
            width: 100%;
            padding: 1px 0;
        }
        /*글쓰기 답글 등등 버튼 속성*/
        .listbtn{
            list-style-type: none;
            padding: 0;
        }
        /*글쓰기 답글 등등 버튼 속성*/
        .listbtn li{
            display: inline;
            padding: 5px 10px;
            border: 1px solid lightgrey;
        }
        /*좋아요 속성*/
        a.good{
        	display: inline-block; 
        	margin-right: 200px; 
        	border: 1px solid black; 
        	padding: 5px; 
        	width:80px; 
        	height:80px;
        	text-decoration: none;
        	color:black;
        	font-weight: bold;
        }
        /*싫어요 속성*/
        a.bad{
        	display: inline-block; 
        	border: 1px solid black; 
        	padding: 5px; 
        	width:80px; 
        	height:80px;
        	text-decoration: none;
        	color:black;
        	font-weight: bold;
        }
        /*댓글 등록 버튼*/
        a.replysubmit{
        	text-decoration: none;
        	border: 1px solid rgb(169,169,169); 
        	width: 80px; 
        	height: 52px; 
        	display: inline-block; 
        	padding-top: 12px; 
        	background-color: white; 
        	color: black;
        }
    </style>
</head>
<body>
    <!--<i class="fas fa-edit">1</i>-->
    <div class="container-fluid" style="border: 1px solid blue;">
        <div class="row" style="padding-top: 50px;">
            <div class="col-sm-3">
                <!-- <div class="a">
                    <input type="text" size="20">
                    <button class="btn btn-primary">검색</button>
                    <h4><span style="font-weight: bold;">게시판</span></h4>
                </div> -->
                <div>
                    <div style="border-bottom: 2px solid black;">
                        <h4><span style="font-weight: bold;">게시판</span></h4>
                    </div>
                    <ul class="sidemenu">
                        <li>공부인증 게시판</li>
                        <li>대나무숲</li>
                        <li>묻고 답하기</li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-8" style="margin-left: 50px; margin-top: 38px;">
                <div style="border: 1px solid lightgray; padding: 15px">
                    <div style="text-align: left; margin-bottom: 30px;">
                        <h2><span style="font-weight: bold;">게시판</span></h2>
                    </div>
                    <div style="text-align: right;">
                        <ul class="ulinline">
                            <li style="color: blue;"><a href="<%=request.getContextPath()%>/"><i class="fas fa-home"></i>&nbsp;</a></li>
                            <li><a class="button" href="#">공부인증 게시판</a>&nbsp;</li>
                            <li style="color: red; font-weight: 600;">커뮤니티</li>
                        </ul>
                    </div>
                    <div style="border-top: 2px solid red;">
                        <div class="title">
                            <span><%=b.getTitle() %></span>
                        </div>
                    </div>
                    <div style="padding: 5px 0px; border-bottom: 1px solid gray;">
                        <ul class="ulinline" style="margin-bottom: 0px;">
                            <li><%=b.getNickname() %>&nbsp;</li>
                            <li><%=b.getWrite_date() %> &nbsp;</li>
                            <li>조회수 <%=b.getCnt()+1 %>&nbsp;</li>
                            <li>좋아요 <%=b.getGood_cnt() %>&nbsp;</li>
                            <li>싫어요 <%=b.getBad_cnt() %>&nbsp;</li>
                        </ul>
                    </div>
                    <div style="border-bottom: 1px solid gray;">
                        <div>
                            <p style="text-indent: 1em; margin-top: 16px;"><%=%></p>
                            <div style="text-align: center;">                              
                                <a class="good" id="good" href=""><i style="color: red"class="far fa-thumbs-up"></i><br>
                                    <span id="goodAdd"><%=b.getGood_cnt() %></span><br>좋아요</a>                                   
                                <a class="bad" id="bad" href=""><i style="color: blue;" class="far fa-thumbs-down"></i><br>
                                    <span id="badAdd"><%=b.getBad_cnt() %></span><br>싫어요</a>
                            </div>
                        </div>
                        <div style="padding-top: 50px;">
                            <ul class="ulinline">
                                <li>댓글 1&nbsp;</li>
                                <li>최신순</li>
                            </ul>
                        </div>
                        <div style="background-color: lightgray; padding: 10px 26px 16px 16px;">
                            <div style="position: relative;">
                                <img src="" style="border: 1px solid blue; border-radius: 50%; width: 50px; height: 50px;">
                                <ul class="ulinline replystyle">
                                    <li>작성자이름</li>
                                    <li>작성자이면표시</li>
                                    <li>댓글쓴날짜</li>
                                    <li><a id="comment" class="button" href="#" onclick="comment();"><i class="fas fa-reply fas-lg"></i>답글</a></li>
                                </ul>
                            </div>
                            <div class="replycontent">
                                	댓글내용
                                <div id="re_reply" class="re_reply">1</div>
                            </div>
                            <div style="position: relative;">
                                <div style="padding: 10px; width: 90%; display: inline-block;">
                                    <textarea name="reply_text" id="reply_text" cols="50" rows="2" class="reply_text"></textarea>
                                    <!-- <div class="upload_image" style="display: none;"></div> -->
                                </div>
                                <div style=" width: 80px; height: 52px; text-align: center; display: inline-block; position: absolute; top: 10px;">
                                    <a class ="replysubmit" href="" style="">등록</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="padding-top: 15px;">
                    <ul class="listbtn" style="float: left;">
                        <li><a class="button" href=""><i class="fas fa-pen"></i> 글쓰기</a></li>
                        <li><a class="button" href=""><i class="fas fa-comment-dots"></i> 답글</a></li>
                        <li><a class="button" href="">목록</a></li>
                    </ul>
                    <ul class="listbtn" style="float: right;">
                        <li><a class="button" href="">삭제</a></li>
                        <li><a class="button" href="">수정</a></li>
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
    </div>
    <script>
    function comment(){
    		console.log("클릭");
    		$("#comment").html("<i class='fas fa-reply fas-lg'></i>답글취소");
    }
    function boardView(no){
    	var f=document.paging;
    	f.no.value=no;
    	f.action="<%=request.getContextPath()%>/board/boardView";
    	f.method="post";
    	f.submit();
    }
        $(function(){
            var good=0;
            var bad=0;
            $("#good").click(function(){
                console.log("good");
            })
            $("#bad").click(function(){

            })
        })
    </script>        
</body>
</html>