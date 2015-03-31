# global routes
angular.module 'huBEERt'

.config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state('root',
      templateUrl: 'templates/src/root.html'
      views:
        '':
          templateUrl: 'templates/src/root.html'
        'footer':
          templateUrl: 'templates/common/features/footer/footer.html'
          controller: 'FooterCtrl'
          controllerAs: 'footer'
        'nav':
          templateUrl: 'templates/common/features/nav/nav.html'
          controller: 'NavCtrl'
          controllerAs: 'nav'
    )

