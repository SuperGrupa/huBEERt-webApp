angular.module 'huBEERt.user.show', []
.controller 'ShowUserCtrl', ($scope, $stateParams, UserServ) ->
  $scope.id = parseInt($stateParams.id)

  UserServ.getOne($scope.id).then (result) ->
    $scope.user = result
