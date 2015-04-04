'use strict'

angular.module 'huBEERt.user', ['ui.bootstrap', 'ui.router', 'huBEERt.user.show', 'huBEERt.user.new', 'huBEERt.user.list']
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
      url: 's'
      templateUrl: 'templates/src/modules/user/list/list.users.html'
      controller: 'ListUsersCtrl'
    )
    .state('user.show',
      url: '/:id'
      templateUrl: 'templates/src/modules/user/show/show.user.html'
      controller: 'ShowUserCtrl'
    )
    .state('user.new',
      url: '^/register'
      templateUrl: 'templates/src/modules/user/new/new.user.html'
      controller: 'NewUserCtrl'
    )

