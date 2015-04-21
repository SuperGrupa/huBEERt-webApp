describe 'New User controller ', ->

  NewUserCtrl = {}
  scope = {}
  $rootScope = {}
  UserServ = {}
  user = {}
  state = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      user =  FactoryGirl.create 'user'
      user2 =  FactoryGirl.create 'user2'

      UserServ =
        saveOne: (user) ->
          def = $q.defer()
          def.resolve(user2)
          def.promise
      spyOn(UserServ, 'saveOne').and.callThrough()

      state =
        go: ->
      spyOn(state, 'go').and.callThrough()

      NewUserCtrl = $controller 'NewUserCtrl',
        $scope: scope
        UserServ: UserServ
        $state: state

      scope.$digest()


  it 'should exist', ->
    expect(!!NewUserCtrl).toBe yes

  it 'should declare null user', ->
    expect(scope.user).toEqual {}

  describe 'save method', ->
    beforeEach ->
      scope.save(user)
      scope.$digest()

    it 'should call saveOne method on UserServ', ->
      expect(UserServ.saveOne).toHaveBeenCalled()

    it 'should call go method on state', ->
      expect(state.go).toHaveBeenCalled()
