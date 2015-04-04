angular.module 'huBEERt.user.list', []
.controller 'ListUsersCtrl', ($scope, UserServ) ->

  UserServ.getAll().then (result) ->
    $scope.users = result
