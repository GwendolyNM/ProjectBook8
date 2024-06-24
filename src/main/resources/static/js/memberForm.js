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
	
	//회원가입 시 idcheck
	$("#signupIdcheck").on("click", function() {

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
                mesg = "비밀번호를 입력해주세요";
                $("#pwdcheck").removeClass("pass-arror success").addClass("error");
            } else if (member_pw2 !== "" && member_pw !== member_pw2) {
                mesg = "입력하신 비밀번호와 다릅니다.";
                $("#pwdcheck").removeClass("pass-arror success").addClass("error");
            } else if (member_pw2 !== "" && member_pw === member_pw2) {
                mesg = "입력하신 비밀번호와 일치합니다.";
                $("#pwdcheck").removeClass("pass-arror error").addClass("success");
            }

			$("#pwdcheck").text(mesg);
		});
		
		$("#signupForm").on("submit", function(event) {
		    var member_pw = $("#member_pw").val().trim();
		    var member_pw2 = $("#member_pw2").val().trim();

		    if (member_pw === "" || member_pw2 === "") {
		        alert("비밀번호를 입력해주세요");
		        event.preventDefault(); // 폼 제출을 막음
		        return;
		    }

		    if (member_pw.length < 8) {
		        alert("비밀번호는 8자리 이상이어야 합니다.");
		        event.preventDefault(); // 폼 제출을 막음
		        return;
		    }

		    if (member_pw !== member_pw2) {
		        alert("입력하신 비밀번호와 다릅니다.");
		        event.preventDefault(); // 폼 제출을 막음
		        return;
		    }

		    // 모든 조건을 만족하면 폼이 제출됩니다.
		});



	});//ready
	
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