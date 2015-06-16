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
    
    validate: (opening_hours, days) ->
        # sprawdź poprawność kolejności dni tygodnia w godzinach otwarcia
        for hour in opening_hours
            if hour.day_from.id > hour.day_to.id
                AlertsServ.logError('Dzień do nie może poprzedzać dnia od')
                return false
            hour.days = _.filter days, (day) ->
                return day.id >= hour.day_from.id && day.id <= hour.day_to.id

        # sprawdzenie, czy żaden dzień nie jest powtórzony
        days_count = []
        _.each days, (day) ->
            days_count[day.id] = 0
        
        _.each opening_hours, (hour) ->
            _.each _.values(_.pluck(hour.days, 'id')), (id) ->
                ++days_count[id]
        
        # jeśli któryś dzień ma więcej niż jedne godziny otwarcia
        if _.some(days_count, (day) -> day > 1)
            AlertsServ.logError('Dzień nie może mieć wielu godzin otwarcia')
            return false
        
        # przygotuj obiekt do wysłania na serwer
        opening_hours = _.map opening_hours, (hour) -> { from: hour.from, to: hour.to, days: hour.days }
        return true
