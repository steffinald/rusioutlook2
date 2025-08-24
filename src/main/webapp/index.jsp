<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*" %>
	<%@ page import="java.util.List" %>
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
				<a><li id="photo-navigate" class="nav-link">photos</li></a>
				<a><li id="video-navigate" class="nav-link">videos</li></a>
				<a><li id="contact-navigate" class="nav-link">contact us</li></a>
			</ul>
		</div>
	</section>
	<section class="photo" id="photo-sec">
	
	
<%
List<String> images = null;
try {
	 fileDAO fileDAO = new fileDAO();
    images = fileDAO.getImageFiles();   // directly calling DAO
} catch (Exception e) {
    e.printStackTrace();
}

if (images != null && !images.isEmpty()) {
    for (String img : images) {
%>
        <div class="photo-card">
            <img class="myphoto" src="DownloadServlet?file=<%= img %>">
        </div>
<%
    }
}
%>
	
	</section>

	<section class="video" id="video-sec">
	
		<%
List<String> videos = null;
try {
	 fileDAO fileJDBC = new fileDAO();
    videos = fileJDBC.getVideoFiles();   // directly calling DAO
} catch (Exception e) {
    e.printStackTrace();
}

if (videos != null && !videos.isEmpty()) {
    for (String vid : videos) {
%>
		<div class="video-card" id="videoCard">
			<video class="myVideo" controls>
				<source src="DownloadServlet?file=<%= vid %>" type="video/mp4">
				Your browser does not support the video tag.
			</video>
		</div>
		<%
    }
}
%>
		
		
		
		
		
		
		<div class="video-card" id="videoCard">
			<video class="myVideo" controls>
				<source src="playvideo?file=vid2.mp4" type="video/mp4">
				Your browser does not support the video tag.
			</video>
		</div>
		<div class="video-card" id="videoCard">
			<video class="myVideo" controls>
				<source src="playvideo?file=vid3.mp4" type="video/mp4">
				Your browser does not support the video tag.
			</video>
		</div>
		<div class="video-card" id="videoCard">
			<video class="myVideo"  controls>
				<source src="playvideo?file=trishavid.mp4" type="video/mp4">
				Your browser does not support the video tag.
			</video>
		</div>
		<div class="video-card" id="videoCard">
			<video class="myVideo" controls>
				<source src="playvideo?file=vid3.mp4" type="video/mp4">
				Your browser does not support the video tag.
			</video>
		</div>
		

	</section>
	
	
	<section class="contact-section" id="contact-sec">
		<div class="contact-part">
			<form action="contact" class="contact-form">
				<h1>Contact us</h1>
				<label>Name</label>
				<input type="text" placeholder="Enter your name">
				<label>Mobile number</label>
				<input type="number" placeholder="eg:7418029374" required">
				<label>State</label>
				<input type="text" placeholder="Enter your State">
				<label>District</label>
				<input type="text" placeholder="Enter your district">
				<label>address</label>
				<input type="text" placeholder="Enter your Address">
				<label>Message</label>
				<textarea rows="6" cols="" placeholder="Enter a Message"></textarea>
				<button type="submit">send message</button>
			</form>
		</div>
	</section>
	
	
	<div class="footbox2">
            <a href="adminlogin.jsp "><i class="fa-solid fa-screwdriver-wrench"></i></a>
        </div>
	
<script src="js/script.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>