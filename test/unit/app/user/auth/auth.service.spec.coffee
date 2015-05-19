describe 'User Service', ->
  $httpBackend = {}
  $rootScope = {}
  AuthServ = {}
  user = {}
  user2 = {}
  store = {}
  Restangular = {}
  tokenInterceptor = {}
  state = {}

  beforeEach inject (_$httpBackend_, _$rootScope_, _AuthServ_, _store_, _tokenInterceptor_, _$state_) ->
    $httpBackend = _$httpBackend_
    $rootScope = _$rootScope_
    AuthServ = _AuthServ_
    store = _store_
    tokenInterceptor = _tokenInterceptor_
    state = _$state_
    user =  FactoryGirl.create 'user'
    user.token = 'token'

    spyOn(tokenInterceptor, 'setToken').and.callThrough()
    spyOn(store, 'set').and.callThrough()
    spyOn(state, 'go').and.callThrough()


  it 'should exist', ->
    expect(!!AuthServ).toBe yes

  describe 'isLoggedIn method', ->
    it 'should call get method on store', ->
      spyOn(store, 'get').and.callThrough()
      AuthServ.isLoggedIn()
      expect(store.get).toHaveBeenCalledWith('token')

    it 'should return true when token is set', ->
      store.set('token', 'token')
      expect(AuthServ.isLoggedIn()).toBe true

    it 'should return true when token is not set', ->
      expect(AuthServ.isLoggedIn()).toBe false

  describe 'getCurrentUser method', ->
    it 'should call get method on store', ->
      spyOn(store, 'get').and.callThrough()
      AuthServ.getCurrentUser()
      expect(store.get).toHaveBeenCalledWith('userId')
      expect(store.get).toHaveBeenCalledWith('userEmail')

  describe 'login method', ->
    beforeEach ->
      $httpBackend.expectPOST(BACKEND_URL+'/auth/login', user).respond(200, user)
      AuthServ.login(user)

    it 'should work', ->

  describe 'register method', ->
    beforeEach ->
      $httpBackend.expectPOST(BACKEND_URL+'/auth/register', user).respond(200, user)
      AuthServ.register(user)

    it 'should work', ->

  describe 'logout method', ->
    beforeEach ->
      $httpBackend.expectDELETE(BACKEND_URL+'/auth/logout').respond(200, user)
      AuthServ.logout(user)

    it 'should work', ->

  describe 'checkToken method', ->
    beforeEach ->
      $httpBackend.expectGET(BACKEND_URL+'/auth/check_token').respond(200, user)
      AuthServ.checkToken(user)

    it 'should work', ->

  #   it 'should call set method on store', ->
  #     expect(state.go).toHaveBeenCalled()

  # describe ' removeUser method', ->
  #   it 'should call remove method on store', ->
  #     spyOn(store, 'remove').and.callThrough()
  #     AuthServ.removeUser()
  #     expect(store.remove).toHaveBeenCalledWith('userId')
