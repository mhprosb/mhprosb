# require "vide"
# require "stellar"
# require "_scrollIt.js"

$(document).foundation()

$ ->
  Pace?.on "done", ->
    setTimeout (->
      $(".preloader").addClass("fadeOutUpBig animated").one "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", ->
        $(this).removeClass().addClass(".preloader").hide()
        return

      return
    ), 700
    return

  # $.scrollIt(easing: "easeInOutQuart")

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

  $.backstretch [
    "/assets/img/mhp/screen-bg_mixer.jpg"
    "/assets/img/mhp/screen-bg_river.jpg"
    "/assets/img/mhp/screen-bg_river-blur.jpg"
    "/assets/img/mhp/screen-bg_mic.jpg"
  ],
    duration: 1000
    fade: 2000
  $.backstretch "pause"

  $(".screen").waypoint ((direction) ->
    $.backstretch "next"  if direction is "down"
    $.backstretch "prev"  if direction is "up"
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
