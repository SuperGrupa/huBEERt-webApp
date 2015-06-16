'use strict'
mock = require('protractor-http-mock')

describe 'huBEERt', ->
  beforeEach ->
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)
    mock(['auth'])
    browser.get('/register')

  it "should not register and not login a user", ->
    element(By.model('user.email')).sendKeys('email')
    element(By.model('user.password')).sendKeys('password')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).toContain '/register'

  it "should not register and not login a user", ->
    element(By.model('user.email')).sendKeys('email@asd.')
    element(By.model('user.password')).sendKeys('password')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).toContain '/register'

  it "should not register and not login a user", ->
    element(By.model('user.email')).sendKeys('email@asd.pl')
    element(By.model('user.password')).sendKeys('pa')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).toContain '/register'

  it "should register and login a user", ->
    element(By.model('user.email')).sendKeys('email@site.com')
    element(By.model('user.password')).sendKeys('password')
    element(By.css('.btn')).click()
    expect(browser.getCurrentUrl()).not.toContain '/register'
