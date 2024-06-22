<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div class="container">
	<div class="membercard">
		<div class="membercard-top">
			<p>BookProject Members</p>
		</div>
		<div class="membercard_text flex-c" style="border: 1px;">
			<table class="membercard_info">
				<tr class="table-column">
					<td width=30px class="">No</td>
					<td width=100px class="">아이디</td>
					<td width=100px align="">이름</td>
					<td width=150px class="">연락처</td>
					<td width=120px class="">가입일</td>
					<td>주소</td>
					<td width=130px class="">관리</td>
				</tr>
				<c:forEach var="dto" items="${memberList}">
					<tr class="table-row">
						<td class="text-c">${dto.member_idx}</td>
						<td class="text-c">${dto.member_id}</td>
						<td class="text-c">${dto.member_name}</td>
						<td class="text-c">${dto.member_phone1}-${dto.member_phone2}-${dto.member_phone3}</td>
						<td class="text-c">${dto.member_date}</td>
						<td>${dto.member_addressRoad} ${dto.member_addressDetail}</td>
						<td class="flex-c td-btn" >
							<div class="flex-sa td-btn">
								<form:form method="get" name="memberDTO" action="editMember">
									<input type="hidden" name="member_idx" value="${dto.member_idx}">
									<div class="membercard_button">
										<button type="submit" class="btn btn-dark">수정</button>
									</div>
								</form:form>
								<form:form method="post" name="deleteMemberDTO" action="deleteMember">
									<input type="hidden" name="member_idx" value="${dto.member_idx}">
									<div class="membercard_button">
										<button type="submit" class="btn btn-dark">삭제</button>
									</div>
								</form:form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>