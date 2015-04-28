angular.module 'huBEERt.user.auth.login', []
.controller 'LoginUserCtrl', ($scope, AuthServ, $state) ->

  $scope.user = {}

  $scope.login = (user) ->
    AuthServ.login(user).then (result) ->
      if result.authentication_token
        if $state.previous.name
          $state.go($state.previous)
        else
          $state.go('root.main')

