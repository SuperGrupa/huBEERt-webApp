'use strict'

angular.module 'huBEERt.auth', ['ui.bootstrap', 'ui.router', 'huBEERt.auth.login']
.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('auth',
      url: ''
      abstract: true
      templateUrl: 'templates/src/modules/auth/auth.html'
      parent: 'root'
    )
    .state('auth.login',
      url: '^login'
      templateUrl: 'templates/src/modules/auth/login/login.user.html'
      controller: 'LoginUserCtrl'
    )
