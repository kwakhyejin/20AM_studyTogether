<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kh.board.model.vo.Board" %>
<%
	List<Board> list=(List)request.getAttribute("list");
%>
<%@include file="/views/common/header.jsp" %>
    <div class="container-fluid" >
        <div class="row" style="padding-top: 50px;">
            <div class="col-sm-3" style="padding-right: 70px;">
                <aside>
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
                </aside>
                </div>
                <div class="col-sm-9" style="text-align: center;">
                    <div style="text-align: left; margin-bottom: 30px;">
                        <h2><span style="font-weight: bold;">게시판</span></h2>
                    </div>
	                <form name="paging">
	                	<input type="hidden" name="no"/>
	                	<input type="hidden" name="cPage"/>
	                </form>
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
	                                <td><a href="javascript:boardView(<%=b.getBoard_no()%>)" style="color:black;"><%=b.getTitle() %></a></td>
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
                        <!--<button onclick="location.href='write.html'">글쓰기</button>-->
                        <a href="boardwrite.html" class="hover"><i class="fas fa-edit"></i>글쓰기</a>
                      </div>
                      <div style="background-color: lightgray; position: relative; margin-top: 32px; padding-top: 32px;">
                      	<ul class="pagination justify-content-center">
                            <%=request.getAttribute("pageBar") %>
                        </ul>
                        <div class="formStyle">
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
                                <option value="week">제목만</option>
                                <option value="month">글작성자</option>
                                <option value="halfyear">댓글내용</option>
                                <option value="year">댓글작성자</option>
                            </select>
                            <input type="text" placeholder="검색어를 입력해주세요" size="30">
                            <input type="submit" class="btn btn-primary" value="검색"/>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <script>
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
    	<%-- $.ajax({
    		url:"<%=request.getContextPath()%>/board/boardList",
    		type:"post",
    		data:{"cPage"cPage},
    		success:function(data){
    			console.log(data);
    		},
    		error:function(error){
    			console.log(error);
    		}
    	}) --%>
    }
        //화살표 클릭할때마다 변경하는 로직
        $(function(){
            $("#searchDate").click(function(){
                var url=$("#searchDate").css("background-image");
                //console.log(url);
                if(url.includes('angle-up-solid')){
                    $(this).css("background","url('<%=request.getContextPath()%>/images/angle-down-solid.svg') no-repeat 95% 50%");
                }else{
                    $(this).css("background","url('<%=request.getContextPath()%>/images/angle-up-solid.svg') no-repeat 95% 50%");
                }
            })
            $("#searchDate").blur(function(){
                $(this).css("background","url('<%=request.getContextPath()%>/images/angle-down-solid.svg') no-repeat 95% 50%");
            })
            $("#searchContent").click(function(){
                var url=$("#searchContent").css("background-image");
                //console.log(url);
                if(url.includes('angle-up-solid')){
                    $(this).css("background","url('<%=request.getContextPath()%>/images/angle-down-solid.svg') no-repeat 95% 50%");
                    //console.log($("select").css("background-image"));
                }else{
                    $(this).css("background","url('<%=request.getContextPath()%>/images/angle-up-solid.svg') no-repeat 95% 50%");
                }
            })
            $("#searchContent").blur(function(){
                $(this).css("background","url('<%=request.getContextPath()%>/images/angle-down-solid.svg') no-repeat 95% 50%");
            })
        })
    </script>
<%@include file="/views/common/footer.jsp" %>