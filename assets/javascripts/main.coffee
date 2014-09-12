#using requirejs config + require

requirejs ['config'], ->

  requirejs ['app'
      'l18n!nls/hello'
      'jquery'
      'ang'
      'bootstrap'
      'c/Home'
  ],
  (app, hello, $, angular) ->
    router =($stateProvider, $urlRouterProvider) ->
        #
        # For any unmatched url, redirect to /state1
        $urlRouterProvider.otherwise "/"

        #
        # Now set up the states
        $stateProvider.state("startups",
          url: "/startups"
          templateUrl: 'templates/Home.hbs'
          controller: "Startups"
        )
        $stateProvider.state('home',
          url: '/'
          templateUrl: 'templates/Home.hbs'
          controller: 'Home'
        )


    app.config ['$stateProvider','$urlRouterProvider', router]

    app.run ['$rootScope', '$log', ($rootScope, $log) ->




    ]