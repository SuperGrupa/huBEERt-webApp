'use strict'

angular.module 'huBEERt.place', ['ui.bootstrap', 'ui.router', 'huBEERt.place.list', 'huBEERt.place.show', 'huBEERt.place.new', 'huBEERt.place.edit', 'huBEERt.place.address', 'huBEERt.place.opening_hours']
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
        .state('place.new',
            url: '/new'
            templateUrl: 'templates/src/modules/place/new/new.place.html'
            controller: 'NewPlaceCtrl'
        )
        .state('place.show',
            url: '/:id'
            templateUrl: 'templates/src/modules/place/show/show.place.html'
            controller: 'ShowPlaceCtrl'
        )
        .state('place.edit',
            url: '/:id/edit'
            templateUrl: 'templates/src/modules/place/edit/edit.place.html'
            controller: 'EditPlaceCtrl'
        )
