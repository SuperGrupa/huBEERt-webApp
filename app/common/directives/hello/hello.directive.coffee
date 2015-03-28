'use strict'

angular.module 'common.directives.helloDirective'
.directive 'helloDirective', ->
  restrict: 'AE'
  replace: true
  templateUrl: 'templates/common/directives/hello/hello.directive.html'
  link: (scope, element, attrs) ->
    scope.val = 'Hello directive'
