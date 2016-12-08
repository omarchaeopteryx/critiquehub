$(document).ready(function(event) {

//   $('.multiple-items').slick({
//   infinite: true,
//   autoplay: true,
//   slidesToShow: 7,
//   slidesToScroll: 3
//   });


  $('.movie-slider').slick({

  // normal options...
  infinite: true,
  slidesToShow: 5,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 2000,

  // the magic
  responsive: [{

      breakpoint: 1000,
      settings: {
        slidesToShow: 3,
        infinite: true
      }

    }, {

      breakpoint: 600,
      settings: {
        slidesToShow: 1,
        dots: true
      }

    }, {

      breakpoint: 300,
      settings: "unslick" // destroys slick

    }]
  })
})
