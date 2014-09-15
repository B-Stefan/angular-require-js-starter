Datastore = require('nedb')
mongoose = require('mongoose')
mubsub = require('mubsub')

class DB
  @host: 'ds035740.mongolab.com'
  @port: 35740
  @database: 'startups'
  @username: 'web'
  @password: 'JYDDFUrTcXYx'
  @connectionString = 'mongodb://'+DB.username+':'+DB.password+'@'+DB.host+':'+DB.port+'/'+DB.database
  @Schema = mongoose.Schema
  @main = mongoose.createConnection(DB.connectionString)



module.exports =  DB