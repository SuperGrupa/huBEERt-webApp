angular.module 'huBEERt.user.auth'
.service 'AuthServ', ($q, Restangular, AlertsServ, $state) ->

  login: (user) ->
    deferred = $q.defer()
    Restangular.all('auth').one('login').post(user).then (result) ->
      AlertsServ.logSuccess("Zalogowano pomyślnie.")
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise



