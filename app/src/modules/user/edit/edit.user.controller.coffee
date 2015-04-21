angular.module 'huBEERt.user.edit', []
.controller 'EditUserCtrl', ($scope, UserServ, $stateParams) ->
  $scope.id = parseInt($stateParams.id)

  UserServ.getOne($scope.id).then (result) ->
    $scope.user = result

  $scope.save = (user) ->
    UserServ.saveOne(user).then (result) ->
      $scope.user = result

