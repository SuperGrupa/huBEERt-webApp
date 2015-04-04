angular.module 'huBEERt'

.config (RestangularProvider, ENV) ->
  RestangularProvider.setBaseUrl(ENV.API_URL)
  RestangularProvider.setRequestSuffix('')

