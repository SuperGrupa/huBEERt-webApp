'use strict'
mock = require('protractor-http-mock')
FactoryGirl = require('factory_girl')

firstUser = FactoryGirl.create('user', {id: 1})

describe 'huBEERt', ->
  beforeEach ->
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)
    mock(['users', 'auth'])

  it "should login a user", ->
    browser.get('/login')
    element(By.model('user.email')).sendKeys('email@site.com')
    element(By.model('user.password')).sendKeys('password')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).not.toContain '/login'

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

    it "should show firstUser firstname", ->
      el = element(By.css('body'))
      expect(el.getText()).toContain firstUser.firstname

    it "should show firstUser lastname", ->
      el = element(By.css('body'))
      expect(el.getText()).toContain firstUser.lastname

    it "should show firstUser email", ->
      el = element(By.css('body'))
      expect(el.getText()).toContain firstUser.email

  describe 'edit firstUser', ->
    beforeEach ->
      browser.get('/users')
      element.all(By.css('td a')).get(1).click()

    it "should show firstUser email", ->
      el = element(By.css('body'))
      expect(el.getText()).toContain firstUser.email
