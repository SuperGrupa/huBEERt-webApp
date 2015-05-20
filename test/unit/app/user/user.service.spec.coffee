describe 'User Service', ->
  $httpBackend = {}
  $rootScope = {}
  UserServ = {}
  user = {}

  beforeEach inject (_$httpBackend_, _$rootScope_, _UserServ_) ->
    $httpBackend = _$httpBackend_
    $rootScope = _$rootScope_
    UserServ = _UserServ_

  # afterEach ->
  #   $httpBackend.verifyNoOutstandingExpectation()
  #   $httpBackend.verifyNoOutstandingRequest()

  it 'should exist', ->
    expect(!!UserServ).toBe yes

  describe 'GET', ->
    afterEach ->
      $httpBackend.flush()

    describe '/users', ->
      beforeEach ->
        $httpBackend.expect('GET', BACKEND_URL+'/users')
          .respond(200, ['user1', 'user2'])

      describe 'updateAll method', ->
        it 'should get users array', ->
          UserServ.updateAll()

      describe 'getAll method', ->
        it 'should call updateAll method', ->
          spyOn(UserServ, 'updateAll').and.callThrough()
          UserServ.getAll()
          expect(UserServ.updateAll).toHaveBeenCalled()

    describe '/users/1', ->
      beforeEach ->
        $httpBackend.expect('GET', BACKEND_URL+'/users/1')
          .respond(200, {id: 1, name: 'user1'})

      describe 'getOne method', ->
        it 'should get one user', ->
          UserServ.getOne(1).then (result) ->
            user = result

  describe 'saveOne method', ->
    beforeEach ->
      UserServ.saveOne(user)

    it 'should work', ->

  describe 'removeOne method', ->
    beforeEach ->
      UserServ.removeOne(user)

    it 'should work', ->

  describe 'unhideOne method', ->
    beforeEach ->
      UserServ.unhideOne(user)

    it 'should work', ->

  describe 'checkEmail method', ->
    beforeEach ->
      $httpBackend.expectPOST(BACKEND_URL+'/users/check_email').respond(200, user)
      UserServ.checkEmail(user)

    it 'should work', ->

  describe 'checkLogin method', ->
    beforeEach ->
      $httpBackend.expectPOST(BACKEND_URL+'/users/check_login').respond(200, user)
      UserServ.checkLogin(user)

    it 'should work', ->

