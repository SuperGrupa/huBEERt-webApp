angular.module 'huBEERt.place.new', []
.controller 'NewPlaceCtrl', ($scope, PlaceServ, AddressServ, OpeningHoursServ, $state, $q) ->

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

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (place) ->
            AddressServ.save(place.id, $scope.address, 'post').then (address) ->
                $state.go('place.show', { id: place.id })
