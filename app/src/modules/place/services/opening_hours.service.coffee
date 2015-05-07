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
