describe 'Footer controller ', ->

  FooterCtrl = {}
  scope = {}
  $rootScope = {}

  beforeEach ->
    inject ($controller, _$rootScope_, $q) ->
      $rootScope = _$rootScope_
      scope = $rootScope.$new()

      FooterCtrl = $controller 'FooterCtrl',
        $scope: scope

      scope.$digest()


  it 'should exist', ->
    expect(!!FooterCtrl).toBe yes
