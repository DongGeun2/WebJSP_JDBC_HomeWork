<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
//1.한글처리
//2.데이터 받기
//3.DB연결
//4.Insert 실행
//5.응답구성
	 	 
		request.setCharacterEncoding("UTF-8");
		
		
		String id = (String)session.getAttribute("userid");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		//out.print(id + "," + email + "," + memo);

		try{
		 Class.forName("oracle.jdbc.OracleDriver");
		 Connection conn =null;
		 PreparedStatement pstmt = null;
		 conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.76:1521:XE","bituser","1004");
		 
		 //out.print("DB연결 : " +conn.isClosed());
		 String sql="insert into koreaboard(userid,title,contents) values(?,?,?)";
		 
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, id);
		 pstmt.setString(2, title);
		 pstmt.setString(3, contents);
		 
		 int n = pstmt.executeUpdate();
		 
		 if(n>0){
		    out.print("<script>");
		   	out.print("alert('등록성공');");
		   	out.print("location.href='memolist.jsp';"); 
		   	//주소창에 입력 enter (F5) 요청
		   	//localhost:8090/WebServlet_3/MemoList
		   	out.print("</script>");
		 }else{ //insert 에서 현실적으로 경우 ...
			    out.print("<script>");
			    out.print("alert('등록실패');");
			    out.print("location.href='memowrite.jsp';");
			    out.print("</script>");
		 }
		 
		 if(pstmt != null) pstmt.close();
		 if(conn != null)  conn.close();
		}catch(Exception e){
		 out.print("<b> 오류 :" +  e.getMessage()  + "</b>");
		 
		} 
		
																
	
%>
