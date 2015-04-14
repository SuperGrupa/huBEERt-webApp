describe 'User Service', ->
  $httpBackend = {}
  $rootScope = {}
  UserServ = {}
  user = {}

  beforeEach inject (_$httpBackend_, _$rootScope_, _UserServ_) ->
    $httpBackend = _$httpBackend_
    $rootScope = _$rootScope_
    UserServ = _UserServ_

  afterEach ->
    $httpBackend.flush()
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'GET /users', ->
    beforeEach ->
      $httpBackend.expect('GET', BACKEND_URL+'/users')
        .respond(200, ['user1', 'user2'])

    describe 'updateAll method', ->
      it 'should get users array', ->
        UserServ.updateAll()

    describe 'getAll method', ->
      it 'should call updateAll method', ->
        spyOn(UserServ, 'updateAll').andCallThrough
        UserServ.getAll()
        expect(UserServ.updateAll).toHaveBeenCalled

  describe 'GET /users/1', ->
    beforeEach ->
      $httpBackend.expect('GET', BACKEND_URL+'/users/1')
        .respond(200, {name: 'user', id: 1})

    describe 'getOne method', ->
      it 'should get one user', ->
        UserServ.getOne(1).then (result) ->
          user = result
          console.log user

  describe 'DELETE /users/1', ->
    beforeEach ->
      $httpBackend.expect('DELETE', BACKEND_URL+'/users/1')
        .respond(200, 'user1')

    describe 'removeOne method', ->
      it 'should get one user', ->
        UserServ.removeOne(user)
