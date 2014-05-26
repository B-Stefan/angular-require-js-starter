express = require 'express'
engines = require 'consolidate'
routes  = require './routes'
favicon = require 'serve-favicon'
routes.purl  = require('./routes/purl').purl
routes.sendMail  = require('./routes/sendMail').sendMail
bodyParser  = require 'body-parser'
methodOverride = require 'method-override'
compression = require 'compression'
cookieParser = require 'cookie-parser'
cookieSession = require 'cookie-session'
errorHandler = require 'errorhandler'
env = process.env.NODE_ENV || 'development';

exports.startServer = (config, callback) ->

  port = parseInt(process.env.OPENSHIFT_NODEJS_PORT) or process.env.PORT or config.server.port
  ip = process.env.OPENSHIFT_NODEJS_IP || "127.0.0.1";

  app = express()
  router = express.Router();

  app.set 'port', port
  app.set 'views', config.server.views.path
  app.engine config.server.views.extension, engines[config.server.views.compileWith]
  app.set 'view engine', config.server.views.extension
  app.use bodyParser()
  app.use methodOverride()
  app.use compression()

  postFixDir = '/public/'
  if env == 'development'
    postFixDir = '/assets/'

  app.use("/stylesheets", express.static(__dirname + postFixDir + 'stylesheets'));
  app.use("/javascripts", express.static(__dirname + postFixDir + 'javascripts'));
  app.use("/images", express.static(__dirname + postFixDir + 'images'));
  app.use("/fonts", express.static(__dirname + postFixDir + 'fonts'));

  app.use(cookieParser());
  app.use(cookieSession({ secret: 'keyboard cat', cookie: { secure: true }}))

  app.use config.server.base, router
  app.use express.static(config.watch.compiledDir)



  if env ==  'development'
    app.use errorHandler()

  router.get '/', routes.index(config)
  router.get '/purl/:name', routes.purl(config)
  router.get '/sendMail', routes.purl(config)
  console.log("PORT " + port)
  console.log("IP " + ip)
  console.log("ENV" + env)
  server = app.listen port, ip, ->
    console.log "Express server listening on port %d in %s mode", server.address().port, app.settings.env


  callback(server)
