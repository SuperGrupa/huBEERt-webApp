describe 'Main controller ', ->

  MainCtrl = {}
  scope = {}
  $rootScope = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      MainCtrl = $controller 'MainCtrl',
        $scope: scope

      scope.$digest()


  it 'should exist', ->
    expect(!!MainCtrl).toBe yes

