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
			
			
			<!-- Thumbnail image -->
    <img class="video-thumb" src="image/order_2.jpg" data-video="p5vdAZlz51Q" />

    <!-- Hidden iframe -->
    <div class="video-container" style="display:none;">
        <iframe class="myVideo"
                width="750" height="1500"
                frameborder="0"
                allow="autoplay; encrypted-media"
                allowfullscreen>
        </iframe>
    </div>
		</div>
		<%
    }
}
%>
<script src="https://www.youtube.com/iframe_api"></script>
<script>
let players = [];

// YouTube API ready
function onYouTubeIframeAPIReady() {
    document.querySelectorAll('.video-container .myVideo').forEach((iframe, index) => {
        players[index] = new YT.Player(iframe, {
            events: {
                'onStateChange': (event) => {
                    if (event.data === YT.PlayerState.PLAYING) {
                        // Pause all other videos
                        players.forEach((p, i) => {
                            if (i !== index && p.pauseVideo) {
                                p.pauseVideo();
                            }
                        });
                    }
                }
            }
        });
    });
}
//Click on thumbnail to show video
document.querySelectorAll('.video-thumb').forEach((img, index) => {
    img.addEventListener('click', () => {
        const videoId = img.getAttribute('data-video');
        const container = img.nextElementSibling; // the hidden iframe container
        const iframe = container.querySelector('.myVideo');
        
        // Show iframe, hide thumbnail
        container.style.display = 'block';
        img.style.display = 'none';
        iframe.classList.add("video-fullscreen");

        // Show back button
        document.getElementById("exitFullscreenBtn").style.display = "block";

        // Initialize YouTube Player if not already
        if (!iframe.player) {
            iframe.player = new YT.Player(iframe, {
                videoId: videoId,
                events: {
                    'onReady': (event) => {
                        event.target.playVideo(); // ✅ autoplay works here
                    },
                    'onStateChange': (event) => {
                        if (event.data === YT.PlayerState.PLAYING) {
                            players.forEach(p => {
                                if (p !== iframe.player) p.pauseVideo();
                            });
                        }
                    }
                }
            });
            players.push(iframe.player);
        } else {
            iframe.player.loadVideoById(videoId);
            iframe.player.playVideo(); // ✅ ensures autoplay
        }
    });
});

// ✅ Exit fullscreen button logic
document.getElementById("exitFullscreenBtn").addEventListener("click", () => {
    const openVideo = document.querySelector(".video-container[style*='display: block']");
    
    if (openVideo) {
        const iframe = openVideo.querySelector("iframe");
        const thumb = openVideo.previousElementSibling;

        // Stop the video safely
        if (iframe.player && typeof iframe.player.stopVideo === "function") {
            iframe.player.stopVideo();
        } else {
            iframe.src = ""; // fallback if not yet initialized
        }

        // Hide iframe, show thumbnail
        openVideo.style.display = "none";
        thumb.style.display = "block";

        // ✅ Hide back button again
        document.getElementById("exitFullscreenBtn").style.display = "none";
    }
});

</script>

		
		
		
		

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