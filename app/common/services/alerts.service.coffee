'use strict'

angular.module 'common.services.alerts', []
.service 'AlertsServ', ->
  # toastr setting.
  toastr.options =
    "closeButton": true
    "positionClass": "toast-bottom-right"
    "timeOut": "3000"

  logIt = (message, type) ->
    toastr[type](message)

  return {
    log: (message) ->
      logIt(message, 'info')
      return

    logWarning: (message) ->
      logIt(message, 'warning')
      return

    logSuccess: (message) ->
      logIt(message, 'success')
      return

    logError: (message) ->
      logIt(message, 'error')
      return
  }
