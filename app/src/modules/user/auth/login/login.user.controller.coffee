angular.module 'huBEERt.user.auth.login', []
.controller 'LoginUserCtrl', ($scope, AuthServ) ->

  $scope.user = {}

  $scope.login = (user) ->
    AuthServ.login(user)

