Q                   = require 'q'
child_process       = require 'child_process'
gulp                = require 'gulp'
gutil               = require 'gulp-util'
sass                = require 'gulp-sass'
coffee              = require 'gulp-coffee'
jade                = require 'gulp-jade'
livereload          = require 'gulp-livereload'
changed             = require 'gulp-changed'
open                = require 'open'
http                = require 'http'
path                = require 'path'
ecstatic            = require 'ecstatic'
notify              = require 'gulp-notify'
concat              = require 'gulp-concat'
clean               = require 'gulp-clean'
cache               = require 'gulp-cache'
protractor          = require 'gulp-protractor'
rename              = require 'gulp-rename'
runSequence         = require 'run-sequence'
argv                = require('yargs').argv
fs                  = require 'fs'
ngConstant          = require 'gulp-ng-constant'
webdriverStandalone = require('gulp-protractor').webdriver_standalone
webdriverUpdate     = require('gulp-protractor').webdriver_update
karma               = require('karma').server

# configs
karmaConfig         = require('./test/unit/karma.config')
protractorConfig    = require('./test/e2e/protractor.config')

paths =
  public: ['public/**']
  assets: ['assets/**']
  styles: [
    'app/css/**/*.scss'
    'public/components/bootstrap/dist/css/bootstrap.css'
    'public/components/components-font-awesome/css/font-awesome.css'
  ]
  img: [
    'app/img/**/*.*'
  ]
  fonts: [
    'public/components/components-font-awesome/fonts/fontawesome-webfont.*'
    'app/fonts/**/*.*'
  ]
  scripts:
    vendor: [
      'public/components/jquery/dist/jquery.js'
      'public/components/angular/angular.js'
      'public/components/bootstrap/dist/js/bootstrap.js'
      'public/components/angular-bootstrap/ui-bootstrap.js'
      'public/components/angular-bootstrap/ui-bootstrap-tpls.js'
      'public/components/angular-animate/angular-animate.js'
      'public/components/angular-resource/angular-resource.js'
      'public/components/lodash/dist/lodash.js'
      'public/components/restangular/dist/restangular.js'
      'public/components/underscore/underscore.js'
      'public/components/angular-ui-router/release/angular-ui-router.js'
      'public/components/angular-retina/dist/angular-retina.js'
      'public/components/angular-jwt/dist/angular-jwt.js'
      'public/components/a0-angular-storage/dist/angular-storage.js'
      'public/components/angular-messages/angular-messages.js'
    ]
    app: [
      'app/common/**/*.coffee'
      'app/src/app.coffee'     # define angular 'huBEERt' module; add some native/global js variables
      'config/config.js'
      'app/src/app.controller.coffee'
      'app/src/*/**/*.coffee'  # include all angular submodules (like controllers, directives, services)
      'app/src/routes.coffee'  # app.config - routes
      'app/src/app_run.coffee' # app.config; app.run
    ]
    tests: [
      'test/unit/**/*.coffee'
    ]
    e2etests: [
      'test/e2e/**/*.scenario.coffee'
    ]
  templates: ['app/**/*.jade']

destinations =
  public: 'www'
  styles: 'www/css'
  scripts: 'www/js'
  templates: 'www/templates'
  livereload: ['www/**']
  fonts: 'www/fonts'
  img: 'www/img'
  assets: 'www'
  config: 'config/'

options =
  open: false # open the server in the browser on init?
  httpPort: 4400

#globals visible in templates
globals = switch gutil.env.env
  when 'production'
    ENV_NAME: 'production'
    BACKEND_URL: process.env.BACKEND_URL || 'http://hubeert.pl'
    ROLLBAR_ACCESS_TOKEN: '54cd129b61c84537882e2326ab9a27f7'
  else
    ENV_NAME: 'development'
    BACKEND_URL: process.env.BACKEND_URL || 'http://localhost:3000'
    ROLLBAR_ACCESS_TOKEN: '54cd129b61c84537882e2326ab9a27f7'
    DIST_DIR: 'www'

# You can replace one of globals by devining ENV variable,
# f.e. `BACKEND_URL='http://192.168.0.666:1337' gulp`
for k, v of globals
  globals[k] = process.env[k] if process.env[k]?

#config global values visible in js files
gulp.task 'config', ->
  gutil.log gutil.colors.blue 'creating config file'
  env = argv.env || 'development'
  gutil.log gutil.colors.yellow "Setting config file for: "
  gutil.log gutil.colors.red "#{env}"
  filename = env + '.json'
  settings = JSON.parse(fs.readFileSync(destinations.config + filename, 'utf8'))
  
  gulp.src destinations.config + filename
    .pipe(ngConstant())
    .pipe(rename('config.js'))
    .pipe(gulp.dest('config'))

gulp.task 'clean', ->
  gulp.src('www', read: false)
    .pipe(clean())

gulp.task('webdriver:update', webdriverUpdate)

gulp.task 'public', ->
  gulp.src(paths.public)
    .pipe(changed(destinations.public))
    .pipe(gulp.dest(destinations.public))

gulp.task 'styles', ->
  gulp.src(paths.styles)
    .pipe(changed(destinations.styles, extension: '.css'))
    .pipe(sass())
    .on('error', notify.onError((error) -> error.message))
    .pipe(gulp.dest(destinations.styles))

gulp.task 'fonts', ->
  gulp.src(paths.fonts)
    .pipe(changed(destinations.fonts))
    .pipe(gulp.dest(destinations.fonts))

gulp.task 'img', ->
  gulp.src(paths.img)
    .pipe(changed(destinations.img))
    .pipe(gulp.dest(destinations.img))

gulp.task 'assets', ->
  gulp.src(paths.assets)
    .pipe(changed(destinations.assets))
    .pipe(gulp.dest(destinations.assets))

gulp.task 'scripts:vendor', ->
  gulp.src(paths.scripts.vendor)
    .pipe(concat('vendor.js'))
    .pipe(gulp.dest(destinations.scripts))

gulp.task 'scripts:app', ->
  gulp.src(paths.scripts.app)
    .pipe(coffee({
      sourceMap: false
    }))
    .on('error', notify.onError((error) -> error.message))
    .pipe(concat('app.js'))
    .pipe(gulp.dest(destinations.scripts))

gulp.task 'scripts', ['scripts:vendor', 'scripts:app']

gulp.task 'templates', ->
  gulp.src(paths.templates)
    .pipe(changed(destinations.templates, extension: '.html'))
    .pipe(jade({
      locals:
        GLOBALS: globals
      pretty: true
    }))
    .on('error', notify.onError((error) -> error.message))
    .pipe(gulp.dest(destinations.templates))

gulp.task 'index', ->
  gulp.src(destinations.templates + '/index.html')
  .pipe(gulp.dest(destinations.public))

phantomChild = null
phantomDefer = null

# standalone test server which runs in the background.
# doesnt work atm - instead, run `webdriver-manager start`
gulp.task 'test:e2e:server', (cb) ->
  return cb() if phantomDefer
  phantomDefer = Q.defer()

  phantomChild = child_process.spawn('phantomjs', ['--webdriver=4444'], {
  })
  phantomChild.stdout.on 'data', (data) ->
    gutil.log gutil.colors.yellow data.toString()
    if data.toString().match 'running on port '
      phantomDefer.resolve()
    
  phantomChild.once 'close', ->
    gutil.log "phantomChild closed"
    phantomChild.kill() if phantomChild
    phantomDefer.reject()

  phantomChild.on 'exit', (code) ->
    gutil.log "phantomChild exitted"
    phantomChild.kill() if phantomChild

  phantomDefer.promise

# You can run it like this:
# `gulp test:e2e` - runs all e2e tests
# `gulp test:e2e --debug --specs tests/map_test.coffee` - runs only one test, in debug mode
gulp.task 'test:e2e', [], ->
  args = ['--baseUrl', "http://localhost:#{options.httpPort}"]
  args.push 'debug' if argv.debug

  protractorTests = paths.scripts.e2etests
  protractorTests = gulp.env.specs.split(',') if gulp.env.specs

  gulp.src(protractorTests)
    .pipe(protractor.protractor({
      configFile: "test/e2e/protractor.config.js",
      args: args
    }))
    .on('error', (notify.onError((error) -> error.message)))

# Runs unit tests using karma.
# You can run it simply using `gulp test:unit`.
# You can also pass some karma arguments like this: `gulp test:unit --browsers Chrome`.
gulp.task 'test:unit', ->
  args = ['start', 'test/unit/karma.config.coffee']
  for name in ['browsers', 'reporters']
    args.push "--#{name}", "#{gulp.env[name]}" if gulp.env.hasOwnProperty(name)

  child_process.spawn "node_modules/.bin/karma", args, stdio: 'inherit'

gulp.task 'watch', ->
  gulp.watch(paths.public, ['public'])
  gulp.watch(paths.scripts.app, ['scripts:app'])
  gulp.watch(paths.scripts.vendor, ['scripts:vendor'])
  gulp.watch(paths.assets, ['assets'])
  gulp.watch(paths.styles, ['styles'])
  gulp.watch(paths.fonts, ['fonts'])
  gulp.watch(paths.img, ['img'])
  gulp.watch(paths.templates, ['templates'])

  livereloadServer = livereload()
  gulp.watch(destinations.livereload).on 'change', (file) ->
    livereloadServer.changed(file.path)

gulp.task 'server', ->
  http.createServer(ecstatic(root: 'www')).listen(options.httpPort)
  gutil.log gutil.colors.blue "HTTP server listening on #{options.httpPort}"
  if options.open
    url = "http://localhost:#{options.httpPort}/"
    open(url)
    gutil.log gutil.colors.blue "Opening #{url} in the browser..."

gulp.task 'build', (cb) ->
  runSequence 'clean',
    'config',
    [
      'public'
      'styles'
      'fonts'
      'img'
      'scripts'
      'assets'
      'templates'
    ],
    'index'
    , cb

gulp.task 'default', (cb) ->
  runSequence 'build', ['watch', 'server'], cb