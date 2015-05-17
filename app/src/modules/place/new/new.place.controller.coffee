angular.module 'huBEERt.place.new', []
.controller 'NewPlaceCtrl', ($scope, PlaceServ, AddressServ, $state, $q) ->

    do $scope.init = () ->
        AddressServ.getCitiesList().then (result) ->
            $scope.cities = result

        $scope.place = {}
        $scope.visibility = {}
        $scope.address = {}

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

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (place) ->
            AddressServ.save(place.id, $scope.address, 'post').then (address) ->
                $state.go('place.show', { id: place.id })

