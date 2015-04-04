# initialize all modules
angular.module 'common', [
  'common.directives'
  'common.filters'
  'common.services'
  'common.interceptors'
  'common.footer'
  'common.nav'
]
angular.module 'common.directives', [
  'common.directives.helloDirective'
]
angular.module 'common.filters', [
  'common.filters.helloFilter'
]
angular.module 'common.services', [
   'common.services.alerts'
]
angular.module 'common.interceptors', []
