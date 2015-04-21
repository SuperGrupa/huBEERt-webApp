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
  'common.directives.enterToSave'
  'common.directives.focusOn'
  'common.directives.liveEdit'
]
angular.module 'common.filters', [
  'common.filters.capitalize'
]
angular.module 'common.services', [
   'common.services.alerts'
]
angular.module 'common.interceptors', []
