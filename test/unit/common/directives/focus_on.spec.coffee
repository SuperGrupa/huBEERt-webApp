'use strict'

describe 'Directive: focusOn', ->
  beforeEach module 'common.directives.focusOn'
  compile = {}
  rootScope = {}
  element = {}
  scope = {}
  $timeout = {}

  beforeEach ->
    inject (_$compile_, _$rootScope_, _$timeout_) ->
      $timeout = _$timeout_
      compile = _$compile_
      rootScope = _$rootScope_
      scope = rootScope
      scope.focusInput = false
      element = angular.element('<input type="text" focus-on="focusInput"></input>')
      compile(element)(scope)
      angular.element(document.body).append(element)
      scope.$digest()

  describe 'input', ->
    it 'should be focused when atrr variable is true', ->
      scope.focusInput = true
      scope.$digest()
      $timeout ->
        expect(element[0]).toBe document.activeElement
      $timeout.flush()
