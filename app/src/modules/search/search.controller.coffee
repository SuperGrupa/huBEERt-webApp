angular.module 'huBEERt.search'
.controller 'SearchCtrl', ($scope, $stateParams, AddressServ) ->

    do ->
        AddressServ.getCitiesList().then (result) ->
            $scope.cities = result
            $scope.city = _.first $scope.cities
