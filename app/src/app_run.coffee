angular.module 'huBEERt'

.config (RestangularProvider, ENV) ->
  RestangularProvider.setBaseUrl(ENV.API_URL)
  RestangularProvider.setRequestSuffix('')
  RestangularProvider.setDefaultHeaders({'Content-Type': 'application/json'});

.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.defaults.transformResponse.push (responseData) ->
      convertDateStringsToDates responseData
      responseData

]

.run ($rootScope, $state) ->
  $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState) ->
    $state.previous = fromState;

convertDateStringsToDates = (input) ->

  # Ignore things that aren't objects.
  return input  if typeof input isnt "object"
  for key of input
    continue  unless input.hasOwnProperty(key)
    value = input[key]
    match = undefined

    # Check for string properties which look like dates.
    if typeof value is "string" and (match = value.match(regexIso8601))
      milliseconds = Date.parse(match[0])
      input[key] = new Date(milliseconds)  unless isNaN(milliseconds)

      # Recurse into object
    else convertDateStringsToDates value  if typeof value is "object"
  return
regexIso8601 = /^(\d{4}|\+\d{6})(?:-(\d{2})(?:-(\d{2})(?:T(\d{2}):(\d{2}):(\d{2})\.(\d{1,})(Z|([\-+])(\d{2}):(\d{2}))?)?)?)?$/

