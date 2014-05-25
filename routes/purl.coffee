purl = (config) ->

  (req, res) ->
    sess =req.session
    sess.name = req.params.name
    res.redirect('/')


exports.purl = purl