'use strict'
fs =   require('fs')

exports.takeScreenshot = (browser, filename) ->
  browser.takeScreenshot().then (png) ->
  fs.writeFileSync('./client/test/screenshots/' + filename + '.png', png, 'base64')
