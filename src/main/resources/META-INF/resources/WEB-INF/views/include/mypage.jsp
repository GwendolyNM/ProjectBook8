<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src = "js/memberForm.js"></script>

<div class="TodoApp">
	<div class="container">
		<form class="login-form flex-c" action="updateMypage" method="post">
			<div class="input-box flex-sb">
				<input type="text" name="member_id" class="form-control" path="member_id" value="${member.member_id}" readonly/>
				<errors path="member_id" cssClass="text-warning" />
			</div>
			<div class="input-box">
				<input type="text" name="member_name"  class="form-control" path="member_name" placeholder="이름" value="${member.member_name}"/>
				<errors path="member_name" cssClass="text-warning" />
			</div>
			<div class="input-box flex-sb">
				<div class="">
					<input type="text" path="member_phone2"  name="member_phone1" id="member_phone2" class="form-control" placeholder="0000" value="${member.member_phone1}" maxlength="4" /> 
					<errors path="member_phone2" cssClass="text-warning" />
				</div>
				<div class="input-phone">
					<input type="text" path="member_phone2"  name="member_phone2" id="member_phone2" class="form-control" placeholder="0000"  value="${member.member_phone2}"maxlength="4" /> 
					<errors path="member_phone2" cssClass="text-warning" />
				</div>
				<div class="input-phone">
					<input type="text" path="member_phone3" name="member_phone3" id="member_phone3" class="form-control" placeholder="0000"  value="${member.member_phone3}"maxlength="4" />
					<errors path="member_phone3" cssClass="text-warning" />
				</div>
			</div>
			<div class="input-box flex-c">
				<label for="sample4_postcode" class="visually-hidden" name="addressPost">post</label> 
				<input type="hidden" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호" readonly>
				<label for="sample4_roadAddress" class="visually-hidden" name="addr1">도로명주소</label> 
				<input type="text" name="member_addressRoad" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" value="${member.member_addressRoad}" readonly>
				<button type="button" class="btn btn-dark btn-normal" onclick="sample4_execDaumPostcode()">주소찾기</button>
			</div>
			<div class="input-box">
				<input type="text" value="${member.member_addressJibun}" name="member_addressJibun" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
				<input type="text" class="form-control" name="member_addressDetail" placeholder="상세주소" value="${member.member_addressDetail}"/>
			</div>
			<div class="input-box flex-sb">
				<button type="submit" class="btn btn-dark btn-submit">정보수정</button>
				<a href="home" class="btn btn-dark btn-submit">취소</a>
			</div>
		</form>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>