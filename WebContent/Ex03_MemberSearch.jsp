<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
    
	request.setCharacterEncoding("UTF-8");

%>    
<jsp:include page="/common/Top.jsp"></jsp:include>
</head>
<body>
	<table style="width: 900px; height: 500px ;margin-left: auto; margin-right: auto;">
		<tr>
			<td style="width: 700px">
			 <!--  데이터 받아서 UI 구성 -->
			 <%
			 	String name = request.getParameter("search");	
			 
			 	Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			    
				//where ename like '%길동%'
				conn = Singleton_Helper.getConnection("oracle");
				String sql="select userId, userName, userEmail from koreamember2 where userName like ?";
				String sql2 ="select userId, userName, userEmail from koreamember2 where userName like '%"+name+"%'";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+name+'%');
				rs= pstmt.executeQuery();
				int rowcount=0;
				if(rs.next()){
					rowcount += 1; //조회건수
				}
			 %>
				<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
							<tr><th colspan="4">회원리스트</th></tr>
							<%
								if(rowcount > 0){
									pstmt = conn.prepareStatement(sql2); 
									rs = pstmt.executeQuery();
									while(rs.next()){
										String id = rs.getString(1);
										String mname = rs.getString(2);
										String email = rs.getString(3);
							%>
									 <tr>
									 	<td><%=id%></td>
									 	<td><%=mname%></td>
									 	<td><%=email %></td>
									 </tr>
							<%			
									} //end while
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과" + rowcount + "건 조회</b>");
									out.print("</td></tr>");	
								}else{ //조회된 건수가 없는 경우
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과가 없습니다</b>");
									out.print("</td></tr>");	
								}
							%>
				</table>
				<a href="Ex03_Memberlist.jsp">회원 목록 페이지</a>
			<%
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
			%>		
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>