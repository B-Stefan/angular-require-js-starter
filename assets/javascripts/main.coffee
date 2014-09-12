#using requirejs config + require

requirejs ['config'], ->

  requirejs ['app'
      'l18n!nls/hello'
      'jquery'
      'ang'
      'bootstrap'
      'c/Login'
      'c/Home'
      'c/Startups'
      'filters/sumByKey'
      'angular-servicestack'
  ],
  (app, hello, $, angular) ->
    router =($stateProvider, $urlRouterProvider) ->
        #
        # For any unmatched url, redirect to /state1
        $urlRouterProvider.otherwise "/home"

        #
        # Now set up the states
        $stateProvider.state("startups",
          url: "/startups"
          templateUrl: "views/Startups.html"
          controller: "Startups"
        )
        $stateProvider.state('home',
          url: '/home'
          templateUrl: 'views/Home.html'
          controller: 'Home'
        )


    app.config ['$stateProvider','$urlRouterProvider', router]

    app.run ['$rootScope', '$log', ($rootScope, $log) ->




    ]