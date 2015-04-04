angular.module 'huBEERt.user'
.controller 'UserCtrl', ($scope, $stateParams, UserServ) ->
  $scope.id = parseInt($stateParams.id)

  UserServ.getOne($scope.id).then (result) ->
    $scope.user = result
