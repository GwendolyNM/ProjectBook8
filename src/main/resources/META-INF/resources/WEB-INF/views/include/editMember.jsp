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
				<form:form method="post" modelAttribute="memberDTO" action="editMember" >
					<div>
						<label for="member_idx">회원번호</label>
						<form:input type="text" path="member_idx" />
						<form:errors path="member_idx" cssClass="text-warning" />
					</div>
					<div>
						<label for="member_id">아이디</label>
						<form:input type="text" path="member_id" />
						
						<form:errors path="member_id" cssClass="text-warning" />
						<button type="button" class="btn btn-primary mb-3"
							id="idDupulicatedcheck">아이디중복</button>
					</div>
					<div>
						<label for="member_pw">비밀번호</label>
						<form:input name="member_pw" class="member_pw" id="member_pw"
							type="password" path="member_pw" />
						<form:errors path="member_pw" cssClass="text-warning" />	
					</div>
					<div>
						<label for="member_pw2">비밀번호 확인</label> <input type="password"
							class="member_pw2" name="member_pw2" id="member_pw2" />
					</div>

					<span id="pwdcheck" class="fs-5"></span>


					<div>
						<label for="member_name">이름</label>
						<form:input type="text" path="member_name" />
						<form:errors path="member_name" cssClass="text-warning" />
					</div>

					<div>
						<label for="member_phone">전화번호</label>
						<form:input type="text" path="member_phone" />
						<form:errors path="member_phone" cssClass="text-warning" />
					</div>
					
					<div>
						<label for="member_date">생년월일</label>
						<form:input type="text" path="member_date" />
						<form:errors path="member_date" cssClass="text-warning" />
					</div>

					<div>
						<label for="member_address">주소</label>
						<form:input type="text" path="member_address" />
						<form:errors path="member_address" cssClass="text-warning" />
					</div>

					<div>
						<label for="member_manager">주소</label>
						<form:input type="text" path="member_manager" />
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
