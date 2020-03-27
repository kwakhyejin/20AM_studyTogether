<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>글쓰기</title>
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
<script src="./smarteditor/js/service/HuskyEZCreator.js"></script>
</head>
<style>
    .item{
        display: inline-block;
        width: 100px;
        background-color: lightblue;
    }
    .right{
        display: inline-block;
    }
    .container-fluid{
        width: 1401px;
        margin-left: 251px;
    }
    .write{
        text-decoration: none;
        color: white;
        margin-right: 10px;
        background-color: red;
        padding: 5px 10px;
        border-radius: 0;
    }
    .write:hover{
        color: white;
        text-decoration: none;
    }
    .fileAdd{
        background-color: red;
        padding: 5px 10px;
        margin-right: 10px;
        color: white;
        border: 0px;
        outline: none;
    }
    .fileDelete{
        background-color: gray;
        padding: 5px 10px;
        margin-right: 10px;
        color: white;
        border: 0px;
        outline: none;
    }
</style>
<body style="background-color:#f2f4f7;">
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
            <form action="<%=request.getContextPath()%>/board/boardList" 
            method="post" enctype="multipart/form-data" onsubmit="return valiwrite();">
            <div class="col-sm-auto" style="margin-left: 50px; margin-top: 38px;">
                <div style="margin-bottom: 16px;">
                    <span class="item">제목</span>
         	<input type="text" name="title" id="title" placeholder="게시글 제목을 입력하세요" size="70"/>
                </div>
                <div style="padding-left: 104px;">
                    <textarea name="content" id="content"style="width: 708px; height:390px; resize:none"></textarea>
                </div>
                <div style="margin-bottom: 16px;">
                    <span class="item">첨부파일</span> 
                    <button type="button" class="fileAdd" id="fileAdd">
                        <i class="fas fa-plus-circle"></i>추가하기
                    </button>
                    <button type="button" class="fileDelete" id="fileDelete">
                        <i class="fas fa-times-circle"></i>삭제하기
                    </button>
                </div>
                <div id="fileArea" style="padding-left: 104px;">
                    <div id="data1">
                        <span class="item">파일#1</span> 
                        <input type="file" name="fileup1" id="fileup1">
                    </div>
                </div>
                <div id="filelimit"></div>
                <div style="text-align: center; margin-left: 104px; margin-top: 16px;">
                    <button type="submit" class="write"><i class="fas fa-check"></i> 작성완료</button>
                    <a href="<%=request.getContextPath() %>/board/boardList" class="write" style="background-color: gray;" onclick="return confirm('뒤로 가시겠습니까?');">취소</a>
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
                        "padding-left":"104px"
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
        	}else if(content.value.trim()==""){
        		alert("내용을 입력하세요");
        		content.value="";
        		content.focus();
        		return false;
        	}else{
        		return true;
        	}
        }
        
    </script> 
</body>
</html>