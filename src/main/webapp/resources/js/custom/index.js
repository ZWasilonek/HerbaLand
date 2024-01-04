/* ----------------------- view: index.jsp --------------------------- */
/* *********************** VARIABLES ************************ */
var categoryLinks = document.getElementsByClassName('category-link');
var categoryStatusP = document.getElementById('categoryName');
var categoryLinkDefaultName = 'Wszystkie';

/* sets the active link with the selected category or the default "Wszystkie" */
setActiveClass(categoryLinks, categoryStatusP, categoryLinkDefaultName);

function setActiveClass(items, selectedItem, defaultItemInnerTxt) {
  let itemInnerTxt;
  for (let i = 0; i < items.length; i++) {
    if (itemInnerTxt == null || itemInnerTxt == undefined) {
      itemInnerTxt = defaultItemInnerTxt;
      if (selectedItem != null && selectedItem != undefined) {
        itemInnerTxt = selectedItem.innerText;
      }
    }

    if (items[i].innerText == itemInnerTxt) {
      items[i].className += ' active';
      break;
    }
  }
}

/* ----------------------- view: home-video.jsp --------------------------- */
/* sets the size of the home video */
function setVideoSize() {
	const vidWidth = 1920;
	const vidHeight = 1080;
	let windowWidth = window.innerWidth;
	let newVidWidth = windowWidth;
	let newVidHeight = windowWidth * vidHeight / vidWidth;
	let marginLeft = 0;
	let marginTop = 0;

	if (newVidHeight < 500) {
		newVidHeight = 500;
		newVidWidth = newVidHeight * vidWidth / vidHeight;
	}

	if(newVidWidth > windowWidth) {
		marginLeft = -((newVidWidth - windowWidth) / 2);
	}

	if(newVidHeight > 720) {
		marginTop = -((newVidHeight - $('#tm-video-container').height()) / 2);
	}

	const tmVideo = $('#tm-video');

	tmVideo.css('width', newVidWidth);
	tmVideo.css('height', newVidHeight);
	tmVideo.css('margin-left', marginLeft);
	tmVideo.css('margin-top', marginTop);
}

/* sets the background of the home video section */
$(document).ready(function () {
	setVideoSize();

	// Set video background size based on window size
	let timeout;
	window.onresize = function () {
		clearTimeout(timeout);
		timeout = setTimeout(setVideoSize, 100);
	};

	// Play/Pause button for video background
	const btn = $("#tm-video-control-button");

	btn.on("click", function (e) {
		const video = document.getElementById("tm-video");
		$(this).removeClass();

		if (video.paused) {
			video.play();
			$(this).addClass("fas fa-pause");
		} else {
			video.pause();
			$(this).addClass("fas fa-play");
		}
	});
})