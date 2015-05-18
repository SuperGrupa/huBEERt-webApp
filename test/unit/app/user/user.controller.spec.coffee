describe 'User controller ', ->

  UserCtrl = {}
  scope = {}
  $rootScope = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      UserCtrl = $controller 'UserCtrl',
        $scope: scope

      scope.$digest()


  it 'should exist', ->
    expect(!!UserCtrl).toBe yes

