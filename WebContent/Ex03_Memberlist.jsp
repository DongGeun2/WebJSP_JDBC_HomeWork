<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*  
	 1.관리자만 접근 가능한 페이지
	 2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
	 3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
	*/
	 if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		//out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		response.sendRedirect("Ex02_JDBC_Login.jsp");
	} 
%>	

<link href="css/myCss.css" rel="stylesheet">	
<jsp:include page="/common/Top.jsp"></jsp:include>
<body>
	<table style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td style="width: 700px">
			<!--  
				회원 목록(리스트) 출력
				목록 (select id, ip from koreamember)
			-->	
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select userId, ip from koreamember2";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
				%>	<h3 style="text-align: center;">회원리스트</h3>
					<p></p>
				<div class="main">
					<div class="nv">
					<table style="width: 100%;height: 100px;margin-left: auto;margin-right: auto;text-align: center ">
							<tr>
								<th>아이디</th>
								<th>IP주소</th>
								<th>회원정보삭제</th>
								<th>회원정보수정</th>
							</tr>
						<% while(rs.next()){ %>
							<tr>
								<td width="120px">
									<a href='Ex03_MemberDetail.jsp?id=<%=rs.getString("userId")%>'><%=rs.getString("userId")%></a>
								</td>
								<td width="90px"><%=rs.getString("ip")%></td>
								<td width="70px">
									<a href="Ex03_MemberDelete.jsp?id=<%=rs.getString("userId")%>">[삭제]</a>
								</td>
								<td width="70px">
									<a href="Ex03_MemberEdit.jsp?id=<%=rs.getString("userId")%>">[수정]</a>
								</td>
							</tr> 
						<% } %>
					</table>
					</div>
				</div>	
					<hr>
					<div class="Login">
						<form action="Ex03_MemberSearch.jsp" method="post">
							회원명:<input type="text" name="search">
							<input type="submit" value="이름검색하기">
						</form>
					</div>					
				<%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
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