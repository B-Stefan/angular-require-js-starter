define ['c/controllers'], (controllers)->
  controllers.controller 'Home', ['$scope', '$stateParams', ($scope, $stateParams)->
    $scope.list = ['Bob', 'Kai']
    $scope.searchTerm = ""
  ]