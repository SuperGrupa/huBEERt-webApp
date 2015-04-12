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
    this.updateAll().then ->
      deferred.resolve(users)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
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
        users.splice(index,1)
        AlertsServ.logSuccess('Użytkownik został usunięty')
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
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
        users.splice(index,1)
        AlertsServ.logSuccess('Użytkownik został przywrócony')
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise



