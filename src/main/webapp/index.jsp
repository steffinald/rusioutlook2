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
	fileDAO dao =new  fileDAO();
    images = dao.getImageFiles();   // directly calling DAO
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
	fileDAO dao =new  fileDAO();
    videos = dao.getVideoFiles();   // directly calling DAO
} catch (Exception e) {
    e.printStackTrace();
}

if (videos != null && !videos.isEmpty()) {
    for (String vid : videos) {
%>
		<div class="video-card" id="videoCard">
			<video class="myVideo" >
				<source src="DownloadServlet?file=<%= vid %>" type="video/mp4">
				Your browser does not support the video tag.
			</video>
		</div>
		<%
    }
}
%>
		
		
		
		
		
		

	</section>
	
	
	<section class="contact-section" id="contact-sec">
		<div class="contact-part">
			<form method="post" action="contact" class="contact-form" >
				<h1>Contact us</h1>
				<label>Name</label>
				<input type="text" placeholder="Enter your name" name="name" required>
				<label>Mobile number</label>
				<input type="number" name="mobile" placeholder="eg:7418029374" maxlength=10 pattern="\d{10}" required>
				<label>State</label>
				<input type="text" name="state" placeholder="Enter your State" required>
				<label>District</label>
				<input type="text" name="dist" placeholder="Enter your district" required>
				<label>address</label>
				<input type="text" name="address" placeholder="Enter your Address" required>
				<label>Message</label>
				<textarea rows="6" cols="" name="message" placeholder="Enter a Message" required></textarea>
				<button type="submit">send message</button>
			</form>
		</div>
	</section>
	
<%
			String status = request.getParameter("status");
			%>
			<%
			if ("success".equals(status)) {
			%>
			<div id="popup"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #4CAF50; color: white; padding: 15px; border-radius: 5px;">
				✅ Message Send successfully!</div>
			<%
			} else if ("error".equals(status)){
			%>
			<div id="popup"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #f44336; color: white; padding: 15px; border-radius: 5px;">
				❌ Failed to Send Message	!</div>
			<%
			}
			%>
			
			<script>
setTimeout(() => {
    const popup = document.getElementById("popup");
    if (popup) popup.style.display = "none";
}, 2000);
</script>
	
	<div class="footbox2">
            <a href="adminlogin.jsp "><i class="fa-solid fa-screwdriver-wrench"></i></a>
        </div>
	
<script src="js/script.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>