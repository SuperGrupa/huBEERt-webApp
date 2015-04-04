'use strict'

angular.module 'huBEERt.user', ['ui.bootstrap', 'ui.router']
.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('root.user',
      url: '/user/:id'
      views:
        '':
          templateUrl: 'templates/src/modules/user/user.html'
          controller: 'UserCtrl'
      data: { requiresLogin: false }
    )
    .state('root.user.new',
      url: '/user/edit'
      views:
        '':
          templateUrl: 'templates/src/modules/user/new/new.user.html'
          controller: 'NewUserCtrl'
      data: { requiresLogin: false }
    )
    .state('root.user.edit',
      url: '/user/new'
      views:
        '':
          templateUrl: 'templates/src/modules/user/edit/edit.user.html'
          controller: 'editUserCtrl'
      data: { requiresLogin: false }
    )
    .state('root.users',
      url: '/users'
      views:
        '':
          templateUrl: 'templates/src/modules/user/users.html'
          controller: 'UsersCtrl'
      data: { requiresLogin: false }
    )
