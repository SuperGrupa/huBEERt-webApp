'use strict'

describe 'Directive: enterToSave', ->
  beforeEach module 'common.directives.enterToSave'
  compile = {}
  rootScope = {}
  element = {}
  scope = {}

  beforeEach ->
    inject (_$compile_, _$rootScope_) ->

      compile = _$compile_
      rootScope = _$rootScope_
      scope = rootScope
      scope.save = ->
      spyOn(scope, "save").and.callThrough
      element = angular.element('<input type="text" enter-to-save="save()"></input>')
      compile(element)(scope)
      angular.element(document.body).append(element)
      scope.$apply()

  it 'should call save method when enter is clicked', ->
    element.focus()
    element.trigger($.Event('keypress', { which: 13 }))
    expect(scope.save).toHaveBeenCalled

  it 'should not call save method when no-enter is clicked', ->
    element.focus()
    element.trigger($.Event('keypress', { which: 12 }))
    expect(scope.save).not.toHaveBeenCalled


