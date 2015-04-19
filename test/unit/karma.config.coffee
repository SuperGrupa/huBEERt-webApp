module.exports = (config) ->
  config.set
    basePath: '../../'
    frameworks: ['jasmine']

    # list of files / patterns to load in the browser
    files: [
      'www/js/vendor.js'
      'public/components/angular-mocks/angular-mocks.js'

      'www/templates/**/*.html'

      'app/common/**/*.coffee'
      'app/src/app.coffee'     # define angular 'huBEERt' module; add some native/global js variables
      'config/config.js'
      'app/src/app.controller.coffee'
      'app/src/*/**/*.coffee'  # include all angular submodules (like controllers, directives, services)
      'app/src/routes.coffee'  # app.config - routes
      'app/src/app_run.coffee' # app.config; app.run
      'app/src/constant.coffee'


      'test/unit/app/helpers/**/*.coffee'
      'test/unit/**/*.coffee'
    ]

    exclude: [
      'test/unit/karma.config.coffee'
    ]

    autoWatch: true

    # f.e. Chrome, PhantomJS
    browsers: ['PhantomJS']

    reporters: ['progress', 'coverage']

    coverageReporter:
      type : 'lcov'
      dir : 'coverage'
      subdir: (browser, platform) ->
        browser.toLowerCase().split(' ')[0]

    preprocessors:
      'app/**/*.coffee': ['coverage']
      'test/**/*.coffee': ['coffee']
      'www/templates/**/*.html': ['ng-html2js']

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: true

    ngHtml2JsPreprocessor:
      moduleName: 'templates'
      stripPrefix: 'www/'

    coffeePreprocessor:
      options:
        bare: true
        sourceMap: true
