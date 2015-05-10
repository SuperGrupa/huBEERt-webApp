angular.module 'huBEERt.user.auth'
.service 'AuthServ', ($q, Restangular, AlertsServ, $state, tokenInterceptor) ->

  currentUser = {}

  currentUser: currentUser

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
      if result.authentication_token
        tokenInterceptor.setToken(result.authentication_token)
        currentUser = result
        if $state.previous.name
          $state.go($state.previous).then ->
            AlertsServ.logSuccess("Zalogowano pomyślnie.")
        else
          $state.go('root.main').then ->
            AlertsServ.logSuccess("Zalogowano pomyślnie.")
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise

  logout: ->
    deferred = $q.defer()
    Restangular.all('auth').customDELETE("logout").then (result) ->
      currentUser = {}
      tokenInterceptor.deleteToken()
      $state.go('root.main').then ->
        AlertsServ.logSuccess('Wylogowano pomyślnie')
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise



