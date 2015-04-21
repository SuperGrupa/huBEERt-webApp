angular.module 'huBEERt.place.edit', []
.controller 'EditPlaceCtrl', ($scope, PlaceServ, $stateParams) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.getOne($scope.id).then (result) ->
        $scope.place = result
        delete $scope.place.opening_hours
        delete $scope.place.address

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.place = result
