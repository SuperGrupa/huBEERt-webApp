'use strict'

describe 'huBEERt module', ->
  describe 'dependencies', ->
    module = null
    deps = null
    hasModule = (m) ->
      deps.indexOf(m) >= 0

    beforeEach ->
      module = angular.module('huBEERt')
      deps = module.value('huBEERt').requires

    it 'should be registered', ->
      expect(module).not.toEqual(null)

    it 'should have ui.router as a dependency', ->
      expect(hasModule('ui.router')).toEqual(true)

    it 'should have common as a dependency', ->
      expect(hasModule('common')).toEqual(true)

    it 'should have ngResource as a dependency', ->
      expect(hasModule('ngResource')).toEqual(true)

    it 'should have ngAnimate as a dependency', ->
      expect(hasModule('ngAnimate')).toEqual(true)

    it 'should have ui.bootstrap as a dependency', ->
      expect(hasModule('ui.bootstrap')).toEqual(true)

    it 'should have restangular as a dependency', ->
      expect(hasModule('restangular')).toEqual(true)

    it 'should have ngRetina as a dependency', ->
      expect(hasModule('ngRetina')).toEqual(true)

    it 'should have angular-jwt as a dependency', ->
      expect(hasModule('angular-jwt')).toEqual(true)

    it 'should have angular-storage as a dependency', ->
      expect(hasModule('angular-storage')).toEqual(true)

    it 'should have ngMessages as a dependency', ->
      expect(hasModule('ngMessages')).toEqual(true)

    it 'should have huBEERt.config as a dependency', ->
      expect(hasModule('huBEERt.config')).toEqual(true)

    it 'should have huBEERt.main as a dependency', ->
      expect(hasModule('huBEERt.main')).toEqual(true)

    it 'should have huBEERt.alerts as a dependency', ->
      expect(hasModule('huBEERt.alerts')).toEqual(true)
