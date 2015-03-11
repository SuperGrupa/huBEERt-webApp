'use strict'

###*
# @ngdoc function
# @name websiteApp.controller:AboutCtrl
# @description
# # AboutCtrl
# Controller of the websiteApp
###

angular.module('websiteApp').controller 'AboutCtrl', ($scope, $http) ->
  $scope.awesomeThings = [
    'HTML5 Boilerplate'
    'AngularJS'
    'Karma'
  ]

  $scope.messageFromGrape = ''

  $http.get('http://localhost:3000/api/v1/hello').
	  success (data, status, headers, config) ->
	  	$scope.messageFromGrape = data
	  .error (data, status, headers, config) ->

  return
