angular.module 'huBEERt.user.auth.register', []
.controller 'RegisterUserCtrl', ($scope, AuthServ, $state) ->

  if (AuthServ.isLoggedIn())
    $state.go('root.main')

  $scope.user = {}

  $scope.updateLogin = ->
    if $scope.user.email && !$scope.form['login'].$dirty
      $scope.user.login = $scope.user.email.split("@").shift()


  $scope.register = (user) ->
    AuthServ.register(user)

