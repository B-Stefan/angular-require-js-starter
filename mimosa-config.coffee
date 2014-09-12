exports.config =
  modules: [
    "copy"
    "server"
    "jshint"
    "csslint"
    "require"
    "minify-js"
    "minify-css"
    "live-reload"
    "bower"
    "coffeescript"
    "less"
    ]

  minifyJS:
    mangleNames:false

  server:
      views:
          compileWith: "handlebars"
          extension: "hbs"