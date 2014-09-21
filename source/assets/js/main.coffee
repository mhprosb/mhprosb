#= require "jquery"
#= require "jquery-easing"
#= require "jquery-waypoints"
#= require "jquery-backstretch"
#= require "wow"
#= require "stellar"
#= require "_scrollIt.js"

$ ->

  $.scrollIt()

  wow = new WOW(
    offset: 100
  )
  wow.init()

  # $.stellar({
  #   horizontalScrolling: false,
  #   hideDistantElements: false,
  #   responsive: true
  # });

  $(".scrollto, .gototop").bind "click", (event) ->
    $anchor = $(this)
    $("html, body").stop().animate
      scrollTop: $($anchor.attr("href")).offset().top
    , 800, "easeInOutQuart"
    event.preventDefault()
    return

  $(".backstretch-carousel").backstretch [
    "/assets/img/mhp/screen-bg_mixer.jpg"
    "/assets/img/mhp/screen-bg_river.jpg"
    "/assets/img/mhp/screen-bg_river-blur.jpg"
    "/assets/img/mhp/screen-bg_mic.jpg"
  ],
    duration: 1000
    fade: 2000

  $(".backstretch-carousel").backstretch "pause"
  $(".screen").waypoint ((direction) ->
    $(".backstretch-carousel").backstretch "next"  if direction is "down"
    $(".backstretch-carousel").backstretch "prev"  if direction is "up"
    return
  ),
    offset: "50%"

  $("#explore").waypoint ((direction) ->
    $(".small-logo").addClass "show"     if direction is "down"
    $(".small-logo").removeClass "show"  if direction is "up"
    return
  ),
    offset: "50%"


  $(document).keydown (event) ->
    # if event.which is 32 # spacebar


  return
