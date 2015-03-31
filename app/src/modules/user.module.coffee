'use strict'

angular.module 'huBEERt.user', ['ui.bootstrap', 'ui.router']
.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('root.user',
      url: '/user'
      views:
        '':
          templateUrl: 'templates/src/modules/user/user.html'
          controller: 'UserCtrl'
          controllerAs: 'user'
      data: { requiresLogin: false }
    )
