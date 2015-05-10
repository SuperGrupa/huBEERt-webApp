describe 'List Users controller ', ->

  ListUsersCtrl = {}
  scope = {}
  $rootScope = {}
  UserServ = {}
  users = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      users =  FactoryGirl.createList 'user', 15

      UserServ =
        getAll: ->
          def = $q.defer()
          def.resolve(users)
          def.promise
        removeOne: ->
        unhideOne: ->
        
      spyOn(UserServ, 'getAll').and.callThrough()
      spyOn(UserServ, 'removeOne').and.callThrough()
      spyOn(UserServ, 'unhideOne').and.callThrough()

      ListUsersCtrl = $controller 'ListUsersCtrl',
        $scope: scope
        UserServ: UserServ

      scope.$digest()


  it 'should exist', ->
    expect(!!ListUsersCtrl).toBe yes

  it 'should call getAll method on UserServ', ->
    expect(UserServ.getAll).toHaveBeenCalled()

  it 'should get users from UserServ', ->
    expect(scope.users).toBe users

  describe 'removeUser method', ->
    it 'should call removeOne method on UserServ', ->
      scope.removeUser(users[1])
      expect(UserServ.removeOne).toHaveBeenCalled()

  describe 'unhideUser method', ->
    it 'should call unhideOne method on UserServ', ->
      scope.unhideUser(users[1])
      expect(UserServ.unhideOne).toHaveBeenCalled()


