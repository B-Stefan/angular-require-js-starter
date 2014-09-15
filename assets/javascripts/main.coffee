#using requirejs config + require
requirejs.config
  #urlArgs: "bust=" +  (new Date()).getTime()
  paths:
    c:"controllers"
    l18n:"vendor/l18n"
    jquery:"vendor/jquery"
    ang:"vendor/angular/angular"
    'angular-ui-router': 'vendor/angular-ui-router/angular-ui-router'
    'angular-ui-bootstrap': 'vendor/angular-bootstrap/ui-bootstrap-tpls'
    'angular-servicestack':'vendor/angular-servicestack/angular-servicestack'
    'angular-resource': 'vendor/angular-resource/angular-resource'
    'angular-socket-io': 'vendor/angular-socket-io/socket'
    'angular-scroll': 'vendor/angular-scroll/angular-scroll.min'
    'angular-inview': 'vendor/angular-inview/angular-inview'
    'lib-jquery.hipchat': 'vendor/jquery.hipchat/jquery.hipchat'
    async: 'vendor/require-plugins/async',
    font: 'vendor/require-plugins/font',
    goog: 'vendor/require-plugins/goog',
    image: 'vendor/require-plugins/image',
    json: 'vendor/require-plugins/json',
    noext: 'vendor/require-plugins/noext',
    mdown: 'vendor/require-plugins/mdown',
    propertyParser : 'vendor/require-plugins/propertyParser',
  shim:
    'angular-socket-io':
      deps: ['ang']
    'angular-ui-router':
      deps: ['ang']
    'angular-ui-bootstrap':
      deps: ['ang']
    'angular-servicestack':
      deps: ['ang']
    'angular-scroll':
      deps: ['ang']
    'angular-inview':
      deps: ['ang']
    'lib-jquery.hipchat':
      deps: ['ang']
      exports: '$'
    'ang':
      deps: ['vendor/modernizr']
      exports: 'angular'
    'angular-resource': ['ang']
    'vendor/modernizr':
      exports: 'Modernizr'


define ['app'
    'l18n!nls/hello'
    'bootstrap'
    'c/Home'
    'services/socket'
    'directives/staticInclude'
    'directives/scrollOffset'
    'directives/hipchat'
],
(app, hello) ->
  router =($stateProvider, $urlRouterProvider) ->
      #
      # For any unmatched url, redirect to /state1
      $urlRouterProvider.otherwise "/"
      $stateProvider.state('home',
        url: '/'
        views:
          "nav":  { templateUrl: "templates/Nav.hbs" }
          "main":  {
            templateUrl: "templates/Home.hbs"
            controller: 'Home'
          }
      )


  app.config ['$stateProvider','$urlRouterProvider', router]

  app.run ['$rootScope', '$document', '$location', ($rootScope, $document,$location) ->

    $rootScope.goToSection = (hash) ->
      #// set the location.hash to the id of
      #// the element you wish to scroll to.
      $location.hash(hash);
      el = angular.element(document.getElementById(hash))
      #// call $anchorScroll()
      $document.scrollToElementAnimated(el,0,1000);


  ]