angular.module 'huBEERt.user.new', []
.controller 'EditUserCtrl', ($scope, UserServ, $state) ->
  $scope.id = parseInt($stateParams.id)

  UserServ.getOne($scope.id).then (result) ->
    $scope.user = result

  $scope.save = (user) ->
    UserServ.saveOne(user).then (result) ->
      $state.go('user.show', {id: result.id})


