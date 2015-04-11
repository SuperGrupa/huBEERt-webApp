angular.module 'getnoticed.directives'

.directive 'yourProfileInput', ->
  restrict: 'AE'
  replace: true
  scope:
    field: '='
    onSave: '&'
  controller: 'YourProfileCtrl'
  templateUrl: 'templates/directives/your_profile_input.html'

  link: (scope, elem, attrs) ->
    scope.save = ->
      reverseEditEnabled()
      scope.onSave()

    scope.startEditing = ->
      reverseEditEnabled()
      scope.focusInput=true

    reverseEditEnabled = ->
      scope.editEnabled = !scope.editEnabled
