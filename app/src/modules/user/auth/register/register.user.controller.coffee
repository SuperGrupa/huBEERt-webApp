angular.module 'huBEERt.user.auth.register', []
.controller 'RegisterUserCtrl', ($scope, AuthServ, $state, UserServ) ->

  if (AuthServ.isLoggedIn())
    $state.go('root.main')

  $scope.user = {}
  $scope.formClicked = false
  $scope.emailTaken = false
  $scope.loginTaken = false

  $scope.updateLogin = ->
    if $scope.user.email && !$scope.form['login'].$dirty
      $scope.user.login = $scope.user.email.split("@").shift()

  $scope.register = (user) ->
    UserServ.checkEmail(user.email).then (result) ->
      if result == 'false'
        $scope.emailTaken = true
      else
        $scope.emailTaken = false

      UserServ.checkLogin(user.login).then (result2) ->
        if result2 == 'false'
          $scope.loginTaken = true
        else
          $scope.loginTaken = false

        if !$scope.emailTaken && !$scope.loginTaken
          AuthServ.register(user)

