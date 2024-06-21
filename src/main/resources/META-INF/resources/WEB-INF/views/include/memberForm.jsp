<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// id 중복 체크
		$("#idDupulicatedcheck").on("click", function() {

			$.ajax({
				method : "get",
				url : "idCheck",
				dataType : 'text',
				data : {
					userid : $("#member_id").val()
				},
				success : function(data, status, xhr) {
					console.log("data:", data);
					console.log("status:", status);
					$("#idCheck").text(data);
					if (data == "사용불가") {
						alert(data)
					} else{
						alert(data)
					}
				

				},
				error : function(xhr, status, error) {
					console.log("error:", error);
				}

			});
		}); //end id 중복 체크

		$("#member_pw, #member_pw2").on("keyup", function() {
			var member_pw = $("#member_pw").val().trim();
			var member_pw2 = $("#member_pw2").val().trim();
			var mesg;

			if (member_pw === "" && member_pw2 === "") {
				// 두 입력 필드가 모두 비어 있으면 메시지 지움
				mesg = "비밀번호를 입력해주세요";
			} else if (member_pw === member_pw2) {
				mesg = "비번 일치";
			} else {
				mesg = "비번 불일치";
			}

			$("#pwdcheck").text(mesg);
		});

	});//ready
</script>

<div class="TodoApp">
	<div class="container">
		<div class="Login">
			<h1 class="loginhead">회원가입화면</h1>
			<div class="signUpForm">
				<form:form method="post" modelAttribute="memberDTO">
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
							class="member_pw2" name="member_pw2" id="member_pw2" /> <span
							id="pwdcheck" class="fs-5"></span>
					</div>

					<div>
						<label for="member_name">이름</label>
						<form:input type="text" path="member_name" />
						<form:errors path="member_name" cssClass="text-warning" />
					</div>

					<div>
						<label for="member_phone1">전화번호</label> <select name="member_phone1"
							class="form-control" id="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
						</select>
						<div>
							<form:input type="text" path="member_phone2"  name="member_phone2" id="member_phone2" class="form-control"
								placeholder="1234" maxlength="4" /> 
								<form:errors path="member_phone2" cssClass="text-warning" />
								
								<form:input type="text" path="member_phone3"
								name="member_phone3" id="member_phone3" class="form-control"
								placeholder="1234" maxlength="4" />
							<form:errors path="member_phone3" cssClass="text-warning" />
						</div>
					</div>

					<div>
						

						<div class="row mb-3">
							<div class="col-auto">
								<label for="sample4_postcode" class="visually-hidden"
									name="addressPost">post</label> <input type="text" name="post"
									class="form-control" id="sample4_postcode" placeholder="우편번호">
							</div>
							<div class="col-auto">
								<button type="button" class="btn btn-primary mb-3"
									onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-5">
								<label for="sample4_roadAddress" class="visually-hidden"
									name="addr1">도로명주소</label> 
									<input type="text"
									name="member_addressRoad" class="form-control" id="sample4_roadAddress"
									placeholder="도로명주소">
							</div>
							<div class="col-sm-5">
								<label for="sample4_jibunAddress" class="visually-hidden"
									name="addr2">지번주소</label> 
									<input type="text"
									name="member_addressJibun" class="form-control" id="sample4_jibunAddress"
									placeholder="지번주소"> <span id="guide"
									style="color: #999"></span>
							</div>
							<div>
							<label id="member_address" for="member_address">상세주소</label> <input
							type="text" name="member_addressDetail" />
							</div>
						</div>
					</div>
					<div>
						<button name="login" class="btn btn-success m-5">submit</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullRoadAddr = data.roadAddress;
						var extraRoadAddr = '';

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>