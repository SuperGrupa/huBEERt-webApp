'use strict'

angular.module 'common.filters.helloFilter', []
.filter 'helloFilter', ->
  (input) ->
    input += ' Hello Filter'
