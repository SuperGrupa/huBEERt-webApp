'use strict'

describe 'huBEERt.main module', ->
  describe 'dependencies', ->
    module = null
    deps = null
    hasModule = (m) ->
      deps.indexOf(m) >= 0

    beforeEach ->
      module = angular.module('huBEERt.main')
      deps = module.value('huBEERt.main').requires

    it 'should be registered', ->
      expect(module).not.toEqual(null)

    it 'should have ui.bootstrap as a dependency', ->
      expect(hasModule('ui.bootstrap')).toEqual(true)

    it 'should have ui.router as a dependency', ->
      expect(hasModule('ui.router')).toEqual(true)
