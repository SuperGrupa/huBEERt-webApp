angular.module 'huBEERt.user'
.service 'UserServ', ($q, Restangular, AlertsServ) ->
  users = []

  updateAll: ->
    Restangular.all('users').getList().then (result) ->
      users = result
    , (err) ->
      AlertsServ.logError(err)

  getAll: ->
    deferred = $q.defer()
    if _.isEmpty(users)
      this.updateAll().then ->
        deferred.resolve(users)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    else
      deferred.resolve(users)
    deferred.promise

  getOne: (id) ->
    deferred = $q.defer()
    if _.isUndefined(id) || _.isNaN(id)
      deferred.resolve({})
    else
      Restangular.one('users', id).get().then (result) ->
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise

  saveOne: (user) ->
    deferred = $q.defer()
    if _.isUndefined(user.id) || _.isNaN(user.id)
      Restangular.all('users').post(user: user).then (result) ->
        users.push result
        AlertsServ.logSuccess("Rejestracja zakończona sukcesem")
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    else
      user.patch().then (result) ->
        index = _.map(users, (u) -> u.id).indexOf(result.id)
        users[index] = result
        AlertsServ.logSuccess("Edycja zakończona sukcesem")
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise

  removeOne: (user) ->
    deferred = $q.defer()
    if _.isUndefined(user.id) || _.isNaN(user.id)
      AlertsServ.logError(err)
      deferred.reject(err)
    else
      index = _.map(users, (u) -> u.id).indexOf(user.id)
      user.remove().then (result) ->
        AlertsServ.logSuccess('Użytkownik został usunięty')
        users[index].hidden = true
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        console.log err
        deferred.reject(err)
    deferred.promise

  unhideOne: (user) ->
    deferred = $q.defer()
    if _.isUndefined(user.id) || _.isNaN(user.id)
      AlertsServ.logError(err)
      deferred.reject(err)
    else
      index = _.map(users, (u) -> u.id).indexOf(user.id)
      user.put().then (result) ->
        AlertsServ.logSuccess('Użytkownik został przywrócony')
        users[index].hidden = false
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise

  checkEmail: (email) ->
    deferred = $q.defer()
    Restangular.all('users').all('check_email').post(email: email).then (result) ->
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise

  checkLogin: (login) ->
    deferred = $q.defer()
    Restangular.all('users').all('check_login').post(login: login).then (result) ->
      deferred.resolve(result)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise



