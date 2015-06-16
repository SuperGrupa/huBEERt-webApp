'use strict'
mock = require('protractor-http-mock')

describe 'huBEERt', ->
  beforeEach ->
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)
    mock(['auth'])

  it "should register and login a user", ->
    browser.get('/register')
    element(By.model('user.email')).sendKeys('email@site.com')
    element(By.model('user.password')).sendKeys('password')
    element(By.css('.btn')).click()
    # browser.sleep(55000)
    expect(browser.getCurrentUrl()).not.toContain '/register'
