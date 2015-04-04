angular.module 'huBEERt.user'
.controller 'UsersCtrl', ($scope, UserServ) ->

  UserServ.getAll().then (result) ->
    $scope.users = result
