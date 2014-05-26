hipchat = require('node-hipchat');


index = (config) ->

  hours = new Date().getHours()
  options =
    reload:    config.liveReload.enabled
    optimize:  config.isOptimize ? false
    cachebust: if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''
    onlineState: false
    daytime:
      morning: hours >= 6 && hours < 11
      day: hours >= 11 && hours < 21
      night: hours >= 21 && hours <= 24 || hours > 0 &&  hours < 6

  if options.daytime.morning
    options.daytime.cssClass = 'morning'
  else if options.daytime.day
    options.daytime.cssClass = 'day'
  else if options.daytime.night
    options.daytime.cssClass = 'night'
  else
    options.daytime.cssClass = 'day'

  # In the event plain html pages are being used, need to
  # switch to different page for optimized view
  name = if config.isOptimize and config.server.views.html
    "index-optimize"
  else
    "index"

  (req, res) ->
    options.name = req.session.name
    HC = new hipchat('88683c292d538cd35b749ee317b0cc');
    HC.listUsers (data) ->
      for user in data.users
        if user.user_id = 793677
          options.onlineState = (user.status == 'available')
      res.render name, options



exports.index = index