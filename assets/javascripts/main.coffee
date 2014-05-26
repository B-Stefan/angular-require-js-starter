require
  paths:
    jquery: 'vendor/jquery/jquery'
    'lib-jquery.easing': 'vendor/jquery.easing/jquery.easing.min'
    'lib-jquery.hipchat': 'vendor/jquery.hipchat/jquery.hipchat'
    'waypoints': 'vendor/jquery-waypoints/waypoints'
  shim:
    'lib-jquery.easing':
      deps: ['jquery']
      exports: '$'

    'lib-jquery.hipchat':
      deps: ['jquery']
      exports: '$'


define ['jquery',
        'lib-jquery.easing',
        'lib-jquery.hipchat',
        'waypoints'],
($,unsued,unsued1,unused3)->
  #jQuery to collapse the navbar on scroll
  $(window).scroll ->
    if $(".navbar").offset().top > 50
      $(".navbar-fixed-top").addClass "top-nav-collapse"
    else
      $(".navbar-fixed-top").removeClass "top-nav-collapse"
    return


  #jQuery for page scrolling feature - requires jQuery Easing plugi
  $(".page-scroll a ").bind "click", (event) ->
    $anchor = $(this)
    $("html, body").stop().animate
      scrollTop: $($anchor.attr("href")).offset().top
    , 1500, "easeInOutExpo"
    event.preventDefault()
    return

  $('#contact').waypoint(
    offset: ()->
      return 500
    triggerOnce: true
    handler: ()->
      $('.contact-chat').hipChatPanel(
          url: "www.hipchat.com/gk2Lvjf6Y"
          timezone: 'Europe/Berlin'
          showButton: false
          welcome: 'Wie kann ich Ihnen weiterhelfen ? '
        )
    )


