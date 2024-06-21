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
			<form:form method="post" modelAttribute="editMember" name="EditMemberSave" action="/app/memberList" align="center">
			<c:forEach var="dto" items="${getMember}">
				<tr>
					<td> 회원번호 </td><td><input type="text" value="${dto.member_idx}" readonly /></td>
					<br>
					<td> 아이디 </td><td><input type="text" value="${dto.member_id}" readonly /></td>
					<br>
					<td> 비밀번호 </td><td><input type="text" value="${dto.member_pw}" readonly /></td>
					<br>
					<td> 회원이름 </td><td><input type="text"	value="${dto.member_name}" /></td>
					<br>
					<td> 연락처 </td><td><input type="text" value="${dto.member_phone}"></td>
					<br>
					<td> 가입일자 </td><td><input type="text" value="${dto.member_date}" /></td>
					<br>
					<td> 회원주소 </td><td><input type="text" value="${dto.member_address}" /></td>
					<br>
				</tr>
			</c:forEach>
			<input type="hidden" name="member_idx" value="${dto.member_idx}"  action="editMemberSave" />
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
