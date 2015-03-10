'use strict'

###*
# @ngdoc function
# @name websiteApp.controller:AboutCtrl
# @description
# # AboutCtrl
# Controller of the websiteApp
###

angular.module('websiteApp').controller 'AboutCtrl', ($scope) ->
  $scope.awesomeThings = [
    'HTML5 Boilerplate'
    'AngularJS'
    'Karma'
  ]
  return
