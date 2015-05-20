describe 'Show User controller ', ->

  ShowUserCtrl = {}
  scope = {}
  $rootScope = {}
  UserServ = {}
  user = {}
  user2 = {}
  stateParams = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      user =  FactoryGirl.create 'user'
      user2 =  FactoryGirl.create 'user2'

      UserServ =
        getOne: (id)->
          def = $q.defer()
          def.resolve(user)
          def.promise
        saveOne: (user) ->
          def = $q.defer()
          def.resolve(user2)
          def.promise
      spyOn(UserServ, 'getOne').and.callThrough()
      spyOn(UserServ, 'saveOne').and.callThrough()

      stateParams =
        id: user.id

      ShowUserCtrl = $controller 'ShowUserCtrl',
        $scope: scope
        UserServ: UserServ
        $stateParams: stateParams

      scope.$digest()


  it 'should exist', ->
    expect(!!ShowUserCtrl).toBe yes

  it 'should get id from stateParams', ->
    expect(scope.id).toBe(stateParams.id)

  it 'should call getOne method on UserServ', ->
    expect(UserServ.getOne).toHaveBeenCalled()

  it 'should get user from UserServ', ->
    expect(scope.user).toBe user

  describe 'save method', ->
    beforeEach ->
      scope.save(user)
      scope.$digest()

    it 'should call saveOne method on UserServ', ->
      expect(UserServ.saveOne).toHaveBeenCalled()

    it 'should get user from saveOne method on UserServ', ->
      scope.save(user)
      expect(scope.user).toBe(user2)
