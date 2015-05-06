angular.module 'huBEERt.place.address', []
.service 'AddressServ', ($q, Restangular, AlertsServ, $http) ->

    getOne: (id) ->
        deferred = $q.defer()
        if _.isNaN(id) || _.isUndefined(id)
            deferred.resolve({})
        else
            Restangular.one('places', id).customGET('address').then (result) ->
                deferred.resolve(result)
            , (error) ->
                AlertsServ.logError(error)
                deferred.reject(error)
        deferred.promise
