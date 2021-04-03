<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	   <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>
	      수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" name="id" readonly>
	      수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)" name="id" >
	
	*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
	
    request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select userId,userPass,userName,userEmail from koreamember2 where userId=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery(); 
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
%>	
<link href="css/myCss.css" rel="stylesheet">		
<jsp:include page="/common/Top.jsp"></jsp:include>
<body>			
		<div class="main">
			<div class="nv">
				<form action="Ex03_MemberEditok.jsp" method="post">
					<h3 style="text-align: center;">회원정보수정</h3>
						<div class="regidiv">
						<p>아이디</p> 
						<input type="text" name="id" value="<%=rs.getString(1)%>" readonly>
						</div>
						<div class="regidiv">
						<p>비밀번호</p> 
						<input type="text" name="id" value="<%=rs.getString(2)%>" readonly>
						</div>
						<div class="regidiv">
						<p>이름</p> 
						<input type="text" name="name" value="<%=rs.getString(3)%>" style="background-color: yellow">
						</div>
						<div class="regidiv">
						<p>이메일</p> 
						<input type="text" name="email" value="<%=rs.getString(4)%>" style="background-color: yellow">
						</div>
						
						<p></p>
						<input type="submit" value="수정하기" class=button>
						<a href='Ex03_Memberlist.jsp'>리스트이동</a>
		
				</form>
			</div>
			</div>
			<jsp:include page="/common/Bottom.jsp"></jsp:include>
</body>
</html>
<%
	}catch(Exception e){
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}

%>
