define ['c/controllers'], (controllers)->
  controllers.controller 'Home', ['$scope','$rootScope', 'socket','$location','$document',($scope,$rootScope, socket,$location,$document)->
    $scope.list = ['Bob', 'Kai']

    hash = $location.hash()
    if hash != ""

      window.setTimeout(()->
        $rootScope.goToSection(hash)
      ,500)
    hours = new Date().getHours()
    $scope.daytime =
      morning: hours >= 6 && hours < 11
      day: hours >= 11 && hours < 21
      night: hours >= 21 && hours <= 24 || hours >= 0 &&  hours < 6

    if $scope.daytime.morning
      $scope.daytime.cssClass = 'morning'
    else if $scope.daytime.day
      $scope.daytime.cssClass = 'day'
    else if $scope.daytime.night
      $scope.daytime.cssClass = 'night'
    else
      $scope.daytime.cssClass = 'day'

    $scope.name = window.NodePageOptions
    $scope.currentYear = new Date().getFullYear()


    $scope.contact$inview = false
    $scope.contactInView  = ($index, $inview, $inviewpart)->
      if  not $scope.contact$inview then $scope.contact$inview =  $inview


    $scope.hipchatState = false
    $rootScope.$on "socket:hipchat-state", (ev,val)->  $scope.hipchatState = val
    $scope.searchTerm = ""

    window.test = $scope
  ]