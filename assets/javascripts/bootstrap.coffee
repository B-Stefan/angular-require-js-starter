define ['ang','app'], (angular) ->
  window.setTimeout(()->
    angular.bootstrap document, ['app']
  ,1)


