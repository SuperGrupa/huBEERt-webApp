'use strict'

angular.module 'huBEERt.search', ['ui.bootstrap', 'ui.router', 'huBEERt.search.input', 'huBEERt.search.list']
.config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
        .state('search',
            url: '/'
            abstract: true
            templateUrl: 'templates/src/modules/search/search.html'
            controller: 'SearchCtrl'
            parent: 'root'
        )
        .state('search.input',
            url: ''
            templateUrl: 'templates/src/modules/search/input/input.search.html'
            controller: 'InputSearchCtrl'
        )
        .state('search.list',
            url: 'search?q&city'
            templateUrl: 'templates/src/modules/search/list/list.search.html'
            controller: 'ListSearchCtrl'
        )
