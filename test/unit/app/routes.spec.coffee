'use strict'

describe 'Directive: helloDirective', ->
  beforeEach module('templates')
  beforeEach module('huBEERt')
  location = {}
  rootScope = {}
  state = {}

  beforeEach ->
    inject (_$location_, _$rootScope_, _$state_) ->
      location = _$location_
      rootScope = _$rootScope_
      state = _$state_

  describe 'root state', ->
    it 'should have a tamplateUrl set', ->
      config = state.get('root')
      expect(config.templateUrl).toBe 'templates/src/root.html'

    it 'should load the index page on successful load of /', ->
      location.path('/')
      rootScope.$digest()
      expect(state.current.name).toBe 'root.main'

    it 'should redirect to the index path on non-existent state', ->
      location.path('/definitely/not/a/_state')
      rootScope.$digest()
      expect(state.current.name).toBe 'root.main'
