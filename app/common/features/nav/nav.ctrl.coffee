'use strict'

angular.module 'common.footer'
.controller 'NavCtrl', ($scope, AuthServ) ->
  $scope.logout = ->
    AuthServ.logout()
