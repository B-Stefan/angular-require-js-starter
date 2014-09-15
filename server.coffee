express = require 'express'
bodyParser = require 'body-parser'
engines = require 'consolidate'
compression = require 'compression'
favicon = require 'serve-favicon'
cookieParser = require 'cookie-parser'
errorHandler = require 'errorhandler'
cookieSession = require 'cookie-session'
socketIo = require('socket.io')
hipchat = require "node-hipchat"
HC = new hipchat('88683c292d538cd35b749ee317b0cc');



exports.startServer = (config, callback) ->
  app = express()

  console.log(config.server.views.extension)
  # setup views and port
  app.set 'views', config.server.views.path
  app.engine config.server.views.extension, engines[config.server.views.compileWith]
  app.set 'view engine', config.server.views.extension
  app.set 'port', process.env.PORT || config.server.port || 3000

  # middleware
  app.use compression()
  # uncomment and point path at favicon if you have one
  # app.use favicon "path to fav icon"
  app.use bodyParser.json()
  app.use bodyParser.urlencoded {extended: true}
  app.use cookieParser()
  app.use((req, res, next) ->
    res.setHeader("Access-Control-Allow-Origin", "*");
    return next();
  )
  app.use express.static config.watch.compiledDir
  app.use(cookieSession({ secret: 'Ich bin ein schöner Bremer', cookie: { secure: true }}))
  if app.get('env') is 'development'
    app.use errorHandler()

  routeOptions =
    reload:    config.liveReload.enabled
    optimize:  config.isOptimize ? false
    cachebust: if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''
    onlineState: false
    name: ""

  router = express.Router()


  router.get '/purl/:name',(req, res) ->
    sess =req.session
    sess.name = req.params.name
    sess.trusted = true
    res.redirect('/')

  router.get '/', (req, res,next) ->
    routeOptions.onlineState = false
    routeOptions.name =""
    if req.session?.trusted?
      console.log(req.session.name)
      routeOptions.name = req.session.name
      res.render 'index', routeOptions
      #check state
      HC.listUsers (data) ->
        for user in data.users
          if user.user_id = 793677
            routeOptions.onlineState = (user.status == 'available')
            #push to clients
            io.emit('hipchat-state', routeOptions.onlineState)

      if req.session.count == 1
        message = 'Hey ich habe soeben deine Webseite aufgerufen'
      else
        message = 'Zum zweiten mal habe ich deine Webseite aufgrufen insgesamt ' + req.session.count

      params = {
        room: 585953, #Found in the JSON response from the call above
        from: routeOptions.name,
        message: message
        color: 'yellow'
        notify: true
      };
      HC.postMessage(params, (data)->
        console.log(params)
      )
    else
      res.render 'forbidden', routeOptions
     # res.render 'particle/Intro', routeOptions

  checkLogin = (req,res,next)->
    if req.session?.trusted?
      next()
    else
      res.redirect('/')

  app.use("/templates",checkLogin, express.static(__dirname + '/views'));
  app.use("/data",checkLogin, express.static(__dirname + '/data'));
  # routes
  app.use '/', router

  # start it up
  server = app.listen app.get('port'), ->
    console.log 'Express server listening on port ' + app.get('port')
  io = socketIo.listen(server)

  io.on "connection", (socket) ->
    console.log("user connected")
    io.emit('hipchat-state', routeOptions.onlineState)
    return




  callback server