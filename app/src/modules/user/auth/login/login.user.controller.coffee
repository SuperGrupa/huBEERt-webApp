angular.module 'huBEERt.user.auth.login', []
.controller 'LoginUserCtrl', ($scope, AuthServ, $state) ->

  if (AuthServ.isLoggedIn())
    $state.go('root.main')

  $scope.formClicked = false

  $scope.user = {}

  $scope.login = (user) ->
    AuthServ.login(user)

