angular.module 'huBEERt.place.new', []
.controller 'NewPlaceCtrl', ($scope, PlaceServ, AddressServ, OpeningHoursServ, AlertsServ, $state, $q) ->

    do $scope.init = () ->
        AddressServ.getCitiesList().then (result) ->
            $scope.cities = result
        OpeningHoursServ.getDaysList().then (result) ->
            $scope.days = result
            $scope.addNewOpeningHour()

        $scope.place = {}
        $scope.address = {}
        $scope.opening_hours = []
                
        $scope.visibility = {}
        $scope.days = []

    $scope.districtsUpdate = () ->
        AddressServ.getDistrictsList($scope.address.city.id).then (result) ->
            $scope.districts = result
            $scope.visibility =
                district: true,
                street: false

    $scope.streetsUpdate = () ->
        AddressServ.getStreetsList($scope.address.district.id).then (result) ->
            $scope.streets = result
            $scope.visibility.street = true

    $scope.addNewOpeningHour = () ->
        $scope.opening_hours.push
            from: "17:00",
            to: "01:00",
            day_from: $scope.days[0],
            day_to: $scope.days[0]
    
    $scope.filterOpeningHours = () ->
        opening_hours = $scope.opening_hours
        for hour in opening_hours
            if hour.day_from.id > hour.day_to.id
                AlertsServ.logError('Dzień do nie może poprzedzać dnia od')
                return false
            hour.days = _.filter $scope.days, (day) ->
                return day.id >= hour.day_from.id && day.id <= hour.day_to.id

        # sprawdzenie, czy żaden dzień nie jest powtórzony
        days = []
        _.each $scope.days, (day) ->
            days[day.id] = 0
        
        _.each opening_hours, (hour) ->
            _.each _.values(_.pluck(hour.days, 'id')), (id) ->
                ++days[id]
        
        if _.some(days, (day) -> day > 1)
            AlertsServ.logError('Dzień nie może mieć wielu godzin otwarcia')
            return false
        
        $scope.opening_hours = _.map opening_hours, (hour) -> { from: hour.from, to: hour.to, days: hour.days }
        return true

    $scope.save = (place) ->
        return unless $scope.filterOpeningHours()
        
        PlaceServ.saveOne(place).then (place) ->
            address_saved = AddressServ.save(place.id, $scope.address, 'post')
            opening_hours_saved = OpeningHoursServ.save(place.id, $scope.opening_hours)
            
            $q.all([address_saved, opening_hours_saved]).then () ->
                $state.go('place.show', { id: place.id })
