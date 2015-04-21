angular.module 'huBEERt.place.new', []
.controller 'NewPlaceCtrl', ($scope, PlaceServ, $state) ->

    $scope.place = {}

    $scope.save = (place) ->
        PlaceServ.saveOne(place).then (result) ->
            $state.go('place.show', { id: result.id })
