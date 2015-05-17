angular.module 'huBEERt.place.address', []
.service 'AddressServ', ($q, Restangular, AlertsServ, $http) ->

    cities = []

    get: (id) ->
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
    
    getCitiesList: ->
        deferred = $q.defer()
        Restangular.all('cities').getList().then (result) ->
            deferred.resolve(result)
        , (err) ->
            AlertsServ.logError(err)
            deferred.reject(err)
        deferred.promise
    
    getDistrictsList: (city_id) ->
        deferred = $q.defer()
        Restangular.one('cities', city_id).customGET('districts').then (result) ->
            deferred.resolve(result)
        , (error) ->
            AlertsServ.logError(error)
            deferred.reject(error)
        deferred.promise
    
    getStreetsList: (district_id) ->
        deferred = $q.defer()
        Restangular.one('districts', district_id).customGET('streets').then (result) ->
            deferred.resolve(result)
        , (error) ->
            AlertsServ.logError(error)
            deferred.reject(error)
        deferred.promise
    
    save: (place_id, address, method = 'patch') ->
        address_to_post =
            street: address.street,
            postcode: address.postcode
    
        deferred = $q.defer()
        if method == 'post'
            Restangular.one('places', place_id).all('address').post(address: address_to_post).then (result) ->
                deferred.resolve(result)
            , (error) ->
                AlertsServ.logError(error)
                deferred.reject(error)
        else
            address.patch().then (result) ->
                deferred.resolve(result)
            , (error) ->
                AlertsServ.logError(error)
                deferred.reject(error)
        deferred.promise
