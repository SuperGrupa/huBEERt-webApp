angular.module 'huBEERt.user.auth'
.service 'AuthServ', ($q, Restangular, AlertsServ, store) ->

  currentUser = {}

  isAuthenticated: ->
    if currentUser
      true
    else
      false

  getCurrentUser: ->
    currentUser

  login: (user) ->
    deferred = $q.defer()
    Restangular.all('auth').all('login').post(user).then (result) ->
      store.set('authentication_token', result.authentication_token)
      currentUser = result
      AlertsServ.logSuccess("Zalogowano pomyślnie.")
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise



