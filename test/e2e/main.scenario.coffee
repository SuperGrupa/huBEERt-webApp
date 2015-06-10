'use strict'

describe 'huBEERt', ->
  beforeEach ->
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)

  afterEach ->
    if (!jasmine.getEnv().currentSpec.results().passed())
      utils.takeScreenshot(browser, jasmine.getEnv().currentSpec.description.replace(/\ /g, '-'))

  it 'should load the main page', ->
    browser.get('/')
    expect(browser.isElementPresent(By.css('body'))).toBe(true)
