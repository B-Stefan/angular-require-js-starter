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
    "handlebars"
    "combine"
    "server-reload"
    "web-package"
  ]
  bower:
    copy:
      mainOverrides:
        "knockout.js":["knockout-3.0.0.debug.js"]
        "bootstrap": [
          { "dist/fonts": "../../fonts" }
          "dist/js/bootstrap.js"
          "less"
        ]
        "font-awesome": [
          { fonts: "../../fonts" }
          "css/font-awesome.css"
        ]
  minifyJS: {
    exclude:[/\.min\./, "javascripts/main.js"]
  }
  requrejs:
    optimize: 'none'
  combine:
    folders: [
      {
        folder:'stylesheets'
        output:'stylesheets/styles.css'
        order: [
          'vendor/bootstrap/bootstrap.css'
          'vendor/font-awesome/font-awesome.css'
          #'vendor/bootstrap/theme.css'
        ]
        ###
        exclude: [
                'vendor/bootstrap/*.less'
              ]
        ###
      }
    ]

  webPackage:
    archiveName: "app"
    configName: "config"
    outPath: "dist"
    fromPath: "public"
    exclude: [
              "README.md"
              "node_modules"
              "mimosa-config.coffee"
              "mimosa-config.js"
              "assets"
              ".git"
              ".idea"
              ".mimosa"
              "node_modules"
    ]
    appjs: "app.js"

  server:
    views:
      compileWith: "handlebars"
      extension: "hbs"
