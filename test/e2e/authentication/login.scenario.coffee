'use strict'
mock = require('protractor-http-mock')

describe 'huBEERt', ->
  beforeEach ->
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)
    mock(['auth'])

  it "should not login a user", ->
    browser.get('/login')
    element(By.model('user.email')).sendKeys('email@site.com')
    element(By.model('user.password')).sendKeys('pa')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).toContain '/login'

  it "should not login a user", ->
    browser.get('/login')
    element(By.model('user.password')).sendKeys('password')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).toContain '/login'

  it "should login a user", ->
    browser.get('/login')
    element(By.model('user.email')).sendKeys('email@site.com')
    element(By.model('user.password')).sendKeys('password')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).not.toContain '/login'
    element.all(By.css('ul.nav li')).last().click()
