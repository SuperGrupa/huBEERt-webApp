angular.module 'huBEERt.place.new', []
.controller 'NewPlaceCtrl', ($scope, PlaceServ, AddressServ, $state) ->

    do $scope.init = () ->
        AddressServ.getCitiesList().then (result) ->
            $scope.cities = result
            $scope.place = {}
            $scope.visibility = {}

    $scope.districtsUpdate = () ->
        AddressServ.getDistrictsList($scope.address.city.id).then (result) ->
            $scope.districts = result
            $scope.address.district = $scope.districts[0]
            $scope.visibility.district = true

    $scope.streetsUpdate = () ->
        AddressServ.getStreetsList($scope.address.district.id).then (result) ->
            $scope.streets = result
            $scope.address.street = $scope.streets[0]
            $scope.visibility.street = true

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $state.go('place.show', { id: result.id })
