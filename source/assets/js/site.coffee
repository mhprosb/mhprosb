#= require "_mapstyles.js"
# require "stellar"
#= require "_scrollIt.js"

$ ->

  # Foundation JS
  # $(document).foundation()

  # Scroller
  $.scrollIt easing: "easeInOutQuart"

  $(".scrollto, .gototop").bind "click", (event) ->
    $anchor = $(this)
    $("html, body").stop().animate
      scrollTop: $($anchor.attr("href")).offset().top
    , 800, "easeInOutQuart"
    event.preventDefault()

  # Wow animation
  new WOW(offset: 100).init()

  # Background images
  $.backstretch [
    "#{imgurl}/bg_sea.jpg"
    "#{imgurl}/bg_field.jpg"
    "#{imgurl}/bg_cloud.jpg"
    "#{imgurl}/bg_mic.jpg"
  ],
    duration: 1000
    fade: 1500

  $.backstretch "pause"

  $(".screen").waypoint ((direction) ->
    $.backstretch "next"  if direction is "down"
    $.backstretch "prev"  if direction is "up"
  ),
    offset: "50%"

  # Parallax
  scrollZoom = ->
    st = $(window).scrollTop()
    wh = $(window).height()
    sf = 1 + st/(20*wh)

    $('.backstretch img').css
      'transform': 'scale('+sf+')'

  scrollZoom()
  $(window).scroll -> scrollZoom()

  # $.stellar({
  #   horizontalScrolling: false,
  #   hideDistantElements: false,
  #   responsive: true
  # });

  # Top menu hiding
  $("#explore").waypoint ((direction) ->
    $(".small-logo").addClass "show"     if direction is "down"
    $(".small-logo").removeClass "show"  if direction is "up"
  ),
    offset: "50%"

  # Google Maps
  loadGmap = ->
    if $("#gmap").length
      mapPoint =
        lat: 3.0924034
        lng: 101.543492
        zoom: 17
        infoText: "<p>430, Level 4, Block 4\t\t\t\t\t\t\t\t<br/>Laman Seri Business Park\t\t\t\t\t\t\t\t<br/>40100 Shah Alam Selangor</p>"
        linkText: "View on Google Maps"
        mapAddress: "Laman Seri Business Park Shah Alam Selangor"
        icon: "#{imgurl}/pin-dark.png"

      infoWindow = new google.maps.InfoWindow
      pointLatLng = new google.maps.LatLng(mapPoint.lat, mapPoint.lng)
      mapOptions =
        zoom: mapPoint.zoom
        center: pointLatLng
        zoomControl: true
        panControl: false
        streetViewControl: false
        mapTypeControl: false
        overviewMapControl: false
        scrollwheel: false
        styles: mapstyles

      map = new google.maps.Map($("#gmap")[0], mapOptions)
      marker = new google.maps.Marker(
        position: pointLatLng
        map: map
        title: mapPoint.linkText
        icon: mapPoint.icon
      )
      mapLink = "https://www.google.com/maps/preview?ll=" + mapPoint.lat + "," + mapPoint.lng + "&z=14&q=" + mapPoint.mapAddress
      html = "<div class=\"infowin\">" + mapPoint.infoText + "<a href=\"" + mapLink + "\" target=\"_blank\">" + mapPoint.linkText + "</a>" + "</div>"
      google.maps.event.addListener marker, "mouseover", ->
        infoWindow.setContent html
        infoWindow.open map, marker

      google.maps.event.addListener marker, "click", ->
        window.open mapLink, "_blank"

      $(window).bind "resize", ->
        map.setCenter pointLatLng

  loadGmap()

  # Pace preloader
  Pace?.on "done", ->
    setTimeout (->
      $("html").addClass("loaded")
      ), 300

  return
