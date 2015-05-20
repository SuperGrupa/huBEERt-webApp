'use strict'

angular.module 'huBEERt.user', ['ui.bootstrap', 'ui.router', 'huBEERt.user.auth', 'huBEERt.user.show', 'huBEERt.user.list', 'huBEERt.user.edit']
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
      data: { requiresLogin: true }
    )
    .state('user.show',
      url: '/:id'
      templateUrl: 'templates/src/modules/user/show/show.user.html'
      controller: 'ShowUserCtrl'
    )
    .state('user.edit',
      url: '/:id/edit'
      templateUrl: 'templates/src/modules/user/edit/edit.user.html'
      controller: 'EditUserCtrl'
    )
