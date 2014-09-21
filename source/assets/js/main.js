//= require "jquery"
//= require "jquery-easing"
//= require "jquery-waypoints"
//= require "jquery-backstretch"
//= require "wow"
//= require "stellar"

var wow = new WOW({
  animateClass: 'animated',
  offset: 150
})
wow.init();

// $.stellar({
//   horizontalScrolling: false,
//   hideDistantElements: false,
//   responsive: true
// });

$(function() {
  $('.scrollto, .gototop').bind('click', function(event) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: $($anchor.attr('href')).offset().top
    }, 800,'easeInOutQuart');
    event.preventDefault();
  });
});

/*
 * Backstretch Carousel :: Replace with your images if necessary.
 */

$(".backstretch-carousel").backstretch([
  "/assets/img/mhp/screen-bg_3.jpg",
  "/assets/img/mhp/screen-bg_5.jpg",
  "/assets/img/mhp/screen-bg_6.jpg",
  "/assets/img/mhp/screen-bg_4.jpg",
], {
  duration: 1000,
  fade: 2000
});

$(".backstretch-carousel").backstretch("pause");

$('.screen').waypoint(function(direction) {
  if (direction === 'down') {
   $(".backstretch-carousel").backstretch("next");
  }
  if (direction === 'up') {
   $(".backstretch-carousel").backstretch("prev");
  }
}, { offset: '50%' });

$('#explore').waypoint(function(direction) {
  if (direction === 'down') {
   $(".small-logo").addClass('show');
  }
  if (direction === 'up') {
   $(".small-logo").removeClass('show');
  }
}, { offset: '50%' });