<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <title>3조</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="css/clean-blog.min.css" rel="stylesheet">
	<link href="css/myCss.css" rel="stylesheet">	
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="#">글쓰기</a>
          </li>
			<%
			if (session.getAttribute("userid") != null) {
				if(session.getAttribute("userid").equals("admin")){
					out.print("<li class='nav-item'>");
					out.print("<a href='Ex03_Memberlist.jsp'> 회원관리 </a>");
					out.print("</li>");
				}
				out.print("<li class='nav-item'><a href=''>" + session.getAttribute("userid") + " 로그인 상태 </a></li>");
				out.print("<li class='nav-item'>");
				out.print("<a href='Ex02_JDBC_Logout.jsp'> 로그아웃 </a>");
				out.print("</li>");
			} else {
				out.print("<li class='nav-item'>");
				out.print("<a href='Ex02_JDBC_Login.jsp'> 로그인 </a>");
				out.print("</li>");
				out.print("<li class='nav-item'>");
				out.print("<a href='Ex02_JDBC_JoinForm.jsp'> 회원가입 </a>");
				out.print("</li>");
			}
			
			%>													
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/post-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1><a href="Ex02_JDBC_Main.jsp">3조 !</a></h1>
            <span class="subheading">우리는 3조다</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script src="js/clean-blog.min.js"></script>

</body>

</html>
