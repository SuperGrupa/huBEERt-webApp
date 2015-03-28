'use strict'

utils = require('../utils')

describe 'huBEERt', ->
  ptor = {}
  beforeEach ->
    ptor = protractor.getInstance()
    console.info('\nrunning:', jasmine.getEnv().currentSpec.description)

  afterEach ->
    if (!jasmine.getEnv().currentSpec.results().passed())
      utils.takeScreenshot(browser, jasmine.getEnv().currentSpec.description.replace(/\ /g, '-'))

  it 'should load the main page', ->
    ptor.get('/')
    expect(ptor.isElementPresent(By.css('body'))).toBe(true)
