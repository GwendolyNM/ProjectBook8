<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/app/css/common.css">

<div class="TodoApp">
	<div class="container">
		<form class="login-form flex-c" action="editMember" method="post">
			<c:forEach var="member" items="${getMember}">
				<div class="input-box flex-sb">
					<input type="text" name="member_idx"  class="form-control"
						value="${member.member_idx}" readonly />
				</div>
				<div class="input-box flex-sb">
					<input type="text" name="member_id" class="form-control" value="${member.member_id}"
						readonly />
				</div>
				<div class="input-box">
					<input type="text" name="member_name" class="form-control" placeholder="이름"
						value="${member.member_name}" />
				</div>
				<div class="input-box flex-sb">
					<div class="">
						<input type="text" name="member_phone1" id="member_phone2"
							class="form-control" placeholder="0000"
							value="${member.member_phone1}" maxlength="4" />
					</div>
					<div class="input-phone">
						<input type="text" name="member_phone2" id="member_phone2"
							class="form-control" placeholder="0000"
							value="${member.member_phone2}" maxlength="4" />
					</div>
					<div class="input-phone">
						<input type="text" name="member_phone3" id="member_phone3"
							class="form-control" placeholder="0000"
							value="${member.member_phone3}" maxlength="4" />
					</div>
				</div>
				<div class="input-box">
					<input type="text" class="form-control"
						value="${member.member_date}" readonly />
				</div>
				<div class="input-box flex-c">
					<input type="text" name="member_addressRoad" class="form-control"
						id="sample4_roadAddress" placeholder="도로명주소"
						value="${member.member_addressRoad}">
				</div>
				<div class="input-box flex-c">
					<input type="text" value="${member.member_addressJibun}"
						name="member_addressJibun" class="form-control"
						id="sample4_jibunAddress" placeholder="지번주소">
				</div>
				<div class="input-box flex-c">
					<input type="text" class="form-control" name="member_addressDetail"
						placeholder="상세주소" value="${member.member_addressDetail}" />
				</div>
				<div class="input-box">
					<button type="submit" name="editMember" class="btn btn-dark btn-submit">정보수정</button>
				</div>
			</c:forEach>
		</form>
	</div>
</div>
