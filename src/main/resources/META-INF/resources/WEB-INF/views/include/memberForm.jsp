<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		$("#member_pw").on("keyup", function() {
			var member_pw = $("#member_pw").val();
			var member_pw2 = $("#member_pw2").val();
			var mesg;
			if (member_pw = member_pw2) {
				mesg = "비번 일치";
			} else {
				mesg = "비번 불일치";
			}
			$("#pwdcheck").text(mesg);
		})

	});//ready
</script>

<div class="TodoApp">
	<div class="container">
		<div class="Login">
			<h1 class="loginhead">회원가입화면</h1>
			<div class="signUpForm">
				<form:form method="post" modelAttribute="memberDTO" action="signup">
					<div>
						<label for="member_id">아이디</label>
						<form:input type="text" path="member_id" />
						<form:errors path="member_id" cssClass="text-warning" />
						<button type="button" class="btn btn-primary mb-3"
							id="idDupulicatedcheck">아이디중복</button>
					</div>
					<div>
						<span id="idcheck"></span>
					</div>
					<div>
						<label for="member_pw">비밀번호</label>
						<form:input name="member_pw" class="member_pw" id="member_pw"
							type="password" path="member_pw" />
						<form:errors path="member_pw" cssClass="text-warning" />
					</div>
					<div>
						<label for="member_pw">비밀번호 확인</label> <input type="password"
							class="member_pw2" name="member_pw2" , id="member_pw2" />
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
						<label for="member_address">주소</label>
						<form:input type="text" path="member_address" />
						<form:errors path="member_address" cssClass="text-warning" />
					</div>
					<div>
						<button name="login" class="btn btn-success m-5">signup</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
