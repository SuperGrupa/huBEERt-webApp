'use strict'

angular.module 'huBEERt.user', ['ui.bootstrap', 'ui.router']
.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('user',
      url: '/user'
      abstract: true
      templateUrl: 'templates/src/modules/user/user.html'
      controller: 'UserCtrl'
      parent: 'root'
    )
    .state('user.list',
      url: '/list'
      templateUrl: 'templates/src/modules/user/list/users.html'
      controller: 'UsersCtrl'
    )
    .state('user.show',
      url: '/:id'
      templateUrl: 'templates/src/modules/user/show/user.html'
      controller: 'UserCtrl'
    )
    .state('user.new',
      url: '/user/new'
      templateUrl: 'templates/src/modules/user/new/new.user.html'
      controller: 'NewUserCtrl'
    )

