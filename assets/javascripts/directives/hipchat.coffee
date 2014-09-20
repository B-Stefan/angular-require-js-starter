define ['./directives'], (module)->


  module.directive "hipchat", ($window) ->
    (scope, element, attrs) ->
      console.log(arguments)
      options = {
        url: attrs.url ? "www.hipchat.com/yourRoomID"
        timezone: attrs.hipchatTimezone ? 'Europe/Berlin'
        showButton: attrs.hipchatShowButton ?  false
        welcome: attrs.hipchatWelcome ? 'Wie kann ich Ihnen weiterhelfen ? '
        container: element
      }
      console.log(arguments)

      $container = angular.element(options.container)

      params =
        anonymous: true
        timezone: options.timezone
        minimal: true

      params.welcome_msg = options.welcome
      url = options.url + ((if options.url.indexOf("?") > 0 then "&" else "?")) + "anonymous=true&timezone="+encodeURIComponent(options.timezone)+"&minimal=true&welcome_msg="+encodeURIComponent(options.welcome)
      if url.indexOf("https://") < 0
        url = "https://"+ url
        console.log(url)
      w = options.width or "100%"
      h = options.height or 400
      nf = (options.noframes or "")
      console.log($container,options)
      $container.html "<iframe src=\"" + url + "\" frameborder=\"" + 0 + "\" width=\"" + w + "\" height=\"" + h + "\">" + nf + "</iframe>"


