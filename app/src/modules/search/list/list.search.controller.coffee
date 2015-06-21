angular.module 'huBEERt.search.list', []
.controller 'ListSearchCtrl', ($scope, $stateParams, SearchServ) ->

    do ->
        console.log $stateParams
        $scope.places = SearchServ.getFoundPlaces()
