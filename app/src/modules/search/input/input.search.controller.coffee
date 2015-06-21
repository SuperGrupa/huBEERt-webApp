angular.module 'huBEERt.search.input', []
.controller 'InputSearchCtrl', ($scope, $state, AddressServ, SearchServ) ->

    do ->
        AddressServ.getCitiesList().then (result) ->
            $scope.cities = result
            $scope.city = _.first $scope.cities
            $scope.q = ''

    $scope.search = () ->
        SearchServ.search($scope.q, $scope.city.name).then (result) ->
            $state.go('search.list', { q: $scope.q, city: $scope.city.name })
