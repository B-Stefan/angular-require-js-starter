define ['./directives'], (module)->
  module.directive 'staticInclude', ($http, $templateCache, $compile)->
    (scope, element, attrs)->
      templatePath = attrs.staticInclude ? attrs.src;
      $http.get(templatePath, { cache: $templateCache }).success (response)->
        contents = element.html(response).contents();
        $compile(contents)(scope)