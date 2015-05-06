angular.module 'huBEERt.place.show', []
.controller 'ShowPlaceCtrl', ($scope, $stateParams, PlaceServ, AddressServ) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.getOne($scope.id).then (result) ->
        $scope.place = result
    AddressServ.getOne($scope.id).then (result) ->
        $scope.address = result

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.place = result
