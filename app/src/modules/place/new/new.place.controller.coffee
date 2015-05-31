angular.module 'huBEERt.place.new', []
.controller 'NewPlaceCtrl', ($scope, PlaceServ, AddressServ, OpeningHoursServ, AlertsServ, $state, $q) ->

    do ->
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

    $scope.save = (place) ->
        return unless OpeningHoursServ.validate($scope.opening_hours, $scope.days)
        
        PlaceServ.saveOne(place).then (place) ->
            address_saved = AddressServ.save(place.id, $scope.address, 'post')
            opening_hours_saved = OpeningHoursServ.save(place.id, $scope.opening_hours)
            
            $q.all([address_saved, opening_hours_saved]).then () ->
                $state.go('place.show', { id: place.id })
