<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RUSI</title>
<link rel="image" type="image/png"
	href="image/rusilogo-removebg-preview.png">
<link rel="stylesheet"
	href="css/style.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">
</head>
<body>

<div class="back-btn" id="exitFullscreenBtn">
	<i class="fa-solid fa-arrow-left" ></i>
</div>

	<section>
		<div class="nav-bar">
			<img alt="" src="image/rusilogo-removebg-preview.png"> 
			<i onclick="toggleSidebar()" class="fa-solid fa-bars" id="menu"></i>
		</div>
		<div class="side-nav" id="sideNav"> 
			<ul>
				<a href="index.jsp"><li id="photo-navigate">Home</li></a>
				
			</ul>
		</div>
	</section>


	<section class="lo">
		<div class="login-container">
			<form method="post" action="adminlogin" class="login-form">
				<h2>Admin Login</h2>
				<label>Password</label> <input name="password" type="text"
					placeholder="Enter Password" required />
				<button type="submit" value="login">submit</button>
			</form>
		</div>
	</section>


<script src="js/script.js?v=<%= System.currentTimeMillis() %>"></script>
</body>
</html>