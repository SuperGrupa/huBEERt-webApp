# global routes
angular.module 'huBEERt'

.config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state('root',
      templateUrl: 'templates/src/root.html'
    )
