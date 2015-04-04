angular.module 'huBEERt.user'
.controller 'UserCtrl', ($scope, Restangular, UserServ) ->
  UserServ.getAll().then (result) ->
    console.log result
