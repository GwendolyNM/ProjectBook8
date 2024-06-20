<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	// id 중복 체크
	$("#idDupulicatedcheck").on("click", function(){
		  
		   $.ajax({
             method:"get",
             url:"idCheck",   
             dataType:'text', 
             data:{
          	   userid:$("#member_id").val()
             },
             success:function(data, status, xhr){
                 console.log("data:", data);
                 console.log("status:", status);
                 $("#idCheck").text(data);
                 if(data=="사용불가"){
                	 alert(data)
                	 }
                 
                 
             },
             error:function(xhr, status, error){
                 console.log("error:", error);
             }

         });
	}); //end id 중복 체크

	$("#member_pw, #member_pw2").on("keyup", function() {
	    var member_pw = $("#member_pw").val().trim();
	    var member_pw2 = $("#member_pw2").val().trim();
	    var mesg = "";
	    
	    if (member_pw === "" && member_pw2 === "") {
	        // 두 입력 필드가 모두 비어 있으면 메시지 지움
	        mesg = "";
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
							class="member_pw2" name="member_pw2"  id="member_pw2" />
						<span id="pwdcheck" class="fs-5"></span>
					</div>

					<div>
						<label for="member_name">이름</label>
						<form:input type="text" path="member_name" />
						<form:errors path="member_name" cssClass="text-warning" />
					</div>

					<div>
						<label for="member_phone">전화번호</label>
						  <select name="phone1" class="form-control" id="phone1">
						 <option value="010">010</option>
				 		<option value="011">011</option>
						</select>
						
						<form:input type="text" path="member_phone" />
						<form:errors path="member_phone" cssClass="text-warning" />
						<form:input type="text" path="member_phone" />
						<form:errors path="member_phone" cssClass="text-warning" />
					</div>

					<div>
						<label id="member_address" for="member_address">주소</label>
						<form:input type="text" path="member_address" />
						<form:errors path="member_address" cssClass="text-warning" />
						<div class="row mb-3">
		      <div class="col-auto">
			    <label for="sample4_postcode" class="visually-hidden">post</label>
			    <input type="text" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호">
			  </div>
			  <div class="col-auto">
			    <button type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
  			  </div>
		  </div>
		   <div class="row mb-3">
		      <div class="col-sm-5">
			    <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
			    <input type="text"  name="addr1" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
			  </div>
			 <div class="col-sm-5">
			    <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
			    <input type="text" name="addr2" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
			    <span id="guide" style="color:#999"></span>
			  </div>
		  </div>
					</div>
					<div>
						<button name="login" class="btn btn-success m-5">signup</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
