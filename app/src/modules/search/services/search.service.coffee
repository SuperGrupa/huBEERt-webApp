angular.module 'huBEERt.search.input'
.service 'SearchServ', ($q, Restangular, AlertsServ, $http) ->
    
    found_places = []

    search: (query, city) ->
        Restangular.all('').customGET('', { q: query, city: city }).then (result) ->
            found_places = result
        , (error) ->
            AlertsServ.logError(error)

    getFoundPlaces: () ->
        found_places
