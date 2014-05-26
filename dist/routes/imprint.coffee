imprint = (config) ->

  (req, res) ->
    if req.session.trusted == undefined  or req.session.trusted=false
      res.redirect("/")
    else
      res.render 'imprint', {}


exports.imprint = imprint