describe 'Nav controller ', ->

  NavCtrl = {}
  scope = {}
  $rootScope = {}
  AuthServ = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      user =  FactoryGirl.create 'user'

      AuthServ =
        logout: ->
          def = $q.defer()
          def.resolve(true)
          def.promise
        getCurrentUser: () ->
          def = $q.defer()
          def.resolve(user)
          def.promise
        isLoggedIn: () ->
          true
      spyOn(AuthServ, 'logout').and.callThrough()
      spyOn(AuthServ, 'getCurrentUser').and.callThrough()
      spyOn(AuthServ, 'isLoggedIn').and.callThrough()

      NavCtrl = $controller 'NavCtrl',
        $scope: scope
        AuthServ: AuthServ

      scope.$digest()


  it 'should exist', ->
    expect(!!NavCtrl).toBe yes

  it 'should call $watch method on scope', ->
    scope.$digest()
    expect(scope.isLoggedIn).toBe(true)

  describe 'logout method', ->
    beforeEach ->
      scope.logout()

    it 'should call logout method on AuthServ', ->
      expect(AuthServ.logout).toHaveBeenCalled()
