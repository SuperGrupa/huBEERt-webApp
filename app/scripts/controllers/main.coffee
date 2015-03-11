'use strict'

###*
# @ngdoc function
# @name websiteApp.controller:MainCtrl
# @description
# # MainCtrl
# Controller of the websiteApp
###

angular.module('websiteApp').controller 'MainCtrl', [ 
 '$scope', '$http',
 ($scope, $http) ->
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

]


