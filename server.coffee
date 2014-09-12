express = require 'express'
bodyParser = require 'body-parser'
engines = require 'consolidate'
compression = require 'compression'
favicon = require 'serve-favicon'
cookieParser = require 'cookie-parser'
errorHandler = require 'errorhandler'
db = require './db'
Investment = require './carwler/Investment.coffee'


exports.startServer = (config, callback) ->
  app = express()

  console.log(config.server.views.extension)
  # setup views and port
  app.set 'views', config.server.views.path
  app.engine config.server.views.extensipackage.jsonon, engines[config.server.views.compileWith]
  app.set 'view engine', config.server.views.extension
  app.set 'port', process.env.PORT || config.server.port || 3000

  # middleware
  app.use compression()
  # uncomment and point path at favicon if you have one
  # app.use favicon "path to fav icon"
  app.use bodyParser.json()
  app.use bodyParser.urlencoded {extended: true}
  app.use cookieParser()
  app.use express.static config.watch.compiledDir
  if app.get('env') is 'development'
    app.use errorHandler()

  routeOptions =
    reload:    config.liveReload.enabled
    optimize:  config.isOptimize ? false
    cachebust: if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''

  router = express.Router()
  router.get '/', (req, res) ->
    res.render 'index', routeOptions


  router.get '/api/startups', (req, res) ->
    Investment.find({}).sort({ currentInvestedSum: -1 }).exec((error, docs)->
      res.json(docs)
    )



  # routes
  app.use '/', router

  # start it up
  server = app.listen app.get('port'), ->
    console.log 'Express server listening on port ' + app.get('port')

  callback server