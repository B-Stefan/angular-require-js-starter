define ['./controllers'], (controllers)->

  controllers.controller 'Login', ['$scope','$log', 'serviceStackRestClient',($scope,$log,serviceStackRestClient)->

    console.log(serviceStackRestClient)
    $scope.login = ()=>
      promise = serviceStackRestClient.post('auth',
        UserName: $scope.credentials.userName
        Password: $scope.credentials.password
      )
      promise.success ()-> $scope.state = true
      promise.error ()-> $scope.state = false
      promise.validation ()->
        $log.log(arguments)
        $scope.state = false
  ]



