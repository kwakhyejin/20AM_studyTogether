<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ include file="/views/admin/adminHeader.jsp" %>
<div class="row">
          <form action="" class="form-group col">
            <h3>승인요청한 스터디</h3>
            <table class="table">
                <thead class="text-center">
                  <tr>
                    <th>등록 번호</th>
                    <th>개설자</th>
                    <th>스터디명</th>
                    <th>이미지</th>
                    <th>승인 여부</th>
                    <th>전송</th>
                  </tr>
                </thead>
                <tbody class="text-center">
                  <tr>
                      <td>1</td>
                      <td>곽혜진</td>
                      <td>GitHub 스터디</td>
                      <td>
                        <img class="img-thumbnail" style="width:100px;height:100px;" src="http://placehold.it/100x100" alt="">
                      </td>
                      <td>
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="optradio">허용
                            </label>
                        </div>
                        <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">거부
                        </label>
                        </div>
                      </td>
                      <td>
                          <button type="button" class="btn btn-primary btn-sm">전송</button>
                      </td>
                  </tr>      
              </tbody>
            </table>
          </form>
        </div>
<%@ include file="/views/admin/adminFooter.jsp" %>
