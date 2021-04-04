<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/Top.jsp"></jsp:include>
<link href="css/myCss.css" rel="stylesheet">	
</head>
<body> 
	<div class="main">
		<div class="nv">
			<span style="text-align: left;">게시판</span><div class=boardbt><a href='memowrite.jsp'>글쓰기</a></div>
			<p></p>
			<br>
			<div class="Login">
			<span>제목</span> <span>내용</span> <span>작성자</span>
			</div>
			<hr>
<%
	/* if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
     */
	request.setCharacterEncoding("UTF-8");

try { 
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = null;
    PreparedStatement ps = null;
    conn = DriverManager.getConnection("jdbc:oracle:thin:@ehdrms519.iptime.org:1521:XE","bituser","1004");
      
       String sql="select * from koreaboard"; 
       ps = conn.prepareStatement(sql); 
        
       ResultSet rs = ps.executeQuery(); 
       
       while(rs.next()){//------------------------- 
           String id = rs.getString("userid"); 
           String title = rs.getString("title"); 
           String content = rs.getString("contents"); 
            
           out.println("<div class='Login'>"); 
           out.println("<span>"+title+"</span>"); // 제목
           out.println("<span>"+content+"</span>"); // 내용 
           out.println("<span>"+id+"</span>"); //작성자 
           out.println("<hr>");
       }//while-------------------------------------         
     	  out.println("</div>"); 
	%>


           		           		
           		
				<jsp:include page="/common/Bottom.jsp"></jsp:include>

	</div>	
	</div>
   

<hr>

</body>
</html>

<%
       rs.close(); 
       ps.close(); 
       conn.close(); 
        
   } catch (Exception e) { 
        
       out.println("<font color=red> 오류 : "); 
       out.println(e.getMessage()+"<br/>"); 
       out.println("</font>"); 
   } 
    
   out.close(); 
%>


