angular.module 'huBEERt.place.show', []
.controller 'ShowPlaceCtrl', ($scope, $stateParams, PlaceServ) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.getOne($scope.id).then (result) ->
        $scope.basic_info    = result.basic_info
        $scope.address       = result.address
        $scope.opening_hours = result.opening_hours

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.basic_info = result
