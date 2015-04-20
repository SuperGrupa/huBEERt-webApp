describe 'Routes', ->

  location = {}
  rootScope = {}
  state = {}
  store = {}

  beforeEach ->
    inject (_$location_, _$rootScope_, _$state_) ->
      location = _$location_
      rootScope = _$rootScope_
      state = _$state_

  describe 'user state', ->
    beforeEach ->
      this.config = state.get('user')

    it 'should be abstract', ->
      expect(this.config.abstract).toBe true

    it 'should have a parent set', ->
      expect(this.config.parent).toBe 'root'

    it 'should have a templateUrl set', ->
      expect(this.config.templateUrl).toBe 'templates/src/modules/user/user.html'

    it 'should have a controller set', ->
      expect(this.config.controller).toBe 'UserCtrl'

    it 'should have a url set', ->
      expect(this.config.url).toBe '/user'

  describe 'user.list state', ->
    beforeEach ->
      this.config = state.get('user.list')

    it 'should have a templateUrl set', ->
      expect(this.config.templateUrl).toBe 'templates/src/modules/user/list/list.users.html'

    it 'should have a controller set', ->
      expect(this.config.controller).toBe 'ListUsersCtrl'

    it 'should have a url set', ->
      expect(this.config.url).toBe 's'

  describe 'user.show state', ->
    beforeEach ->
      this.config = state.get('user.show')

    it 'should have a templateUrl set', ->
      expect(this.config.templateUrl).toBe 'templates/src/modules/user/show/show.user.html'

    it 'should have a controller set', ->
      expect(this.config.controller).toBe 'ShowUserCtrl'

    it 'should have a url set', ->
      expect(this.config.url).toBe '/:id'

  describe 'user.new state', ->
    beforeEach ->
      this.config = state.get('user.new')

    it 'should have a templateUrl set', ->
      expect(this.config.templateUrl).toBe 'templates/src/modules/user/new/new.user.html'

    it 'should have a controller set', ->
      expect(this.config.controller).toBe 'NewUserCtrl'

    it 'should have a url set', ->
      expect(this.config.url).toBe '^/register'

  describe 'user.edit state', ->
    beforeEach ->
      this.config = state.get('user.edit')

    it 'should have a templateUrl set', ->
      expect(this.config.templateUrl).toBe 'templates/src/modules/user/edit/edit.user.html'

    it 'should have a controller set', ->
      expect(this.config.controller).toBe 'EditUserCtrl'

    it 'should have a url set', ->
      expect(this.config.url).toBe '/:id/edit'
