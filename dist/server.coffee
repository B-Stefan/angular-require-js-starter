require('newrelic');
express = require 'express'
engines = require 'consolidate'
routes  = require './routes'
favicon = require 'serve-favicon'
routes.purl  = require('./routes/purl').purl
routes.imprint  = require('./routes/imprint').imprint
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


  app = express()
  router = express.Router();

  app.set 'port', port
  app.set 'views', config.server.views.path
  app.engine config.server.views.extension, engines[config.server.views.compileWith]
  app.set 'view engine', config.server.views.extension
  app.use bodyParser()
  app.use methodOverride()

  app.use(cookieParser());
  app.use(cookieSession({ secret: 'keyboard cat', cookie: { secure: true }}))

  app.use compression(
    filter:  (req, res) ->return true
  )
  app.use config.server.base, router
  app.use express.static(config.watch.compiledDir,{ maxAge: 86400000 })


  router.get '/', routes.index(config)
  router.get '/purl/:name', routes.purl(config)
  router.get '/sendMail', routes.purl(config)
  router.get '/imprint', routes.imprint(config)
  console.log("PORT " + port)
  console.log("ENV" + env)
  server = app.listen port, ->
    console.log "Express server listening on port %d in %s mode", server.address().port, app.settings.env


  callback(server)

