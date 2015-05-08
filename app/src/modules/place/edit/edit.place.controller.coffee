angular.module 'huBEERt.place.edit', []
.controller 'EditPlaceCtrl', ($scope, PlaceServ, $stateParams) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.get($scope.id).then (result) ->
        $scope.place = result

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.place = result
