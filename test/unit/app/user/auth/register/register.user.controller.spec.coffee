describe 'Register User controller ', ->

  RegisterUserCtrl = {}
  scope = {}
  $rootScope = {}
  AuthServ = {}
  UserServ = {}
  state = {}
  createController = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      AuthServ =
        isLoggedIn: () ->
          true
        register: ->
          def = $q.defer()
          def.resolve(true)
          def.promise
      spyOn(AuthServ, 'register').and.callThrough()

      UserServ =
        checkEmail: ->
          def = $q.defer()
          def.resolve('false')
          def.promise
        checkLogin: ->
          def = $q.defer()
          def.resolve('false')
          def.promise
      spyOn(UserServ, 'checkEmail').and.callThrough()
      spyOn(UserServ, 'checkLogin').and.callThrough()

      state =
        go: ->
          true
      spyOn(state, 'go').and.callThrough()

      createController = ->
        RegisterUserCtrl = $controller 'RegisterUserCtrl',
          $scope: scope
          AuthServ: AuthServ
          UserServ: UserServ
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
      expect(!!RegisterUserCtrl).toBe yes

    it 'shloud $scope.formClicked be false', ->
      expect(scope.formClicked).toBe false

    it 'shloud $scope.emailTaken be false', ->
      expect(scope.emailTaken).toBe false

    it 'shloud $scope.loginTaken be false', ->
      expect(scope.loginTaken).toBe false

    describe 'updateLogin method', ->
      beforeEach ->
        scope.user =
          email: ''
          login: ''
        scope.form =
          login:
            $dirty: true

      it 'should update login', ->
        scope.user.email = 'email@hubeert.pl'
        scope.form['login'].$dirty = false
        scope.updateLogin()
        expect(scope.user.login).toBe 'email'

      it 'should not update login when form.login is dirty', ->
        scope.user.email = 'email@hubeert.pl'
        scope.form['login'].$dirty = true
        scope.updateLogin()
        expect(scope.user.login).not.toBe 'email'

      it 'should not update login when email is null', ->
        scope.user.email = ''
        scope.form['login'].$dirty = false
        scope.updateLogin()
        expect(scope.user.login).not.toBe 'email'

    describe 'register method', ->
      beforeEach ->
        scope.register('user')
        scope.$digest()

      it 'should call checkEmail on UserServ', ->
        expect(UserServ.checkEmail).toHaveBeenCalled()

      it 'should call checkLogin on UserServ', ->
        expect(UserServ.checkLogin).toHaveBeenCalled()

      it 'should call register on AuthServ', ->
        expect(AuthServ.register).toHaveBeenCalled()

      it 'should set emailTaken to true', ->
        expect(scope.emailTaken).toBe true

      it 'should set loginTaken to true', ->
        expect(scope.loginTaken).toBe true
