hipchat = require('node-hipchat');



sendMail = (config) ->

  (req, res) ->
    HC = new hipchat('88683c292d538cd35b749ee317b0cc');
    HC.listUsers (data) ->
    for user in data.users
      if user.user_id = 793677
        options.onlineState = (user.status == 'available')


exports.sendMail = sendMail