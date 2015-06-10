'use strict'

describe 'huBEERt', ->
  beforeEach ->
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)

  it 'should load the main page', ->
    browser.get('/')
    expect(browser.isElementPresent(By.css('body'))).toBe(true)
