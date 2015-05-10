angular.module 'huBEERt.place.new', []
.controller 'NewPlaceCtrl', ($scope, PlaceServ, AddressServ, $state) ->

    do $scope.init = () ->
        AddressServ.getCitiesList().then (result) ->
            $scope.cities = result
            $scope.address = { city: $scope.cities[0] }
            $scope.place = {}

    $scope.districtsUpdate = () ->
        AddressServ.getDistrictsList($scope.address.city.id).then (result) ->
            $scope.districts = result
            $scope.address.district = $scope.districts[0]
            $scope.districtsVisibility = true

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $state.go('place.show', { id: result.id })
