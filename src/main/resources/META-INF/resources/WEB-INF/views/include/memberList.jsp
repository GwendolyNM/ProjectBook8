<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div class="container">
	<div class="membercard">
	
		<div class="membercard_text" style="border: 1px;">
			<table class="membercard_info" width=1100px>
				<tr>
					<td width=30px>No</td>
					<td width=30px>아이디</td>
					<td width=70px>비밀번호</td>
					<td width=90px align="center">이름</td>
					<td width=130px>연락처</td>
					<td width=110px>생년월일</td>
					<td width=430px>주소</td>

				</tr>
				<c:forEach var="dto" items="${memberList}">
					<tr>
						<td>${dto.member_idx}</td>
						<td>${dto.member_id}</td>
						<td>${dto.member_pw}</td>
						<td align="center">${dto.member_name}</td>
						<td>${dto.member_phone}</td>
						<td>${dto.member_date}</td>
						<td>${dto.member_address}</td>
						<td width=60px>
						<form:form method="post" name="memberDTO" action="/app/editMember">
						<input type="hidden" name="member_idx" value="${dto.member_idx}">
							<div class="membercard_button">
								<button type="submit" class="btn btn-secondary btn-sm btn-dark">수정</button>
							</div>
						</form:form>
						</td>
						<td width=60px>
						<form:form method="post" name="deleteMemberDTO" action="/app/deleteMember">
						<input type="hidden" name="member_idx" value="${dto.member_idx}">
							<div class="membercard_button">
								<button type="submit" class="btn btn-secondary btn-sm btn-dark">삭제</button>
							</div>
						</form:form>
						</td>
						</tr>
				</c:forEach>
			</table>

		</div>
	</div>

</div>