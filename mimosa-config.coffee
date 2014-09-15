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
    "server-reload"
    "web-package"
    ]
  'web-package':
    exclude: ['node_modules']
  copy:
    exclude: ['']
  minifyJS:
    mangleNames:false

  liveReload:
    enabled: false
  server:
      views:
          compileWith: "handlebars"
          extension: "hbs"

