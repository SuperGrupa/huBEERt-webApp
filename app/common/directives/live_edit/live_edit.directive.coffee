angular.module 'common.directives.liveEdit'

.directive 'liveEdit', ->
  restrict: 'AE'
  replace: true
  scope:
    field: '='
    onSave: '&'
  templateUrl: 'templates/common/directives/live_edit/live_edit.directive.html'

  link: (scope, elem, attrs) ->
    scope.save = ->
      reverseEditEnabled()
      scope.onSave()

    scope.startEditing = ->
      reverseEditEnabled()
      scope.focusInput=true

    reverseEditEnabled = ->
      scope.editEnabled = !scope.editEnabled
