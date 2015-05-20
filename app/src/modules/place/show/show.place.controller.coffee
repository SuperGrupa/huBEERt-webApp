angular.module 'huBEERt.place.show', []
.controller 'ShowPlaceCtrl', ($scope, $stateParams, PlaceServ, AddressServ, OpeningHoursServ) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.get($scope.id).then (result) ->
        $scope.place = result
    AddressServ.get($scope.id).then (result) ->
        $scope.address = result
    OpeningHoursServ.get($scope.id).then (result) ->
        $scope.opening_hours = result

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.place = result
