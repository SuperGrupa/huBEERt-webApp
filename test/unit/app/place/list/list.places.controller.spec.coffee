describe 'List Places controller ', ->

    ListPlacesCtrl = {}
    scope = {}
    $rootScope = {}
    PlaceServ = {}
    places = {}

    beforeEach ->
        inject ($controller, _$rootScope_, $q) ->
            $rootScope = _$rootScope_
            scope = $rootScope.$new()

            places =  FactoryGirl.createList 'place', 15

            PlaceServ =
                getAll: ->
                    def = $q.defer()
                    def.resolve(places)
                    def.promise
                removeOne: ->
                unhideOne: ->

            spyOn(PlaceServ, 'getAll').and.callThrough()
            spyOn(PlaceServ, 'removeOne').and.callThrough()
            spyOn(PlaceServ, 'unhideOne').and.callThrough()

            ListPlacesCtrl = $controller 'ListPlacesCtrl',
                $scope: scope
                PlaceServ: PlaceServ

            scope.$digest()

    it 'should exist', ->
        expect(!!ListPlacesCtrl).toBe yes

    it 'should call getAll method on PlaceServ', ->
        expect(PlaceServ.getAll).toHaveBeenCalled()

    it 'should get places from PlaceServ', ->
        expect(scope.places).toBe places

    describe 'removePlace method', ->
        it 'should call removeOne method on PlaceServ', ->
            scope.removePlace(places[1])
            expect(PlaceServ.removeOne).toHaveBeenCalled()

    describe 'unhidePlace method', ->
        it 'should call unhideOne method on PlaceServ', ->
            scope.unhidePlace(places[1])
            expect(PlaceServ.unhideOne).toHaveBeenCalled()
