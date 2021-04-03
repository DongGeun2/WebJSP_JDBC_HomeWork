<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/myCss.css" rel="stylesheet">	
<jsp:include page="/common/Top.jsp"></jsp:include>
<body id="joinform">
			<div class="main">
			<div class="nv">
				<form action="Ex02_JDBC_loginok.jsp" method="post" name="loginForm" id="joinForm">
					<h3 style="text-align: center;">Login Page</h3>
					<p></p>
						<div class="Login regidiv">
						<input type="text" name="id" id="id" placeholder="아이디"> <br>
						</div>
						<div class="Login" style="margin-top:10px">
						<input type="password" name="pwd" id="pwd" placeholder="비밀번호"> <br>
						</div>
						<div class="Login">
						<p></p>
						<input type="submit" value="로그인" class="button"> 
						</div>
				</form>
			</div>	
		</div>
		<jsp:include page="/common/Bottom.jsp"></jsp:include>

</body>
</html>