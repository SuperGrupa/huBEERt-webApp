angular.module 'huBEERt.place.show', []
.controller 'ShowPlaceCtrl', ($scope, $stateParams, PlaceServ) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.getOne($scope.id).then (result) ->
        $scope.place = result

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.place = result
