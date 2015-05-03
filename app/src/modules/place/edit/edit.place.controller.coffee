angular.module 'huBEERt.place.edit', []
.controller 'EditPlaceCtrl', ($scope, PlaceServ, $stateParams) ->
    $scope.id = parseInt($stateParams.id)

    PlaceServ.getOne($scope.id).then (result) ->
        $scope.basic_info = result.basic_info

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $scope.place = result.basic_info
