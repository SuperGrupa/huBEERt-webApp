module.exports = (config) ->
  config.set
    basePath: '../../'
    frameworks: ['jasmine']

    # list of files / patterns to load in the browser
    files: [
      'www/js/vendor.js'
      'public/components/jquery/dist/jquery.js'
      'public/components/angular/angular.js'
      'public/components/angular-mocks/angular-mocks.js'

      'www/templates/**/*.html'

      # This is the copy from gulpfile.coffee - you need to keep it up to date.
      'app/common/**/*.coffee'
      'app/src/app.coffee'
      'config/config.js'
      'app/src/app.controller.coffee'
      'app/src/*/**/*.coffee'
      'app/src/routes.coffee'
      'app/src/app_run.coffee'


      'test/unit/**/*.coffee'
    ]

    exclude: [
      'test/unit/karma.config.coffee'
    ]

    # use dots reporter, as travis terminal does not support escaping sequences
    # possible values: 'dots', 'progress'
    # CLI --reporters progress
    # reporters: ['progress']

    autoWatch: true

    # f.e. Chrome, PhantomJS
    browsers: ['PhantomJS']

    reporters: ['progress', 'coverage']

    coverageReporter:
      type : 'lcov'
      dir : 'coverage'

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
