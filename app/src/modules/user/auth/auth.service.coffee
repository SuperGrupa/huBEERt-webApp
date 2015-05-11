angular.module 'huBEERt.user.auth'
.service 'AuthServ', ($q, Restangular, AlertsServ, $state, tokenInterceptor, store) ->

  storeUser = (user) ->
    store.set('userId', user.id)
    store.set('userEmail', user.email)
    store.set('userLogin', user.login)
    store.set('userFirstname', user.firstname)
    store.set('userLastname', user.lastname)

  removeUser = ->
    store.remove('userId')
    store.remove('userEmail')
    store.remove('userLogin')
    store.remove('userFirstname')
    store.remove('userLastname')

  isLoggedIn: ->
    if store.get('token')
      true
    else
      false

  getCurrentUser: ->
    user =
      id: store.get('userId')
      email: store.get('userEmail')
      login: store.get('userLogin')
      firstname: store.get('userFirstname')
      lastname: store.get('userLastname')

  login: (user) ->
    deferred = $q.defer()
    Restangular.all('auth').all('login').post(user).then (result) ->
      if result.token
        tokenInterceptor.setToken(result.token)
        storeUser(result)

        if $state.previous.name
          $state.go($state.previous)
        else
          $state.go('root.main')

        AlertsServ.logSuccess("Zalogowano pomyślnie.")
      else
        AlertsServ.logError(result.error)
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise

  register: (user) ->
    deferred = $q.defer()
    Restangular.all('auth').all('register').post(user).then (result) ->
      if result.token
        tokenInterceptor.setToken(result.token)
        storeUser(result)

        if $state.previous.name
          $state.go($state.previous)
        else
          $state.go('root.main')

        AlertsServ.logSuccess("Zarejestrowano pomyślnie.")
      else
        AlertsServ.logError(result.error)
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise

  logout: ->
    deferred = $q.defer()
    Restangular.all('auth').customDELETE("logout").then (result) ->
      tokenInterceptor.deleteToken()
      removeUser()

      $state.go('root.main').then ->
        AlertsServ.logSuccess('Wylogowano pomyślnie')
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise



