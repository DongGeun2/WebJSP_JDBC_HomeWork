<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//권한처리
	
	//한글처리
	
	//데이터 받기 (id, name, age, gender, email)
	
	//update koreamember set name=? , age=? , email=? , gender=?
    //where id=?
    		
    //처리 : Ex03_Memberlist.jsp 이동  		
	if(session.getAttribute("userid") == null || 
	!session.getAttribute("userid").equals("admin")  
	){
	  //다른 페이지 이동
	  out.print("<script>");
	  out.print("location.href='Ex02_JDBC_Login.jsp'");
	  out.print("</script>");
	}
 
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	//out.print(id + " / " + name + " / " + age + " / " + email);
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "update koreamember set name=? , age=? , email=? , gender=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		pstmt.setString(3, email);
		pstmt.setString(4, gender);
		pstmt.setString(5, id);
		int result = pstmt.executeUpdate();
		if(result > 0){
			out.print("<script>");
			out.print("location.href='Ex03_Memberlist.jsp'");
			out.print("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		Singleton_Helper.close(pstmt);
	
	}
%>
 