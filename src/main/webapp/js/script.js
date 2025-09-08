

function toggleSidebar() {
    let sidebar = document.getElementById("sideNav")
    let menuIcon = document.getElementById("menu");

    sidebar.classList.toggle("open");  // show/hide sidebar
    menuIcon.classList.toggle("rotate"); // rotate icon
}
document.querySelectorAll('#sideNav .nav-link').forEach(link => {
    link.addEventListener('click', () => {
        document.getElementById("sideNav").classList.remove("open");
        document.getElementById("menu").classList.remove("rotate");
    });
});




/*video part*//*
document.addEventListener('DOMContentLoaded', function () {
    let startX, startY;
    let currentIndex = 0;
    const videos = document.querySelectorAll('.video-card');
    const exitButton = document.getElementById('exitFullscreenBtn');

    const updateButtonVisibility = () => {
        // Show button only if any video is fullscreen
        const isAnyFullscreen = document.querySelector('.video-fullscreen') !== null;
        if (exitButton) {
            exitButton.style.display = isAnyFullscreen ? 'block' : 'none';
        }
    };

    const bindVideoEvents = (video, card, index) => {
        const toggleVideo = (e) => {
            e.preventDefault();

            const isFullscreen = card.classList.contains('video-fullscreen');

            if (!isFullscreen) {
                videos.forEach(c => {
                    c.classList.remove('video-fullscreen');
                    const otherVideo = c.querySelector('.myVideo');
                    if (otherVideo) otherVideo.pause();
                });

                card.classList.add('video-fullscreen');
                video.play();
                currentIndex = index;
            } else {
                if (video.paused) {
                    video.play();
                } else {
                    video.pause();
                }
            }

            updateButtonVisibility();
        };

        video.addEventListener('click', toggleVideo);
        video.addEventListener('touchend', toggleVideo, { passive: false });
    };

    videos.forEach((card, index) => {
        const video = card.querySelector('.myVideo');
        if (!video) return;

        //video.removeAttribute('controls');
        bindVideoEvents(video, card, index);
    });

    document.addEventListener('touchstart', function (e) {
        startX = e.touches[0].clientX;
        startY = e.touches[0].clientY;
    }, false);

    document.addEventListener('touchend', function (e) {
		const fullscreenCard = document.querySelector('.video-fullscreen');
		    const isFullscreen = fullscreenCard !== null;
        let endX = e.changedTouches[0].clientX;
        let endY = e.changedTouches[0].clientY;

        let diffX = startX - endX;
        let diffY = startY - endY;
		
		if(isFullscreen){
			console.log("swipe in process");
        if (Math.abs(diffX) > Math.abs(diffY) && diffX > 50) {
            let nextIndex = (currentIndex + 1) % videos.length;
            showVideo(nextIndex);
        } else if (Math.abs(diffX) > Math.abs(diffY) && diffX < -50) {
            let prevIndex = (currentIndex - 1 + videos.length) % videos.length;
            showVideo(prevIndex);
        } else if (Math.abs(diffY) > Math.abs(diffX) && diffY < -50) {
            exitFullscreen();
        }
		}else{
			console.log("it returns");
			return;
		}
    }, false);

    function showVideo(index) {
        videos.forEach((v, i) => {
            v.classList.toggle('video-fullscreen', i === index);
            const vid = v.querySelector('.myVideo');
            if (vid) {
                if (i === index) vid.play();
                else vid.pause();
            }
        });
        currentIndex = index;
        updateButtonVisibility();
    }

    function exitFullscreen() {
        videos.forEach(v => {
            v.classList.remove('video-fullscreen');
            const vid = v.querySelector('.myVideo');
            if (vid) vid.pause();
        });
        updateButtonVisibility();
    }

    if (exitButton) {
        exitButton.addEventListener('click', exitFullscreen);
        exitButton.style.display = 'none'; // Hide by default
    }
});
*/

//photo part

document.addEventListener('DOMContentLoaded', function () {
    const photoItems = Array.from(document.querySelectorAll('.photo-card'));
    const exitButton = document.getElementById('exitFullscreenBtn');

    let photoIndex = -1;
    let touchStartX = 0;
    let touchStartY = 0;

    const updateButtonVisibility = () => {
        const isAnyFullscreen =
            document.querySelector('.video-fullscreen') !== null ||
            document.querySelector('.photo-fullscreen') !== null;

        if (exitButton) {
            exitButton.style.display = isAnyFullscreen ? 'block' : 'none';
        }
    };

    function openPhotoFullscreen(index) {
        if (index < 0 || index >= photoItems.length) return;

        // Remove fullscreen from any other image first
        photoItems.forEach(img => img.classList.remove('photo-fullscreen'));

        photoIndex = index;
        photoItems[index].classList.add('photo-fullscreen');
        updateButtonVisibility();
    }

    function closePhotoFullscreen() {
        photoItems.forEach(img => img.classList.remove('photo-fullscreen'));
        photoIndex = -1;
        updateButtonVisibility();
    }

    function showNextPhoto() {
        if (photoItems.length === 0) return;
        let nextIndex = (photoIndex + 1) % photoItems.length;
        openPhotoFullscreen(nextIndex);
    }

    function showPrevPhoto() {
        if (photoItems.length === 0) return;
        let prevIndex = (photoIndex - 1 + photoItems.length) % photoItems.length;
        openPhotoFullscreen(prevIndex);
    }

    // Click event to open fullscreen
    photoItems.forEach((img, index) => {
        img.addEventListener('click', () => {
            openPhotoFullscreen(index);
        });
    });

    // Exit fullscreen
    if (exitButton) {
        exitButton.addEventListener('click', closePhotoFullscreen);
    }

    // Swipe detection (applied on document since fullscreen is class on img)
    document.addEventListener(
        'touchstart',
        (e) => {
            touchStartX = e.touches[0].clientX;
            touchStartY = e.touches[0].clientY;
        },
        { passive: true }
    );

    document.addEventListener(
        'touchend',
        (e) => {
            let dx = e.changedTouches[0].clientX - touchStartX;
            let dy = e.changedTouches[0].clientY - touchStartY;

            if (photoIndex !== -1) {
                if (Math.abs(dx) > 50 && Math.abs(dy) < 50) {
                    if (dx < 0) showNextPhoto(); // Swipe left
                    else showPrevPhoto(); // Swipe right
                } else if (dy > 50 && Math.abs(dx) < 50) {
                    closePhotoFullscreen(); // Swipe down
                }
            }
        }
    );
});




//navigate
// Navigation click handlers
document.getElementById("photo-navigate").addEventListener("click", () => {
    document.getElementById("photo-sec").scrollIntoView({ behavior: "smooth" });
});

document.getElementById("video-navigate").addEventListener("click", () => {
    document.getElementById("video-sec").scrollIntoView({ behavior: "smooth" });
});

document.getElementById("contact-navigate").addEventListener("click", () => {
    document.getElementById("contact-sec").scrollIntoView({ behavior: "smooth" });
});
