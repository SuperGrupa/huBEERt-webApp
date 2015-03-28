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
    'browserName': 'firefox'
  },
  {
    'browserName': 'phantomjs',
    'phantomjs.binary.path': require('phantomjs').path
  }
  ],
  onPrepare: function() {
    require('jasmine-reporters');
    jasmine.getEnv().addReporter(
      new jasmine.JUnitXmlReporter('shippable/testresults', true, true, 'junit')
    );
  }
};
