<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*  
	1.한글처리
	2.데이터 받기 (ID ,PWD)
	3.DB연동 (sql문)
	4.로직처리
	
	id ,pwd 를 parameter 받아서 회원인지 아닌지 판단
	
	-판단조건
	1.ID 존재 , PWD(0) > 회원 > Main page 이동  > session.setAttribute("userid",회원ID);
	1.Ex02_JDBC_Main.jsp 
	
	2.ID 존재 , PWD(x) > 다시 한번 로그인 처리 (로그인 페이지)
	2.EX02_JDBC_Login.jsp
	
	3.ID 존재(x) > 다시 한번 로그인 처리 (회원가입 페이지)
	3.Ex02_JDBC_JoinForm.jsp 
	
	
	 사용자가 입력한 ID , PWD 알고있고
	>select id , pwd from kostamember where id=?
			
	//1. 결과 없는 경우 , 2. single row , 3. multi row 모두 만족하는 코드
	if(rs.next()) {
			 do {
					 System.out.println(rs.getInt(1)+"/"+rs.getString(2)+"/"+rs.getString(3));
			 }while(rs.next());
	 
	}else {
			 //회원이 아닌 경우 (Ex02_JDBC_JoinForm.jsp )
		  }		
			
	
	기능적 요구사항
	
	비기능적 요구사항이 있다면 : singleton
*/
	request.setCharacterEncoding("UTF-8");
	

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//Class.forName("oracle.jdbc.OracleDriver"); tomcat 6.0 생략 가능
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
		//비기능적 요구사항
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id, pwd from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery(); 
		
		//업무
		while(rs.next()){
			//데이터가 있다 (id가 존재)
			
			//ID 존재
			if(pwd.equals(rs.getString("pwd"))){
			  //ID 존재 , PWD(0) 
			  //정상회원
			  
			  //Top.jsp 정보 로그인 상태 ...
			  session.setAttribute("userid", rs.getString("id"));
			  
			  //이동처리
			  response.sendRedirect("Ex02_JDBC_Main.jsp");
			}else{
				//ID 존재 , PWD(x)
				out.print("<script>");
					out.print("location.href='Ex02_JDBC_Login.jsp'");
				out.print("</script>");
			}
		}
		//while 타지 않는 경우
		out.print("<script>");
			out.print("location.href='Ex02_JDBC_JoinForm.jsp'");
		out.print("</script>");
		
		
		//
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	} 
	
%>    














