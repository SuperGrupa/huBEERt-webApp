angular.module 'huBEERt.auth.login', []
.controller 'LoginUserCtrl', ($scope, AuthServ) ->

  $scope.user = {}

  $scope.login = (user) ->
    AuthServ.login(user).then (result) ->
      if result.status == 200
        $state.go($state.previous)

