$(document).ready(function(){
    $('.image-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        dots: true,
  autoplaySpeed: 3000,
  prevArrow:`<div class="swiper-button-prev" style="color: #5A40C3;"></div>`,
  nextArrow:`<div class="swiper-button-next" style="color: #5A40C3;"></div>`,
            responsive: [
                {
                  breakpoint: 1025,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                   
                  }
                },
                {
                  breakpoint: 600,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                  }
                },
                {
                  breakpoint: 480,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                  }
                }
                // You can unslick at a given breakpoint now by adding:
                // settings: "unslick"
                // instead of a settings object
              ] 
               
        });
  });
  $(document).ready(function(){
    $('.swiper-wrapper').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
       
  autoplaySpeed: 3000,
  prevArrow:`<div class="swiper-button-prev" ></div>`,
  nextArrow:`<div class="swiper-button-next"></div>`,
            responsive: [
                {
                  breakpoint: 1025,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                   
                  }
                },
                {
                  breakpoint: 600,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                  }
                },
                {
                  breakpoint: 480,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                  }
                }
                // You can unslick at a given breakpoint now by adding:
                // settings: "unslick"
                // instead of a settings object
              ] 
               
        });
  });
  
  document.getElementById("open-popup-btn").addEventListener("click",function(){
    document.getElementsByClassName("wrapper")[0].classList.add("active"); 
});
document.getElementById("close-btn").addEventListener("click",function(){
    document.getElementsByClassName("wrapper")[0].classList.remove("active"); 
});



const allStar = document.querySelectorAll('.rating .star');
const ratingValue = document.querySelector('.rating input');

allStar.forEach((item, idx)=> {
	item.addEventListener('click', function () {
		let click = 0;
		ratingValue.value = idx + 1;

		allStar.forEach(i=> {
			i.classList.replace('bxs-star', 'bx-star');
			i.classList.remove('active');
		})
		for(let i=0; i<allStar.length; i++) {
			if(i <= idx) {
				allStar[i].classList.replace('bx-star', 'bxs-star');
				allStar[i].classList.add('active');
			} else {
				allStar[i].style.setProperty('--i', click);
				click++;
			}
		}
	})
});

//document.addEventListener("DOMContentLoaded", function() {
//        const form = document.querySelector("#feedbackForm");
//
//        form.addEventListener("submit", function(event) {
//            event.preventDefault(); // Prevent the form from submitting normally
//
//            // You may perform validation here if needed
//
//            // Construct the redirect URL
//            const id = form.querySelector('input[name="id"]').value;
//            const cateid = form.querySelector('input[name="cateid"]').value;
//            const redirectURL = "shopdetail?id=" + id + "&cateid=" + cateid;
//
//            // Redirect the user to the desired URL
//            window.location.href = redirectURL;
//        });
//    });