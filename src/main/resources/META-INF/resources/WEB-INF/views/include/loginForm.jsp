<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class=content-box>
	<form action="auth" method="post" class="">
			<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력하세요">
			<input type="password" class="form-control" name="passwd" id="passwd" placeholder="비밀번호를 입력하세요">
		<button type="submit" class="btn btn-dark">로그인</button>
		<div class="login-other">
			<a href="" class="text-dark">회원가입</a>
			<span>/</span>
			<a href="" class="text-dark">비밀번호찾기</a>
		</div>
	</form>
</div>
