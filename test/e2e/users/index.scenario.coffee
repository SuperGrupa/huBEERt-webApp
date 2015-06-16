'use strict'
mock = require('protractor-http-mock')
FactoryGirl = require('factory_girl')

firstUser = FactoryGirl.create('user', {id: 1})

describe 'huBEERt', ->
  beforeEach ->
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)
    mock(['users', 'auth'])

  it "should show users", ->
    browser.get('/users')
    usersNumber = element.all(By.repeater('user in users')).count()
    expect(usersNumber).toBe 10

  it "should show firstUser firstname", ->
    browser.get('/users')
    el = element(By.css('body'))
    expect(el.getText()).toContain firstUser.firstname

  it "should show firstUser lastname", ->
    browser.get('/users')
    el = element(By.css('body'))
    expect(el.getText()).toContain firstUser.lastname

  describe 'show firstUser', ->
    beforeEach ->
      browser.get('/users')
      element.all(By.css('td a')).first().click()

    it "should show firstUser email", ->
      el = element(By.css('body'))
      expect(el.getText()).toContain firstUser.email

    it "should not show users page", ->
      expect(browser.getCurrentUrl()).not.toContain 'users'

  describe 'edit firstUser', ->
    beforeEach ->
      browser.get('/users')
      element.all(By.css('td a')).get(1).click()

    it "should show firstUser email", ->
      el = element(By.css('body'))
      expect(el.getText()).toContain firstUser.email

    it "should not show users page", ->
      expect(browser.getCurrentUrl()).not.toContain 'users'

    it "should show edit users page", ->
      expect(browser.getCurrentUrl()).toContain 'edit'
