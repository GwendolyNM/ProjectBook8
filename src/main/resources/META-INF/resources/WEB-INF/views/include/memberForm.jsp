<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src = "js/memberForm.js"></script>

<div class="TodoApp">
	<div class="container">
		<form:form method="post" modelAttribute="memberDTO" class="login-form flex-c">
			<div class="input-box flex-sb">
				<form:input type="text" class="form-control" path="member_id" placeholder="아이디"/>
				<form:errors path="member_id" cssClass="text-warning" />
				<button type="button" class="btn btn-dark btn-normal" id="idDupulicatedcheck">중복확인</button>
				<span id="idcheck"></span>
			</div>
			<div class="input-box">
				<form:input name="member_pw" class="member_pw form-control" id="member_pw" type="password" path="member_pw" placeholder="비밀번호"/>
				<form:errors path="member_pw" cssClass="text-warning" />
				<input type="password"	class="member_pw2 form-control" name="member_pw2" id="member_pw2" placeholder="비밀번호확인"/> 
				<span id="pwdcheck" class=""></span>
			</div>

			<div class="input-box">
				<form:input type="text" class="form-control" path="member_name" placeholder="이름"/>
				<form:errors path="member_name" cssClass="text-warning" />
			</div>
			<div class="input-box flex-sb">
				<div class="flex-c">
					<select name="member_phone1" class="form-control" id="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
					</select>
				</div>
				<div class="input-phone">
					<form:input type="text" path="member_phone2"  name="member_phone2" id="member_phone2" class="form-control" placeholder="0000" maxlength="4" /> 
					<form:errors path="member_phone2" cssClass="text-warning" />
				</div>
				<div class="input-phone">
					<form:input type="text" path="member_phone3" name="member_phone3" id="member_phone3" class="form-control" placeholder="0000" maxlength="4" />
					<form:errors path="member_phone3" cssClass="text-warning" />
				</div>
			</div>
			<div class="input-box flex-c">
				<label for="sample4_postcode" class="visually-hidden" name="addressPost">post</label> 
				<input type="hidden" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호" readonly>
				<label for="sample4_roadAddress" class="visually-hidden" name="addr1">도로명주소</label> 
				<input type="text" name="member_addressRoad" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" readonly>
				<button type="button" class="btn btn-dark btn-normal" onclick="sample4_execDaumPostcode()">주소찾기</button>
			</div>
			<div class="input-box">
				<input type="text" class="form-control" name="member_addressDetail" placeholder="상세주소"/>
			</div>
			<div class="input-box">
				<button name="login" class="btn btn-dark btn-submit">회원가입</button>
			</div>
		</form:form>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>