'use strict'

###*
# @ngdoc function
# @name websiteApp.controller:MainCtrl
# @description
# # MainCtrl
# Controller of the websiteApp
###

angular.module('websiteApp').controller 'MainCtrl', ($scope) ->
  $scope.awesomeThings = [
    'HTML5 Boilerplate'
    'AngularJS'
    'Karma'
  ]
  return
