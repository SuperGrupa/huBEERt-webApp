'use strict'

angular.module 'common.footer'
.controller 'NavCtrl', ($scope, AuthServ) ->
  $scope.$watch AuthServ.isLoggedIn, (isLoggedIn) ->
    $scope.isLoggedIn = isLoggedIn
    $scope.currentUser = AuthServ.getCurrentUser()

  $scope.logout = ->
    AuthServ.logout()
