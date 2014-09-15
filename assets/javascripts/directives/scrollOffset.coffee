define ['./directives'], (module)->
  module.directive "scrollOffset", ($window) ->
    (scope, element, attrs) ->
      el = element
      offset = attrs?.scrollOffset ? attrs?.offset ? 50
      cssClass = attrs.scrollOffsetToggleClass ? 'undefined'
      action = attrs?.action ? (element,bool)->
        if bool
          element.addClass(cssClass)
        else
          element.removeClass(cssClass)


      angular.element($window).bind "scroll", ->

        top = el[0].getBoundingClientRect().top
        offsetPos = $window.scrollY - top
        if offsetPos > offset
          action(element,true,offsetPos,offset)
        else
          action(element,false,offsetPos,offset)
        return

      return
