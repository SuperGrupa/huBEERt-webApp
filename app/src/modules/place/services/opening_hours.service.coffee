angular.module 'huBEERt.place.opening_hours', []
.service 'OpeningHoursServ', ($q, Restangular, AlertsServ, $http) ->

    get: (id) ->
        deferred = $q.defer()
        if _.isNaN(id) || _.isUndefined(id)
            deferred.resolve({})
        else
            Restangular.one('places', id).getList('opening_hours').then (result) ->
                deferred.resolve(result)
            , (error) ->
                AlertsServ.logError(error)
                deferred.reject(error)
        deferred.promise

    getDaysList: () ->
        deferred = $q.defer()
        Restangular.all('opening_hours').customGET('week_days').then (result) ->
            deferred.resolve(result)
        , (error) ->
            AlertsServ.logError(error)
            deferred.reject(error)
        deferred.promise
    
    save: (place_id, opening_hours) ->
        console.log opening_hours
    
        deferred = $q.defer()
        if opening_hours.length == 0
            deferred.resolve({})
        else
            Restangular.one('places', place_id).all('opening_hours')
                       .post(opening_hours: opening_hours).then (result) ->
                deferred.resolve(result)
            , (error) ->
                AlertsServ.logError(error)
                deferred.reject(error)
        deferred.promise
