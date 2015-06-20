angular.module 'huBEERt.main'
.controller 'MainCtrl', ($scope, AddressServ) ->

    do ->
        AddressServ.getCitiesList().then (result) ->
            $scope.cities = result
            $scope.city = _.first $scope.cities
