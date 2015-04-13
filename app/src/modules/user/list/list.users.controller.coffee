angular.module 'huBEERt.user.list', []
.controller 'ListUsersCtrl', ($scope, UserServ) ->

  UserServ.getAll().then (result) ->
    $scope.users = result

  $scope.removeUser = (user) ->
    UserServ.removeOne(user).then (result) ->
      user = result;

  $scope.unhideUser = (user) ->
    UserServ.unhideOne(user).then (result) ->
      user = result;
