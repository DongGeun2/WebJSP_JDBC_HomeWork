<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
-->
	<link href="css/myCss.css" rel="stylesheet">	
<jsp:include page="/common/Top.jsp"></jsp:include>
<body id="joinform">
	<div class="main">
	<div class ="nv">
	<h3 style="text-align: center;">회원가입</h3>
	<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm"
		id="joinForm">
		<div class="regidiv">
		<p>아이디</p>
		<input type="text" maxlength="20" id="userId" name="userId"
			title="3~16자리의 영문+숫자 조합으로 입력해주세요">
		<p class="tdid"></p>
		</div>
		<div class="regidiv">
		<p>이름</p>
		<input type="text" maxlength="20" id="userName" name="userName"
			title="이름">
		<p class="tdname"></p>
		</div>
		<div class="regidiv">
		<p>비밀번호</p>
		<input type="password" maxlength="16" id="userPass" name="userPass"
			title="8~16자리의 영문+숫자 조합으로 입력해주세요">
		<p class="tdpw"></p>
		</div>
		<div class="regidiv">
		<p>비밀번호 확인</p>	
			<input type="password" maxlength="16" id="userPassCheck"
				name="userPassCheck" title="패스워드 확인">
		<p class="tdpwch"></p>
		</div>
		<div class="regidiv">
		<p>전화번호</p>
		<input type="text" size="30" maxlength="20" id="userPhone"
			name="userPhone" title="'010','-'없이 입력하세요">
		<p class="tdphone"></p>
		</div>
		<div class="regidiv">
		<p>이메일</p>
			<input type="text" maxlength="50" id="userEmail" name="userEmail"
				title="이메일">
		<p class="tdmail"></p>
		</div>
		<div class="jumindiv">
		<p>주민등록번호</p>
		<input type="text" maxlength="6" id="userSsn1" name="userSsn1"
			title="주민번호1"> - <input type="password" maxlength="7"
			id="userSsn2" name="userSsn2" title="주민번호2 ">
		<p class="jumincheck"></p>
		</div>
		<div class="regidiv">
		<p>우편번호</p>
		<input type="text" maxlength="10" id="userZipCode" name="userZipCode" class="userZipCode" title="주소-우편번호" style="width: 30%"> 
		<input style="height: 51px" type="button" value="우편번호검색" id="userZipCodebutton" />
		<p>주소</p>
		<input type="text" maxlength="20" size="45" id="userAddr1" name="userAddr1" title="주소-기본주소"> <br>
		<p>상세주소</p>
		<input type="text" maxlength="20" size="45" id="userAddr2" name="userAddr2" title="주소-상세주소">
		<p class=tdAddr></p>
		</div>
		<input type="button" value="가입완료" class="button">
		
	</form>
	</div>
</div>

	<jsp:include page="/common/Bottom.jsp"></jsp:include>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	// 아이디 체크
	var idcheck = /^([A-Za-z])+([0-9])+$/;
	var idck = false;
	$('#userId').blur(
			function() {
				if (idcheck.test($('#userId').val())
						&& $('#userId').val().length >= 3) {
					$('.tdid').html("");
					idck = true;
				} else {
					$('.tdid').attr("style", "color:red; font-size:3px");
					$('.tdid').html("3~16자리의 영문+숫자 조합으로 입력해주세요");
					idck = false;
				}

			});
	//이름 체크
	var namecheck = /^[가-힣]{2,3}$/;
	var nameck = false;
	$('#userName').blur(function() {
		if (namecheck.test($('#userName').val())) {
			$(".tdname").html("");
			nameck = true;
		} else {
			$('.tdname').attr("style", "color:red; font-size:3px");
			$('.tdname').html("이름을 입력해주세요");
			nameck = false;
		}

	})

	//비밀번호 체크   
	var passwoercheck = /^([A-Za-z])+([0-9])+([~!@#$%^&*()_+|<>?:{}])+$/;
	var passck = false;
	var passck2 = false;
	$('#userPass').blur(
			function() {
				if (passwoercheck.test($('#userPass').val())
						&& $("#userPass").val().length >= 8) {
					console.log("일치" + $('#userPass').val());
					$('.tdpw').html("");
					passck2 = true;
				} else if (!passwoercheck.test($('#userPass').val())) {
					$('.tdpw').attr("style", "color:red; font-size:3px");
					$('.tdpw').html("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
					passck2 = false;

				}
			})

	$('#userPassCheck').blur(
			function() {
				if ($('#userPass').val() == $('#userPassCheck').val()) {
					console.log("일치");
					$('.tdpwch').html("");
					passck = true;
				} else if ($('#userPass').val() != $('#userPassCheck').val()
						&& $('#userPassCheck').val().length >= 3) {
					$('.tdpwch').attr("style", "color:red; font-size:3px");
					$('.tdpwch').html("비밀번호가 일치하지 않습니다.");
					passck = false;
				}
			})
	// 이메일 체크
	var emailcheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	var emailck = false;
	$('#userEmail').blur(function() {
		if (emailcheck.test($('#userEmail').val())) {
			$('.tdmail').html("");
			emailck = true;
		} else {
			$('.tdmail').attr("style", "color:red; font-size:3px");
			$('.tdmail').html("이메일 형식이 맞지 않습니다");
			emailck = false;
		}

	})
	// 주민번호 체크
	var jumincheck1 = /^([0-9]){6}$/;
	var jumincheck2 = /^([1-4])+([0-9]){6}$/;
	var jumincheck = false;
	$('#userSsn2').blur(
			function() {
				if (jumincheck1.test($('#userSsn1').val())
						&& jumincheck2.test($('#userSsn2').val())) {
					$('.jumincheck').html("");
					jumincheck = true;
				} else {
					$('.jumincheck').attr("style", "color:red; font-size:3px");
					$('.jumincheck').html("형식이 맞지 않습니다");
					jumincheck = false;
				}

			})

	// 우편번호 체크 
	var zipcodecheck = false;
	$('#userZipCodebutton').click(function() {
		window.open('popup.html', '우편번호검색', 'width=500,height=500,menubar=no');

	})

	$('#userAddr2').focus(function() {
		if ($('#userAddr2').val() == "") {
			$('.tdAddr').attr("style", "color:red; font-size:3px");
			$('.tdAddr').html("주소를 채워주세요");
			zipcodecheck = false;
		} else {
			$('.tdAddr').html("");
			zipcodecheck = true;
		}
	})
	$('#userAddr2').blur(function() {
		if ($('#userAddr2').val() == "") {
			$('.tdAddr').attr("style", "color:red; font-size:3px");
			$('.tdAddr').html("주소를 채워주세요");
			zipcodecheck = false;
		} else {
			$('.tdAddr').html("");
			zipcodecheck = true;
		}
	})

	//핸드폰번호 체크
	var phonNumberCheck = /^01[0179][0-9]{7,8}$/;
	var phoneCheck = false;

	$('#userPhone').blur(function() {
		if (phonNumberCheck.test($('#userPhone').val())) {
			$('.tdphone').html("");
			phoneCheck = true;
		} else {
			$('.tdphone').attr("style", "color:red; font-size:3px");
			$('.tdphone').text("'010','-'없이 입력하세요");
			phoneCheck = false;
		}
	});

	// 버튼 선택 
	$('.button').click(
			function() {
				if (idck == false || nameck == false || passck == false
						|| emailck == false || jumincheck == false
						|| zipcodecheck == false || phoneCheck == false
						|| passck2 == false) {
					alert("빈칸을 모두 채워주세요.");
					return;
				} else {
					var cek = confirm("가입하시겠습니까?");
					if(eck == true){
						$('#joinForm').submit();
					}else{
						return;
					}

				}
			})
</script>

</html>