<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
     */
	request.setCharacterEncoding("UTF-8");

%>    
<jsp:include page="/common/Top.jsp"></jsp:include>
<link href="css/myCss.css" rel="stylesheet">	
</head>
<body>
<!--  html 파일  action="MemoServlet"  -->

 <div class="main"> 
 	<div class="nv">
 		<form name="f" action="Memoservlet.jsp" method="get"> 
 				<div>
 				<span style="text-align: left;">게시물 작성</span><div class=boardbt><input type="submit" value="등록""></div>
 				</div>
 				<hr>
 				<div class="regidiv">
                <input type="text" name="title" maxlength="10" placeholder="제목을 입력해 주세요."> 
  				
        		<p></p>
     			</div>
     			<div class="write">
                <input name="contents" class="box2" placeholder="내용을 입력하세요."></input> 
                <hr>
     			</div>
               
              
  				<a href="MemoList">목록보기</a> 
				<jsp:include page="/common/Bottom.jsp"></jsp:include>
		</form>
  	</div>
 </div>

<hr>

</body>
</html>



