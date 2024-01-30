
(function ($) {
  'use strict';

  // Preloader
  $(window).on('load', function () {
    $('#preloader').fadeOut('slow', function () {
      $(this).remove();
    });
  });

  
  // Instagram Feed
  if (($('#instafeed').length) !== 0) {
    var accessToken = $('#instafeed').attr('data-accessToken');
    var userFeed = new Instafeed({
      get: 'user',
      resolution: 'low_resolution',
      accessToken: accessToken,
      template: '<a href="{{link}}"><img src="{{image}}" alt="instagram-image"></a>'
    });
    userFeed.run();
  }

  setTimeout(function () {
    $('.instagram-slider').slick({
      dots: false,
      speed: 300,
      // autoplay: true,
      arrows: false,
      slidesToShow: 6,
      slidesToScroll: 1,
      responsive: [{
          breakpoint: 1024,
          settings: {
            slidesToShow: 4
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 3
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 2
          }
        }
      ]
    });
  }, 1500);


  // e-commerce touchspin
  $('input[name=\'product-quantity\']').TouchSpin();


  // Video Lightbox
  $(document).on('click', '[data-toggle="lightbox"]', function (event) {
    event.preventDefault();
    $(this).ekkoLightbox();
  });


  // Count Down JS
  $('#simple-timer').syotimer({
    year: 2022,
    month: 5,
    day: 9,
    hour: 20,
    minute: 30
  });

  //Hero Slider
  $('.hero-slider').slick({
    // autoplay: true,
    infinite: true,
    arrows: true,
    prevArrow: '<button type=\'button\' class=\'heroSliderArrow prevArrow tf-ion-chevron-left\'></button>',
    nextArrow: '<button type=\'button\' class=\'heroSliderArrow nextArrow tf-ion-chevron-right\'></button>',
    dots: true,
    autoplaySpeed: 7000,
    pauseOnFocus: false,
    pauseOnHover: false
  });
  $('.hero-slider').slickAnimation();


})(jQuery);

let thisPage=1;
let limit=12;
let list=document.querySelectorAll('.product-list .product-item');
function loadItem(){
   let beginGet=limit *(thisPage-1);
   let endGet=limit*thisPage-1;
   list.forEach((item,key)=>{
       if(key >=beginGet && key <= endGet){
           item.style.display= 'block';
       }else{
           item.style.display= 'none';
       }
   });
   listPage();
}
loadItem();
function listPage(){
   let count=Math.ceil(list.length /limit);
   document.querySelector('.listPage').innerHTML='';
   if(thisPage!==1){
       let prev=document.createElement('li');
       prev.innerHTML= 'PREV';
       prev.setAttribute('onclick',"changPage("+(thisPage-1)+")");
       document.querySelector('.listPage').appendChild(prev);
   
   }
   for(i=1;i<=count;i++){
       let newPage=document.createElement('li');
       newPage.innerText=i;
       if(i===thisPage){
           newPage.classList.add('active');
       }
       newPage.setAttribute('onclick',"changPage("+i+")");
       document.querySelector('.listPage').appendChild(newPage);
   }
   if(thisPage!==count){
       let next=document.createElement('li');
       next.innerHTML= 'NEXT';
       next.setAttribute('onclick',"changPage("+(thisPage+1)+")");
       document.querySelector('.listPage').appendChild(next);
   
   }
}
function changPage(i){
   thisPage=i;
   loadItem();
}