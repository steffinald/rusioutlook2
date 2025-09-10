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
	
	
	<a href="message.jsp"><button class="msg">Messages</button></a>
	
	

	<section class="log" >
		<div class="login-container">
			<form action="UploadServlet" method="post" enctype="multipart/form-data" class="login-form">
				<h2>Upload via media file</h2>
				<label> <input style="width:20px; height:20px;" type="radio" name="mediaType" value="image"
					checked> Image
				</label> <label> <input style="width:20px; height:20px;" type="radio" name="mediaType" value="video">
					Video
				</label>

				<input type="file" name="file" id="fileInput" accept="image/*" required>
				
				<button type="submit">Add</button>
			</form>
		</div>
		<div class="login-container">
			<form action="UploadServletLink" method="post"  class="login-form">
				<h2>Upload via Link</h2>
				<label> <input style="width:20px; height:20px;" type="radio" name="mediaType" value="image"
					checked> Image
				</label> <label> <input style="width:20px; height:20px;" type="radio" name="mediaType" value="video">
					Video
				</label>

				<input type="text" name="link" required>
				
				<button type="submit">Add</button>
			</form>
		</div>
	</section>
	
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		  const radios = document.querySelectorAll('input[name="mediaType"]');
		  const fileInput = document.getElementById('fileInput');

		  radios.forEach(r => r.addEventListener('change', () => {
		    if (document.querySelector('input[name="mediaType"]:checked').value === 'image') {
		      fileInput.setAttribute('accept', 'image/*');
		    } else {
		      fileInput.setAttribute('accept', 'video/*');
		    }
		  }));
		});
</script>

<%
			String status = request.getParameter("status");
			%>
			<%
			if ("success".equals(status)) {
			%>
			<div id="popup"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #4CAF50; color: white; padding: 15px; border-radius: 5px;">
				✅ Uploaded successfully!</div>
			<%
			} else if ("error".equals(status)){
			%>
			<div id="popup"
				style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #f44336; color: white; padding: 15px; border-radius: 5px;">
				❌ Failed to Upload!</div>
			<%
			}
			%>
			
		

			<script>
setTimeout(() => {
    const popup = document.getElementById("popup");
    if (popup) popup.style.display = "none";
}, 2000);
</script>


	<script src="js/script.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>