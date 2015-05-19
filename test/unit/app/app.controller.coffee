describe 'App controller ', ->

  AppCtrl = {}
  scope = {}
  $rootScope = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      AppCtrl = $controller 'AppCtrl',
        $scope: scope

      scope.$digest()


  it 'should exist', ->
    expect(!!AppCtrl).toBe yes
