angular.module 'common.directives.focusOn', []

.directive 'focusOn', ($timeout, $parse) ->
  link: (scope, element, attrs) ->
    model = $parse(attrs.focusOn)
    scope.$watch model, (value) ->
      if value == true
        $timeout ->
          element[0].focus()
    element.bind 'blur', ->
      scope.$apply model.assign(scope, false)

