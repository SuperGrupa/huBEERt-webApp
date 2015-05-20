describe 'Login User controller ', ->

  LoginUserCtrl = {}
  scope = {}
  $rootScope = {}
  AuthServ = {}
  state = {}
  createController = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      AuthServ =
        login: ->
          def = $q.defer()
          def.resolve(true)
          def.promise
        isLoggedIn: () ->
          true
      spyOn(AuthServ, 'login').and.callThrough()

      state =
        go: ->
          true
      spyOn(state, 'go').and.callThrough()

      createController = ->
        LoginUserCtrl = $controller 'LoginUserCtrl',
          $scope: scope
          AuthServ: AuthServ
          $state: state

        scope.$digest()

  describe 'checking if user isLoggedIn', ->
    it 'should call go method on state, when user isLoggedIn', ->
      AuthServ =
        isLoggedIn: () ->
          true
      spyOn(AuthServ, 'isLoggedIn').and.callThrough()
      createController()
      expect(state.go).toHaveBeenCalled()

    it 'should not call go method on state, when user is not LoggedIn', ->
      AuthServ =
        isLoggedIn: () ->
          false
      spyOn(AuthServ, 'isLoggedIn').and.callThrough()
      createController()
      expect(state.go).not.toHaveBeenCalled()


  describe 'other tests', ->
    beforeEach ->
      createController()

    it 'should exist', ->
      expect(!!LoginUserCtrl).toBe yes

    it 'shloud $scope.formClicked be false', ->
      expect(scope.formClicked).toBe false

    describe 'login method', ->
      beforeEach ->
        scope.login('user')

      it 'should call login method on AuthServ', ->
        expect(AuthServ.login).toHaveBeenCalled()
