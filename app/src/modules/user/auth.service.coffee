angular.module 'huBEERt.user.auth'
.service 'AuthServ', ($q, Restangular, AlertsServ, $state, tokenInterceptor, store) ->

  isLoggedIn: ->
    if store.get('token')
      true
    else
      false

  getCurrentUser: ->
    user =
      email: store.get('userEmail')
      id: store.get('userId')

  login: (user) ->
    deferred = $q.defer()
    Restangular.all('auth').all('login').post(user).then (result) ->
      if result.token
        tokenInterceptor.setToken(result.token)
        store.set('userId', result.id)
        store.set('userEmail', result.email)
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
      tokenInterceptor.deleteToken()
      store.remove('userId')
      store.remove('userEmail')
      $state.go('root.main').then ->
        AlertsServ.logSuccess('Wylogowano pomyślnie')
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise



