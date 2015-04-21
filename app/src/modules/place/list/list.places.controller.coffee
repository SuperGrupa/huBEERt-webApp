angular.module 'huBEERt.place.list', []
.controller 'ListPlacesCtrl', ($scope, PlaceServ) ->

    PlaceServ.getAll().then (result) ->
        $scope.places = result

    $scope.removePlace = (place) ->
        PlaceServ.removeOne(place).then (result) ->
            place = result;

    $scope.unhidePlace = (place) ->
        PlaceServ.unhideOne(place).then (result) ->
            place = result;
