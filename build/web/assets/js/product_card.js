$(document).ready(function(){
    $('.product-cards').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        autoplay: true,
  autoplaySpeed: 3000,
  prevArrow:`<div class="swiper-button-prev"></div>`,
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