<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ include file="/views/admin/adminHeader.jsp" %>
<div class="row">
  <form action="" class="form-group col" name="frm1">
    <h3>개설강좌 목록</h3>
    <table class="table">
          <thead class="text-center">
            <tr>
              <th><input type="checkbox" id="classSelect" onclick="check_class_toggle();"></th>
              <th>등록 번호</th>
              <th>개설자</th>
              <th>강좌명</th>
              <th>등록일</th>
              <th>강좌 폐강</th>
            </tr>
          </thead>
          <tbody class="text-center">
            <tr>
                <td class=""><input type="checkbox"></td>
                <td class="">1</td>
                <td class="">유병승</td>
                <td class="">JavaScript 강의</td>
                <td class="">
                  <div class="form-check-inline">
                     2020-02-22
                  </div>                        
                </td>
                <td class="">
                  <div class="form-check-inline">
                    <label class="form-check-label">
                      <button type="button" class="form-check-input btn btn-primary btn-sm">전송</button>
                    </label>
                  </div>
                </td>
            </tr>      
            <tr>
                <td class=""><input type="checkbox"></td>
                <td class="">2</td>
                <td class="">마경호</td>
                <td class="">jQuery 강의</td>
                <td class="">
                  <div class="form-check-inline">
                     2020-02-22
                  </div>                        
                </td>
                <td class="">
                  <div class="form-check-inline">
                    <label class="form-check-label">
                      <button type="button" class="form-check-input btn btn-primary btn-sm">전송</button>
                    </label>
                  </div>
                </td>
            </tr>      
            <tr>
                <td class=""><input type="checkbox"></td>
                <td class="">3</td>
                <td class="">한지현</td>
                <td class="">JSP 강의</td>
                <td class="">
                  <div class="form-check-inline">
                     2020-02-22
                  </div>                        
                </td>
                <td class="">
                  <div class="form-check-inline">
                    <label class="form-check-label">
                      <button type="button" class="form-check-input btn btn-primary btn-sm">전송</button>
                    </label>
                  </div>
                </td>
            </tr>      
          </tbody>
      </table>
    </form>
</div>
<%@ include file="/views/admin/adminFooter.jsp" %>