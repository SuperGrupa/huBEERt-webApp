'use strict'

describe 'Directive: liveEdit', ->
  beforeEach module 'common.directives.liveEdit'
  beforeEach module 'templates'

  compile = {}
  rootScope = {}
  element = {}
  scope = {}
  user = {}

  beforeEach ->
    inject (_$compile_, _$rootScope_) ->

      user =
        name: 'Albert'

      compile = _$compile_
      rootScope = _$rootScope_
      scope = rootScope
      scope.user = user
      scope.saveUser = (user) ->
        scope.user = user
      element = angular.element('<live-edit field="user.name" on-save="saveUser(user)"></live-edit>')
      compile(element)(scope)
      angular.element(document.body).append(element)
      scope.$apply()



  describe 'content', ->
    it 'should contain user name', ->
      expect(element.text()).toContain(user.name)

  describe 'reverseEditEnabled method', ->
    describe 'at the beginning', ->
      it 'input should be hidden', ->
        expect(element.children().last().css('display')).toBe('none')

      it 'user name field should be showed', ->
        expect(element.children().first().css('display')).not.toBe('none')

    describe 'after edit button was clicked', ->
      beforeEach ->
        element.find('span.edit-btn').triggerHandler('click')

      it 'user name field should be hidden', ->
        expect(element.children().first().css('display')).toBe('none')

      it 'input should be showed ', ->
        expect(element.children().last().css('display')).not.toBe('none')

  describe 'save method', ->
    it 'shuold call saveUser method', ->
      inputName = 'Einstein'
      element.find('span.edit-btn').triggerHandler('click')
      element.find('input').val(inputName).trigger('input')
      element.find('span.edit-btn').triggerHandler('click')
      expect(scope.user.name).toBe(inputName)
