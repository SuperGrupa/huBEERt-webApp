'use strict'

angular.module 'huBEERt.search', ['ui.bootstrap', 'ui.router']
.config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
        .state('search',
            url: '/'
            templateUrl: 'templates/src/modules/search/search.html'
            controller: 'SearchCtrl'
            parent: 'root'
        )
