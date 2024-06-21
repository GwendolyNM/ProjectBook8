  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <h1>개인정보 페이지</h1>
      <form:form>
    <div>
        <label for="member_id">아이디:</label>
        <input type="text" id="member_id" value="${member.member_id}" readonly/>
    </div>
    
        <div>
        <label for="member_name">이름:</label>
         <input type="text"  id="member_name" value="${member.member_name}" />
    </div>
    
    
    <div>
        <label for="member_phone">전화번호:</label>
        <input type="text" id="member_phone1" value="${member.member_phone1}" />
        <input type="text" id="member_phone2" value="${member.member_phone2}" />
        <input type="text" id="member_phone3" value="${member.member_phone3}" />
        	
    </div>
    <br>
    

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
									<input type="text" value="${member.member_addressRoad}"
									name="member_addressRoad" class="form-control" id="sample4_roadAddress"
									placeholder="도로명주소" >
							</div>
							<div class="col-sm-5">
								<label for="sample4_jibunAddress" class="visually-hidden"
									name="addr2">지번주소</label> 
									<input type="text" value="${member.member_addressJibun}"
									name="member_addressJibun" class="form-control" id="sample4_jibunAddress"
									placeholder="지번주소"> <span id="guide"
									style="color: #999"></span>
							</div>
							<div>
							<label id="member_address" for="member_address">상세주소</label> <input
							value="${member.member_addressDetail}" type="text" name="member_addressDetail" />
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