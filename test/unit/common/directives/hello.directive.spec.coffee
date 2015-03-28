'use strict'

describe 'Directive: helloDirective', ->
  beforeEach module('templates')
  beforeEach module('common.directives.helloDirective')
  compile = {}
  rootScope = {}
  element = {}
  scope = {}

  beforeEach ->
    inject (_$compile_, _$rootScope_) ->
      compile = _$compile_
      rootScope = _$rootScope_
      scope = rootScope
      element = angular.element('<hello-directive></hello-directive>')
      compile(element)(scope)
      angular.element(document.body).append(element)
      scope.$apply()

  it 'should display directive template Hello directive', ->
    expect(element.html()).toEqual('directive template Hello directive')
    expect(element.html()).toContain('directive template Hello directive')
