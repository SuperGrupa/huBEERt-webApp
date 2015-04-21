angular.module 'common.directives.enterToSave', []

.directive  'enterToSave', ->
  link: (scope, element, attrs) ->
    element.bind 'keydown keypress', (event) ->
      if event.which == 13
        scope.$apply ->
          scope.$eval attrs.enterToSave
        event.preventDefault()
