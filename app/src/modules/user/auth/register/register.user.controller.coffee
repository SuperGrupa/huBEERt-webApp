angular.module 'huBEERt.user.auth.register', []
.controller 'RegisterUserCtrl', ($scope, AuthServ, $state) ->

  if (AuthServ.isLoggedIn())
    $state.go('root.main')

  $scope.user = {}

  $scope.register = (user) ->
    AuthServ.register(user)

