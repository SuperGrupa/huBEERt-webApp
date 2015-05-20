angular.module 'huBEERt.place.list', []
.controller 'ListPlacesCtrl', ($scope, PlaceServ) ->

    PlaceServ.getAll().then (result) ->
        $scope.places = result

    $scope.removePlace = (place) ->
        PlaceServ.removeOne(place)
        $scope.places[findIndexOf(place)].hidden = true

    $scope.unhidePlace = (place) ->
        PlaceServ.unhideOne(place)
        $scope.places[findIndexOf(place)].hidden = false

    findIndexOf = (place) ->
        _.map($scope.places, (p) -> p.id).indexOf(place.id)
