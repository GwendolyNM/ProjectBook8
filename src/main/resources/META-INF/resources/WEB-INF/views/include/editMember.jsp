<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/app/css/common.css">
<div class="TodoApp">
	<div class="container">

		<div class="editMember">
			<h1 class="editMemberhead">회원관리</h1>
			<form:form method="post" modelAttribute="editMember" name="EditMemberSave" align="center">
			<c:forEach var="dto" items="${getMember}">
				<tr>
					<td> 회원번호 </td><td><input type="text" name="member_idx" value="${dto.member_idx}" readonly /></td>
					<br>
					<td> 아이디 </td><td><input type="text" name="member_id" value="${dto.member_id}" readonly /></td>
					<br>
					<td> 비밀번호 </td><td><input type="text" name="member_pw" value="${dto.member_pw}" readonly /></td>
					<br>
					<td> 회원이름 </td><td><input type="text" name="member_name" value="${dto.member_name}" /></td>
					<br>
					<td> 연락처 </td><td><input type="text" name="member_phone1" value="${dto.member_phone1}"></td>
					<br>
					<td> 연락처 </td><td><input type="text" name="member_phone2" value="${dto.member_phone2}"></td>
					<br>
					<td> 연락처 </td><td><input type="text" name="member_phone3" value="${dto.member_phone3}"></td>
					<br>
					<td> 가입일자 </td><td><input type="text" name="member_date" value="${dto.member_date}" readonly/></td>
					<br>
					<td> 도로명 주소 </td><td><input type="text" name="member_addressRoad" value="${dto.member_addressRoad}" /></td>
					<br>
					<td> 지번 주소 </td><td><input type="text" name="member_addressJibun" value="${dto.member_addressJibun}" /></td>
					<br>
					<td> 상세 주소 </td><td><input type="text" name="member_addressDetail" value="${dto.member_addressDetail}" /></td>
					<br>
				</tr>
			</c:forEach>
			<button type="submit" class="btn btn-secondary btn-sm btn-dark">수정</button>
			</form:form>
			<br>
			<div class="membercard_button">
					
				<form:form method="get" name="cancelEditMember" action="memberList">
					<button type="submit" class="btn btn-secondary btn-sm btn-dark">취소</button>
				</form:form>
			</div>

		</div>
	</div>
</div>
