<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*  
	회원 상세 페이지 (id 컬럼 PK)
	1.권한 검사
	2.id 값 받기 (request.getparameter("id")) >> 한글처리
	3.select id,pwd,name,age,gender,email from koreamember where id=?
	4.id primary key (데이터 1건 보장)
	5.화면 출력 UI 구성
*/	
/*  
1.관리자만 접근 가능한 페이지
2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}

%>
<link href="css/myCss.css" rel="stylesheet">	
<jsp:include page="/common/Top.jsp"></jsp:include>
<body>
				<h3 style="text-align: center;">회원정보</h3>
				<p></p>
				<!--  
				회원리스트 출력
				<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
				</table>
				-->
				<%
				  		String id = request.getParameter("id");
				  
				  		Connection conn = null;
				  		PreparedStatement pstmt = null;
				  		ResultSet rs = null;
				  		
				  		try{
				  			conn = Singleton_Helper.getConnection("oracle");
				  			String sql = "select userId,userPass,userName,userEmail from koreamember2 where userId=?";
				  			pstmt = conn.prepareStatement(sql);
				  			
				  			pstmt.setString(1, id);
				  			
				  			rs = pstmt.executeQuery();
				  			//rs.next(); 추후에 데이터 1건 경우  (while 없이 )
				  			
				  			while(rs.next()){
				  %>
				  			<div class="main">
				  				<div class=nv>
				  					<div class="nv">
				  			 		<span style="width:100px">아이디 : </span>
				  			 		<span style="width:100px"><%= rs.getString("userId") %></span> <br>
				  			 
				  			 		<span style="width:100px">비번 : </span>
				  			 		<span style="width:100px"><%= rs.getString("userPass") %></span> <br>
				  			 
				  			 		<span style="width:100px">이름 : </span>
				  			 		<span style="width:100px"><%= rs.getString("userName") %></span> <br>
				  			 
				  			 		<span style="width:100px">이메일 : </span>
				  			 		<span style="width:100px"><%= rs.getString("userEmail") %></span> <br>
				  			 		</div>
				  			 			<a href="Ex03_Memberlist.jsp">목록가기</a>
				  			 	</div>		
				  			</div> 			
				  		
				  <%				
				  			}
				 
				  		}catch(Exception e){
				  			
				  		}finally{
				  			Singleton_Helper.close(rs);
				  			Singleton_Helper.close(pstmt);
				  		}
				  
				  %>
	
			<jsp:include page="/common/Bottom.jsp"></jsp:include></td>

</body>
</html>