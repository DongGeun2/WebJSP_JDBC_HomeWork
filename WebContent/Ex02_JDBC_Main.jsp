<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/common/Top.jsp"></jsp:include>
<body>
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td style="width: 700px">
				<!-- MAIN PAGE CONTENT  -->
				<%
					String id = null;
					id = (String)session.getAttribute("userid");
					
					if(id != null){
						//회원
						out.print(id + " 회원님 로그인<br>");
						if(id.equals("admin")){
							out.print("<a href='Ex03_Memberlist.jsp'>회원관리</a>");
						}
					}else{
						//로그인 하지 않은 사용자
						//메인 페이지는 회원만 볼수 있어요 (강제 링크 추가)
						out.print("사이트 방문을 환영합니다 ^^ <br>회원가입 하세요!!!!");
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>

<!-- 
CREATE  TABLE koreamember2( 
	userId VARCHAR2(50) PRIMARY KEY ,
    userName VARCHAR2(50) NOT NULL,
    userPass VARCHAR2(50) NOT NULL,
    userEmail VARCHAR2(50) NOT NULL,
    userSsn CHAR(15) NOT NULL,
    userZipCode VARCHAR2(100) NOT NULL,
    userPhone VARCHAR2(50) NOT NULL,
    ip   VARCHAR2(50)
);
 -->