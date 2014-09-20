express = require 'express'
bodyParser = require 'body-parser'
engines = require 'consolidate'
compression = require 'compression'
favicon = require 'serve-favicon'
cookieParser = require 'cookie-parser'
errorHandler = require 'errorhandler'
cookieSession = require 'cookie-session'
socketIo = require('socket.io')

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
  app.use(cookieSession({ secret: 'YOURKEK', cookie: { secure: true }}))
  if app.get('env') is 'development'
    app.use errorHandler()

  routeOptions =
    reload:    config.liveReload.enabled
    optimize:  config.isOptimize ? false
    cachebust: if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''
    onlineState: false
    name: "your var from server side"

  router = express.Router()

  router.get '/', (req, res,next) ->
      res.render 'index', routeOptions

  app.use("/templates", express.static(__dirname + '/views'));

  # routes
  app.use '/', router

  # start it up
  server = app.listen app.get('port'), ->
    console.log 'Express server listening on port ' + app.get('port')
  io = socketIo.listen(server)

  io.on "connection", (socket) ->
    console.log("user connected")
    setTimeout(()->
      io.emit('msg', { message: 'Hello' })
      socket.emit('msg', { message: 'Hello' })
    ,200)



  callback server