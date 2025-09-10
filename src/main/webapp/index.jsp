<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="rusioutlook.fileDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RUSI</title>
<link rel="icon" type="image/png"
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

	<div class="back-btn" id="exitFullscreenBtn" style="display: none;">
		<i class="fa-solid fa-arrow-left"></i>
	</div>

	<section>
		<div class="nav-bar">
			<img alt="" src="image/rusilogo-removebg-preview.png"> <i
				onclick="toggleSidebar()" class="fa-solid fa-bars" id="menu"></i>
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
			fileDAO dao = new fileDAO();
			images = dao.getImageFileslink(); // directly calling DAO
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (images != null && !images.isEmpty()) {
			for (String img : images) {
		%>
		<div class="photo-card">
			<img class="myphoto" src="<%=img%>">
		</div>
		<%
		}
		}
		%>

	</section>

	<section class="video" id="video-sec">

<%
List<String> video = null;
try {
	fileDAO dao =new  fileDAO();
    video = dao.getVideoFileslink();   // directly calling DAO
} catch (Exception e) {
    e.printStackTrace();
}

if (video != null && !video.isEmpty()) {
    for (String vid : video) {
%>

		<div class="video-card" id="videoCard">


			<!-- Thumbnail image -->
			<img class="video-thumb"
				src="https://img.youtube.com/vi/<%=vid %>/maxresdefault.jpg"
				onerror="this.src='image/order_2.jpg';" data-video="<%=vid %>">

			<!-- Hidden iframe -->
			<div class="video-container" style="display: none;">
				<iframe id="video_1" class="myVideo" width="750" height="1500"
					src="https://www.youtube.com/embed/<%=vid %>?enablejsapi=1&rel=0"
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
				</iframe>
			</div>
		</div>
<%
		}
		}
		%>

		<!--
<script src="https://www.youtube.com/iframe_api"></script>
<script>
let players = [];

// YouTube API ready/*

// ✅ Click thumbnail to show video
document.querySelectorAll('.video-thumb').forEach((img, index) => {
    img.addEventListener('click', () => {
        const videoId = img.getAttribute('data-video');
        const container = img.nextElementSibling;
        const iframe = container.querySelector('.myVideo');

        // Hide ALL other open videos and reset back button
        document.querySelectorAll('.video-container').forEach(vc => {
            vc.style.display = 'none';
            vc.previousElementSibling.style.display = 'block'; // show thumbnail again
            const ifr = vc.querySelector('iframe');
            if (ifr.player && ifr.player.stopVideo) {
                ifr.player.stopVideo();
            }
        });
        

        // Show this one
        container.style.display = 'block';
        img.style.display = 'none';
        iframe.classList.add("video-fullscreen");
        showBackBtn();

        // Create player if not exists
        if (!iframe.player) {
            const player = new YT.Player(`video_${index}`, {
                videoId: videoId,
                events: {
                    'onReady': (event) => event.target.playVideo(),
                    'onStateChange': (event) => {
                        if (event.data === YT.PlayerState.PLAYING) {
                            players.forEach(p => {
                                if (p !== player) p.pauseVideo();
                            });
                        }
                    }
                }
            });
            players[index] = player;
            iframe.player = player;
        } else {
            iframe.player.loadVideoById(videoId);
            iframe.player.playVideo();
        }
    });
});

// ✅ Exit fullscreen button
document.getElementById("exitFullscreenBtn").addEventListener("click", () => {
    const openVideo = document.querySelector(".video-container[style*='display: block']");
    if (openVideo) {
        const iframe = openVideo.querySelector("iframe");
        const thumb = openVideo.previousElementSibling;

        if (iframe.player && iframe.player.stopVideo) {
            iframe.player.stopVideo();
        }

        openVideo.style.display = "none";
        thumb.style.display = "block";
    }

    // Always hide the button
    hideBackBtn();
});

</script>-->


		<script src="https://www.youtube.com/iframe_api"></script>
		<script>
let players = [];
let currentIndex = null;
let exitButton;

// ✅ Helpers
function viewBackBtn() {
    if (exitButton) exitButton.style.display = "block";
}
function hideBackBtn() {
    if (exitButton) exitButton.style.display = "none";
}
document.addEventListener("DOMContentLoaded", () => {
    exitButton = document.getElementById("exitFullscreenBtn");
    hideBackBtn(); // hidden by default

    // ✅ Click thumbnail to show video
    document.querySelectorAll(".video-thumb").forEach((img, index) => {
        img.addEventListener("click", () => {
            const videoId = img.getAttribute("data-video");
            const container = img.nextElementSibling;
            const iframe = container.querySelector("iframe");

            // Hide all other videos
            document.querySelectorAll(".video-container").forEach(vc => {
                vc.style.display = "none";
                vc.previousElementSibling.style.display = "block";
                const ifr = vc.querySelector("iframe");
                if (ifr.player && ifr.player.stopVideo) {
                    ifr.player.stopVideo();
                }
                ifr.classList.remove("video-fullscreen");
            });

            // Show this video fullscreen
            container.style.display = "block";
            img.style.display = "none";
            iframe.classList.add("video-fullscreen");
            currentIndex = index;
            viewBackBtn();

            // Create YouTube player if not exists
            if (!iframe.player) {
                const player = new YT.Player(iframe.id, {
                    videoId: videoId,
                    events: {
                        onReady: (event) => event.target.playVideo(),
                        onStateChange: (event) => {
                            if (event.data === YT.PlayerState.PLAYING) {
                                players.forEach(p => {
                                    if (p !== event.target) p.pauseVideo();
                                });
                            }
                        }
                    }
                });
                players[index] = player;
                iframe.player = player;
            } else if (iframe.player && typeof iframe.player.loadVideoById === "function") {
                // Only call if the API is ready
                iframe.player.loadVideoById(videoId);
                iframe.player.playVideo();
            }
        });
    });

    // ✅ Toggle play/pause on video click
    document.querySelectorAll(".myVideo").forEach(iframe => {
        iframe.addEventListener("click", () => {
            if (iframe.player) {
                const state = iframe.player.getPlayerState();
                if (state === YT.PlayerState.PLAYING) {
                    iframe.player.pauseVideo();
                } else {
                    iframe.player.playVideo();
                }
            }
        });
    });

    // ✅ Exit fullscreen button
    if (exitButton) {
        exitButton.addEventListener("click", () => {
            const openVideo = document.querySelector(".video-container[style*='display: block']");
            if (openVideo) {
                const iframe = openVideo.querySelector("iframe");
                const thumb = openVideo.previousElementSibling;

                if (iframe.player && iframe.player.stopVideo) {
                    iframe.player.stopVideo();
                }

                openVideo.style.display = "none";
                iframe.classList.remove("video-fullscreen");
                thumb.style.display = "block";
            }

            hideBackBtn();
        });
    }
});
</script>







	</section>


	<section class="contact-section" id="contact-sec">
		<div class="contact-part">
			<form method="post" action="contact" class="contact-form">
				<h1>Contact us</h1>
				<label>Name</label> <input type="text" placeholder="Enter your name"
					name="name" required> <label>Mobile number</label> <input
					type="number" name="mobile" placeholder="eg:7418029374"
					maxlength=15 pattern="\d{10}" required> <label>State</label>
				<input type="text" name="state" placeholder="Enter your State"
					required> <label>District</label> <input type="text"
					name="dist" placeholder="Enter your district" required> <label>address</label>
				<input type="text" name="address" placeholder="Enter your Address"
					required> <label>Message</label>
				<textarea rows="6" cols="" name="message"
					placeholder="Enter a Message" required></textarea>
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
	} else if ("error".equals(status)) {
	%>
	<div id="popup"
		style="position: fixed; z-index: 1000000000; top: 80%; right: 40%; background: #f44336; color: white; padding: 15px; border-radius: 5px;">
		❌ Failed to Send Message !</div>
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
		<a href="adminlogin.jsp "><i
			class="fa-solid fa-screwdriver-wrench"></i></a>
	</div>

	<script src="js/script.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>