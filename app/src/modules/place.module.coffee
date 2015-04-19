'use strict'

angular.module 'huBEERt.place', ['ui.bootstrap', 'ui.router', 'huBEERt.place.list', 'huBEERt.place.show']
.config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
        .state('place',
            url: '/place'
            abstract: true
            templateUrl: 'templates/src/modules/place/place.html'
            controller: 'PlaceCtrl'
            parent: 'root'
        )
        .state('place.list',
            url: 's'
            templateUrl: 'templates/src/modules/place/list/list.places.html'
            controller: 'ListPlacesCtrl'
        )
        .state('place.show',
            url: '/:id'
            templateUrl: 'templates/src/modules/place/show/show.place.html'
            controller: 'ShowPlaceCtrl'
        )
