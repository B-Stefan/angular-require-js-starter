purl = (config) ->

  (req, res) ->
    sess =req.session
    sess.name = req.params.name
    sess.trusted = true
    res.redirect('/')


exports.purl = purl