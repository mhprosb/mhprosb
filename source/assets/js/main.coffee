#= require "jquery"
#= require "jquery-easing"
#= require "jquery-waypoints"
#= require "jquery-backstretch"
#= require "wow"
#= require "stellar"
#= require "_scrollIt.js"

$ ->

  bgImages = [
    # "http://interfacelift.com/wallpaper/7yz4ma1/03706_chaterdag_1440x900.jpg"
    # "http://interfacelift.com/wallpaper/7yz4ma1/03703_pastoralroad_1440x900.jpg"
    # "http://interfacelift.com/wallpaper/7yz4ma1/03711_icelandicroad_1440x900.jpg"
    "/assets/img/mhp/screen-bg_mixer.jpg"
    # "http://interfacelift.com/wallpaper/7yz4ma1/03694_thelakeofdarkness_1440x900.jpg"
    # "http://interfacelift.com/wallpaper/7yz4ma1/03711_icelandicroad_1440x900.jpg"
    "/assets/img/mhp/screen-bg_river.jpg"
    "/assets/img/mhp/screen-bg_river-blur.jpg"
    "/assets/img/mhp/screen-bg_mic.jpg"
  ]

  $.scrollIt(easing: "easeInOutQuart")

  new WOW(offset: 100).init()

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

  $(".backstretch-carousel").backstretch bgImages,
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

  return
