<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    /*글쓰기 컨테이너*/
    .write_content{
        float: left;
        margin-top: 40px;
    }
    /*게시판 커뮤니티 이름*/
	.category_name{
		font-weight: bold;
		font-size: 30px;
		margin-left: 20px;
		margin-bottom: 20px;
	}
    /*제목 영역*/
    .write_title{
        margin-left: 20px;
		margin-bottom: 20px;
    }
    .write_item{ 
        width: 100px;
        height: 36px;
        display: inline-block;
    }
    #title{
        height:30px;
        font-size:16px;
    }
    /*파일추가 버튼*/
    .fileAdd, .fileAdd:active, .fileAdd:focus{
        background-color: red;
        padding: 5px 10px;
        margin-right: 10px;
        color: white;
        border: 0px;
        outline: none;;
    }
    /*파일삭제 버튼*/
    .fileDelete, .fileDelete:active, .fileDelete:focus{
        background-color: gray;
        padding: 5px 10px;
        margin-right: 10px;
        color: white;
        border: 0px;
        outline:none;
    }
    /*파일보내는 영역*/
    #fileArea{
        padding-left: 106px; 
        clear: both;
        position: relative;
        top: 16px;
    }
    /*버튼 클릭시 서버에 전송할 영역*/
    .sendArea{
        text-align: center; 
        margin-left: 106px; 
        position: relative;
        top: 32px;
    }
    /*보내는 버튼 속성*/
    .write, .write:hover, .write:active, .write:focus{
        text-decoration: none;
        color: white;
        margin-right: 10px;
        background-color: red;
        padding: 5px 10px;
        outline: none;
        border: 0px;
    }
    .item{
        font-weight: bold;
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
        <div class="write_content">
            <div class="category_name">카테고리 이름</div>
            <form action="<%=request.getContextPath()%>/board/boardWriteEnd" 
                method="post" enctype="multipart/form-data" onsubmit="return valiwrite();">
                <input type="hidden" name="fileCnt" value="2"/>
            <div class="write_title">
                <div class="write_item">
                    <span style="font-weight: bold;">제목</span>
                </div>
                <input type="text" name="title" id="title" placeholder="게시글 제목을 입력하세요" size="70"/>
                <div style="padding-left: 106px; margin-top:16px">
                    <textarea name="write_text" id="write_text" style="width: 708px; height:390px; resize:none"></textarea>
                </div>
                <div class="write_item" style="float: left; margin-top: 16px;">
                    <span style="font-weight: bold;">첨부파일</span>
                </div>
                <div style="float: left; margin-left: 6px; margin-top: 16px;">
                    <button type="button" class="fileAdd" id="fileAdd">
                        <i class="fas fa-plus-circle"></i>추가하기
                    </button>
                    <button type="button" class="fileDelete" id="fileDelete">
                        <i class="fas fa-times-circle"></i>삭제하기
                    </button>
                </div>
                <div id="fileArea">
                    <div id="data1">
                        <span class="item">파일#1</span> 
                        <input type="file" name="fileup1" id="fileup1">
                    </div>
                </div>
                <div id="filelimit"></div>
                <div class="sendArea">
                    <button type="submit" class="write"><i class="fas fa-check"></i> 작성완료</button>
                    <a href="<%=request.getContextPath() %>/board/boardList" class="write" style="background-color: gray; height: 34px;" onclick="return confirm('뒤로 가시겠습니까?');">취소</a>
                </div>
            </div>
            </form>
        </div>
    </div>
    <script>
        $(function(){
            var cnt = 1;
            
            //파일창 추가
            $("#fileAdd").click(event,function(){
                //var span=$("<span class='item'>파일#"+cnt+"</span>");
                var data="<div id='data"+(cnt+1)+"'><span class='item'>파일#"+(cnt+1)+"</span> "+
                "<input type='file' name='fileup"+(cnt+1)+"' id='fileup"+(cnt+1)+"'></div>";
                    if(cnt > 4){
                    $("#filelimit").html("※파일은 최대 5개까지만 등록가능합니다.").
                    css({
                        "color":"red",
                        "font-weight":"bold",
                        "padding-left":"106px",
                        "position":"relative",
                        "top":"16px"
                    });
                    
                    //$("#fileAdd").off("click");
                    event.preventDefault();
                }else{
                    $("#fileArea").append(data);
                }
                if(cnt<5)cnt++;
                //var input=$("<input type='file' name='fileup"+cnt+"' id='fileup"+cnt+"'>");        
                console.log(cnt);
            })
            //파일창 삭제
            $("#fileDelete").click(event,function(){
                if(cnt == 1){
                    //$("#fileDelete").off("click");
                    event.preventDefault();
                }else{
                    $("#data"+cnt).remove();
                }
                if(cnt>1){
                    cnt--;
                }
                if(cnt<5){
                    $("#filelimit").html("").
                    removeAttr("style");
                }
                
            })
        })
        function valiwrite(){
        	var title=document.getElementById("title");
        	var content=document.getElementById("content");
        	console.log("제목 : "+title.value);
        	if(title.value.trim()==""){
        		alert("제목을 입력하세요");
        		title.value="";
        		title.focus();
        		return false;
        	}else if(write_text.value.trim()==""){
        		alert("내용을 입력하세요");
        		write_text.value="";
        		write_text.focus();
        		return false;
        	}else{
        		return true;
        	}
        } 
        $(function(){
            var fileCnt=document.getElementsByName("fileCnt");
            
            $("form").submit(function(){
                fileCnt[0].value=$("input[type='file']").length;
            })
        })      
    </script> 
</body>
</html>