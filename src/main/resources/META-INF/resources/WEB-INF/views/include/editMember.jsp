<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>

<div class="TodoApp">
	<div class="container">
		<div class="editMember">
			<h1 class="editMemberHead">관리자: 회원수정화면</h1>
			<div class="editMemberInfo">
				<form:form method="post" var="dto"  modelAttribute="memberDTO" action="editMember" >
					<div>
						<label for="member_id">아이디</label>
						<div>${dto.member_id}</div>
					</div>
					<div>
						<label for="member_name">이름</label>
						<div>${dto.member_name}</div>
					</div>
					<div>
						<label for="member_phone">전화번호</label>
						<form:input type="text" path="member_phone" />
						<form:errors path="member_phone" cssClass="text-warning" />
					</div>
					<div>
						<label for="member_date">생년월일</label>
						<div>${dto.member_date}</div>
					</div>
					<div>
						<label for="member_address">주소</label>
						<form:input type="text" path="member_address" />
						<form:errors path="member_address" cssClass="text-warning" />
					</div>
					<div>
						<button type="submit" name="edit" class="btn btn-success m-5">수정</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
