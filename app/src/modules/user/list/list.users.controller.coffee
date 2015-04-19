angular.module 'huBEERt.user.list', []
.controller 'ListUsersCtrl', ($scope, UserServ) ->

  UserServ.getAll().then (result) ->
    $scope.users = result

  $scope.removeUser = (user) ->
    UserServ.removeOne(user)

  $scope.unhideUser = (user) ->
    UserServ.unhideOne(user)
