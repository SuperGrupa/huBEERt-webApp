'use strict'

angular.module 'huBEERt.alerts', ['ui.bootstrap.alert', 'ui.bootstrap.tpls']

app = angular.module 'huBEERt', [
  'common'
  'ngResource'
  'ngAnimate'
  'ui.bootstrap'
  'ui.router'
  'restangular'
  'ngRetina'
  'angular-jwt'
  'angular-storage'
  'ngMessages'
  'huBEERt.config'
  'huBEERt.main'
  'huBEERt.alerts'
]

if Rollbar?
  app.factory '$exceptionHandler', ($log) ->
    (e, cause) ->
      $log.error e.message
      Rollbar.error(e)

window.GLOBALS  ?= {}
