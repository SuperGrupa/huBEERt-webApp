angular.module 'huBEERt.place.edit', []
.controller 'EditPlaceCtrl', ($scope, PlaceServ, $stateParams, $state) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.get($scope.id).then (result) ->
        $scope.place = result

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.place = result
            $state.go('place.list')
