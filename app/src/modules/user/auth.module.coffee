'use strict'

angular.module 'huBEERt.user.auth', ['huBEERt.user.auth.login']
.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('auth',
      url: ''
      abstract: true
      templateUrl: 'templates/src/modules/user/auth/auth.html'
      parent: 'user'
    )
    .state('auth.login',
      url: '^/login'
      templateUrl: 'templates/src/modules/user/auth/login/login.user.html'
      controller: 'LoginUserCtrl'
    )
