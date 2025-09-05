<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List" %>
<%@ page import="rusioutlook.Detial" %>
<%@ page import="rusioutlook.fileDAO" %>
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

	<%
	Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
	if (isAdmin == null || !isAdmin) {
		response.sendRedirect("adminlogin.jsp");
		return;
	}
	%>

	<div class="back-btn" id="exitFullscreenBtn">
		<i class="fa-solid fa-arrow-left"></i>
	</div>

	<section>
		<div class="nav-bar">
			<img alt="" src="image/rusilogo-removebg-preview.png"> <i
				onclick="toggleSidebar()" class="fa-solid fa-bars" id="menu"></i>
		</div>
		<div class="side-nav" id="sideNav">
			<ul>
				<a href="index.jsp"><li id="photo-navigate">Home</li></a>

			</ul>
		</div>
	</section>
	
	
	<section class="msg-section">
	
	<%
	List<Detial> detial = fileDAO.getMessageDetial();
	for (Detial msg : detial) {
	%>
		
		<div class="detials-msg">
			<p class="date-in-msg"><%=msg.getDate() %></p>
			<p>Id         :<%=msg.getId() %></p>
			<p>Name: <%=msg.getName() %></p>
			<p>Mobile No:<%=msg.getMobile() %></p>
			<p>State:<%=msg.getState() %></p>
			<p>District:<%=msg.getDistrict() %></p>
			<p>Address:<%=msg.getAddress() %></p>
			<p>Message:<%=msg.getMessage() %></p>
		</div>
		
	<% }%>	
		
	</section>
	
	
	<script src="js/script.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>