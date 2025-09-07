/*document.querySelectorAll('.video-card').forEach((card) => {
    const video = card.querySelector('.myVideo');
    if (!video) return;

    const toggleFullscreen = () => {
        // Close fullscreen for all other videos
       document.querySelectorAll('.video-card').forEach(c => {
            if (c !== card) c.classList.remove('video-fullscreen');
        });

        // Toggle fullscreen for this one
        card.classList.toggle('video-fullscreen');
    };

 
    
    // Mobile tap
    video.addEventListener('touchstart', toggleFullscreen);

    // Exit fullscreen when paused
    
});*/
/*
document.querySelectorAll('.photo-card').forEach((card) => {
    const photo = card.querySelector('.myphoto');
    if (!photo) return;

    const toggleFullscreen = () => {
        // Close fullscreen for all other videos
        document.querySelectorAll('.photo-card').forEach(c => {
            if (c !== card) c.classList.remove('photo-fullscreen');
        });

        // Toggle fullscreen for this one
        card.classList.toggle('photo-fullscreen');
    };

 
    
    // Mobile tap
    photo.addEventListener('touchstart', toggleFullscreen);

    // Exit fullscreen when paused
   
});
*/

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
});*/

/*
let startX, startY;
    let currentIndex = 0;
    const photos = document.querySelectorAll('.photo-card');
    const exitButton = document.getElementById('exitFullscreenBtn');

    const updateButtonVisibility = () => {
        // Show button only if any video is fullscreen
        const isAnyFullscreen = document.querySelector('.photo-fullscreen') !== null;
        if (exitButton) {
            exitButton.style.display = isAnyFullscreen ? 'block' : 'none';
        }
    };

    const bindVideoEvents = (photo, card, index) => {
        const toggleVideo = (e) => {
            e.preventDefault();

            const isFullscreen = card.classList.contains('photo-fullscreen');

            if (!isFullscreen) {
                photos.forEach(c => {
                    c.classList.remove('photo-fullscreen');
                    const otherVideo = c.querySelector('.myphoto');
                    if (otherVideo) otherVideo.pause();
                });

                card.classList.add('photo-fullscreen');
                photo.play();
                currentIndex = index;
            }
            

            updateButtonVisibility();
        };

        photo.addEventListener('click', toggleVideo);
        photo.addEventListener('touchend', toggleVideo, { passive: false });
    };

    photos.forEach((card, index) => {
        const photo = card.querySelector('.myphoto');
        if (!photo) return;

        //video.removeAttribute('controls');
        bindVideoEvents(photo, card, index);
    });

    document.addEventListener('touchstart', function (e) {
        startX = e.touches[0].clientX;
        startY = e.touches[0].clientY;
    }, false);

    document.addEventListener('touchend', function (e) {
        let endX = e.changedTouches[0].clientX;
        let endY = e.changedTouches[0].clientY;

        let diffX = startX - endX;
        let diffY = startY - endY;

        if (Math.abs(diffX) > Math.abs(diffY) && diffX > 50) {
            let nextIndex = (currentIndex + 1) % photos.length;
            showVideo(nextIndex);
        } else if (Math.abs(diffX) > Math.abs(diffY) && diffX < -50) {
            let prevIndex = (currentIndex - 1 + videos.length) % photos.length;
            showVideo(prevIndex);
        } else if (Math.abs(diffY) > Math.abs(diffX) && diffY < -50) {
            exitFullscreen();
        }
    }, false);

    function showVideo(index) {
        photos.forEach((v, i) => {
            v.classList.toggle('photo-fullscreen', i === index);
            const vid = v.querySelector('.myphoto');
			if (i !== index && vid && vid.tagName === 'VIDEO') {
			            vid.pause();
			        }
        });
        currentIndex = index;
        updateButtonVisibility();
    }

    function exitFullscreen() {
        photos.forEach(v => {
            v.classList.remove('photo-fullscreen');
            const vid = v.querySelector('.myphoto');
            
        });
        updateButtonVisibility();
    }

    if (exitButton) {
        exitButton.addEventListener('click', exitFullscreen);
        exitButton.style.display = 'none'; // Hide by default
    }


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


// Photo Part 
/*
document.addEventListener('DOMContentLoaded', function () {
    const photoItems = Array.from(document.querySelectorAll('.photo-card img'));
	const exitButton = document.getElementById('exitFullscreenBtn');

	    const updateButtonVisibility = () => {
	        // Show button only if any video is fullscreen
	        const isAnyFullscreen = document.querySelector('.video-fullscreen') !== null;
	        if (exitButton) {
	            exitButton.style.display = isAnyFullscreen ? 'block' : 'none';
	        }
	    };

    let photoIndex = -1;
    let touchStartX = 0;
    let touchStartY = 0;

    function openPhotoFullscreen(index) {
        if (index < 0 || index >= photoItems.length) return;

        photoIndex = index;
        

        const imgClone = photoItems[index].cloneNode(true);
        imgClone.style.maxWidth = '100%';
        imgClone.style.maxHeight = '100%';
        
		updateButtonVisibility();
    }

    function closePhotoFullscreen() {
        
        photoIndex = -1;
		updateButtonVisibility();
    }

    function showNextPhoto() {
        if (photoItems.length === 0) return;
        let nextIndex = (photoIndex + 1) % photoItems.length;
        openPhotoFullscreen(nextIndex);
		updateButtonVisibility();
    }

    function showPrevPhoto() {
        if (photoItems.length === 0) return;
        let prevIndex = (photoIndex - 1 + photoItems.length) % photoItems.length;
        openPhotoFullscreen(prevIndex);
		updateButtonVisibility();
    }

    // Click event to open fullscreen
    photoItems.forEach((img, index) => {
        img.addEventListener('click', () => {
            openPhotoFullscreen(index);
        });
    });

    // Exit fullscreen
    exitBtn.addEventListener('click', closePhotoFullscreen);

    // Swipe detection
    fullscreen.addEventListener('touchstart', (e) => {
        touchStartX = e.touches[0].clientX;
        touchStartY = e.touches[0].clientY;
    }, { passive: true });

    fullscreen.addEventListener('touchend', (e) => {
        let dx = e.changedTouches[0].clientX - touchStartX;
        let dy = e.changedTouches[0].clientY - touchStartY;

        if (Math.abs(dx) > 50 && Math.abs(dy) < 50) {
            if (dx < 0) showNextPhoto(); // Swipe left
            else showPrevPhoto(); // Swipe right
        } else if (dy > 50 && Math.abs(dx) < 50) {
            closePhotoFullscreen(); // Swipe down
        }
		updateButtonVisibility();
    });
});
/*

const photoItems = Array.from(document.querySelectorAll('.photo-card'));
	
	const fullscreen = document.getElementById('fullscreenViewer');
	const fullscreenContent = document.getElementById('fullscreenContent');
	const exitBtn = document.getElementById('exitBtn');

	let currentIndex = -1;
	let currentType = null; // "photo" or "video"
	let touchStartX = 0;
	let touchStartY = 0;

	function openFullscreen(index, type) {
	    if (index === currentIndex && type === currentType && fullscreen.classList.contains('active')) {
	        return; // Do nothing if same fullscreen item
	    }
	    currentIndex = index;
	    currentType = type;
	    fullscreenContent.innerHTML = '';

	    let item;
	    if (type === "photo") {
	        item = photoItems[index].querySelector('img').cloneNode(true);
	    } 
	    fullscreenContent.appendChild(item);
	    fullscreen.classList.add('active');
	}

	function closeFullscreen() {
	    fullscreen.classList.remove('active');
	    fullscreenContent.innerHTML = '';
	    currentIndex = -1;
	    currentType = null;
	}

	function showNext() {
	    if (currentType === "photo" && currentIndex < photoItems.length - 1) {
	        openFullscreen(currentIndex + 1, "photo");
	    }
	}

	function showPrev() {
	    if (currentType === "photo" && currentIndex > 0) {
	        openFullscreen(currentIndex - 1, "photo");
	    }
	    
	}

	// Open photo fullscreen
	photoItems.forEach((item, index) => {
	    item.addEventListener('click', () => {
	        openFullscreen(index, "photo");
	    });
	});

	

	// Exit fullscreen
	exitBtn.addEventListener('click', closeFullscreen);

	// Swipe detection
	fullscreen.addEventListener('touchstart', (e) => {
	    touchStartX = e.touches[0].clientX;
	    touchStartY = e.touches[0].clientY;
	}, { passive: true });

	fullscreen.addEventListener('touchend', (e) => {
	    let dx = e.changedTouches[0].clientX - touchStartX;
	    let dy = e.changedTouches[0].clientY - touchStartY;

	    if (Math.abs(dx) > 50 && Math.abs(dy) < 50) {
	        if (dx < 0) showNext(); // Swipe left
	        else showPrev(); // Swipe right
	    } else if (dy > 50 && Math.abs(dx) < 50) {
	        closeFullscreen(); // Swipe down
	    }
	});
/*
//swipe for photo

let startX, startY;
let currentPhotoIndex = 0;
const photos = Array.from(document.querySelectorAll('.photo-card'));
const exitButton = document.getElementById('exitFullscreenBtn');

function updateButtonVisibility() {
    exitButton.style.display = document.querySelector('.photo-fullscreen') ? 'block' : 'none';
}

function showPhoto(index) {
    photos.forEach((card, i) => {
        card.classList.toggle('photo-fullscreen', i === index);
    });
    currentPhotoIndex = index;
    updateButtonVisibility();
}

function exitFullscreen() {
    photos.forEach(card => card.classList.remove('photo-fullscreen'));
    updateButtonVisibility();
}

photos.forEach((card, index) => {
    const img = card.querySelector('.myPhoto');
    img.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        if (!card.classList.contains('photo-fullscreen')) {
            showPhoto(index); // Enter fullscreen
        }
        // If already fullscreen → do nothing
    });
});

document.addEventListener('touchstart', (e) => {
    if (!document.querySelector('.photo-fullscreen')) return;
    startX = e.touches[0].clientX;
    startY = e.touches[0].clientY;
});

document.addEventListener('touchend', (e) => {
    if (!document.querySelector('.photo-fullscreen')) return;
    let endX = e.changedTouches[0].clientX;
    let endY = e.changedTouches[0].clientY;
    let diffX = startX - endX;
    let diffY = startY - endY;

    if (Math.abs(diffX) > Math.abs(diffY) && diffX > 50) {
        // Swipe left → next photo
        showPhoto((currentPhotoIndex + 1) % photos.length);
    } 
    else if (Math.abs(diffX) > Math.abs(diffY) && diffX < -50) {
        // Swipe right → previous photo
        showPhoto((currentPhotoIndex - 1 + photos.length) % photos.length);
    } 
    else if (Math.abs(diffY) > Math.abs(diffX) && diffY < -50) {
        // Swipe down → exit fullscreen
        exitFullscreen();
    }
});

exitButton.addEventListener('click', exitFullscreen);



*/

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
