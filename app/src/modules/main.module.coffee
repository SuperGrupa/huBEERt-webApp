'use strict'

angular.module 'huBEERt.main', ['ui.bootstrap', 'ui.router']
.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('root.main',
      url: '/'
      views:
        '':
          templateUrl: 'templates/src/modules/main/main.html'
          controller: 'MainCtrl'
          controllerAs: 'main'
        'footer':
          templateUrl: 'templates/common/features/footer/footer.html'
          controller: 'FooterCtrl'
          controllerAs: 'footer'
      data: { requiresLogin: false }
    )
