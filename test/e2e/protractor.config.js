'use strict';
require('coffee-script/register');

var port =  4444;

exports.config = {
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  },

  specs: ['test/e2e/**/*.scenario.coffee'],

  seleniumArgs: ['-browserTimeout=60'],

  seleniumAddress: 'http://localhost:4444/wd/hub',

  multiCapabilities: [
    {
      'browserName': 'chrome'
    }
  //},
  //{
  //  'browserName': 'phantomjs',
  //  'phantomjs.binary.path': require('phantomjs').path
  //}
  ],

  mocks: {
    dir: 'mocks',
  },

  onPrepare: function(){
    require('protractor-http-mock').config = {
      rootDirectory: __dirname,
      protractorConfig: 'protractor.config'
    };
  }
};
