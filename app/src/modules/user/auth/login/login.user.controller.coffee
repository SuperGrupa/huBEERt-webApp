angular.module 'huBEERt.user.auth.login', []
.controller 'LoginUserCtrl', ($scope, AuthServ) ->

  $scope.user = {}

  $scope.asd = AuthServ.currentUser
  console.log  $scope.asd
  $scope.$watch (->
    AuthServ.currentUser
  ), ((data) ->
    $scope.asd = currentUser
  ), true
  $scope.login = (user) ->
    AuthServ.login(user).then ->
      console.log  AuthServ.currentUser

