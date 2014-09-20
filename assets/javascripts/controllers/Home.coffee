define ['c/controllers'], (controllers)->
  controllers.controller 'Home', ['$scope','$rootScope', 'socket','$location','$document',($scope,$rootScope, socket,$location,$document)->

    $scope.msg = "Test"
    $rootScope.$on "socket:msg", (ev,val)->
      console.log(val)
      $scope.msg = val.message

  ]