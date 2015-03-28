'use strict'

describe 'MainCtrl', ->
  beforeEach module('huBEERt.main')
  
  rootScope = {}
  controller = {}
  scope = {}
  MainCtrl = {}

  beforeEach ->
    inject (_$rootScope_, _$controller_) ->
      rootScope = _$rootScope_
      controller = _$controller_
    scope = rootScope.$new()
    MainCtrl = controller 'MainCtrl as main',
      $scope: scope

  it 'should not be null', ->
    expect(MainCtrl.val).toEqual('Ya Man')
