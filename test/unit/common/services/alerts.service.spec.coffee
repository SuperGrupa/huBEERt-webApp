describe 'Alerts Service', ->
  $rootScope = {}
  AlertsServ = {}
  toastr = {}

  beforeEach inject (_$rootScope_, _AlertsServ_) ->
    $rootScope = _$rootScope_
    AlertsServ = _AlertsServ_

    toastr =
      info: () ->
        true
      warning: () ->
        def = $q.defer()
        def.resolve(user)
        def.promise
      error: () ->
        true
    spyOn(toastr, 'info').and.callThrough()
    spyOn(toastr, 'warning').and.callThrough()
    spyOn(toastr, 'error')


  it 'should exist', ->
    expect(!!AlertsServ).toBe yes

  it 'should log info', ->
    AlertsServ.log('message')
    # expect(toastr.info).toHaveBeenCalled()

  it 'should log warning', ->
    AlertsServ.logWarning('message')

  it 'should log error', ->
    AlertsServ.logSuccess('message')

  it 'should log error', ->
    AlertsServ.logError('message')
    # expect(toastr.error).toHaveBeenCalled()


