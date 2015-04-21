angular.module 'huBEERt.user.new', []
.controller 'NewUserCtrl', ($scope, UserServ, $state) ->

  $scope.user = {}

  $scope.save = (user) ->
    UserServ.saveOne(user).then (result) ->
      $state.go('user.show', {id: result.id})


