angular.module 'huBEERt.place.edit', []
.controller 'EditPlaceCtrl', ($scope, $stateParams, $state, PlaceServ, AddressServ) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.get($scope.id).then (result) ->
        $scope.place = result
    AddressServ.get($scope.id).then (result) ->
        $scope.address = result
    AddressServ.getCitiesList().then (result) ->
        $scope.cities = result

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            AddressServ.save($scope.place, $scope.address).then (result) ->
                $state.go('place.list')
