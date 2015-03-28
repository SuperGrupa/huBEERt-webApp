angular.module 'huBEERt.main'
.controller 'MainCtrl', ($scope, Restangular) ->
  this.val = 'Ya Man'

  Restangular.one('hello').get().then (result) ->
    console.log result
    $scope.hello = result
  , (err) ->
    console.log err

