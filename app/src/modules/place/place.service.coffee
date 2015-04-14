angular.module 'huBEERt.place'
.service 'PlaceServ', ($q, Restangular, AlertsServ, $http) ->
  places = []

  updateAll: ->
    Restangular.all('places').getList().then (result) ->
      places = result
    , (err) ->
      AlertsServ.logError(err)

  getAll: ->
    deferred = $q.defer()
    this.updateAll().then ->
      deferred.resolve(places)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise

  getOne: (id) ->
    deferred = $q.defer()
    if _.isUndefined(id) || _.isNaN(id)
      deferred.resolve({})
    else
      Restangular.one('places', id).get().then (result) ->
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise

  saveOne: (place) ->
    deferred = $q.defer()
    if _.isUndefined(place.id) || _.isNaN(place.id)
      Restangular.all('places').post(place: place).then (result) ->
        places.push result
        AlertsServ.logSuccess('Dodanie nowego miejsca zakończone sukcesem')
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    else
      place.patch().then (result) ->
        index = _.map(places, (u) -> u.id).indexOf(result.id)
        places[index] = result
        AlertsServ.logSuccess('Edycja zakończona sukcesem')
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise

  removeOne: (place) ->
    deferred = $q.defer()
    if _.isUndefined(place.id) || _.isNaN(place.id)
      AlertsServ.logError(err)
      deferred.reject(err)
    else
      place.remove().then (result) ->
        AlertsServ.logSuccess('Miejscówka została usunięta')
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        console.log err
        deferred.reject(err)
    deferred.promise

  unhideOne: (place) ->
    deferred = $q.defer()
    if _.isUndefined(place.id) || _.isNaN(place.id)
      AlertsServ.logError(err)
      deferred.reject(err)
    else
      place.put().then (result) ->
        AlertsServ.logSuccess('Miejscówka została przywrócona')
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise
