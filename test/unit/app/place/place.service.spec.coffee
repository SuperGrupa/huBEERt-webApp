describe 'Place Service', ->
    $httpBackend = {}
    $rootScope = {}
    PlaceServ = {}
    place = {}

    beforeEach ->
        inject (_$httpBackend_, _$rootScope_, _PlaceServ_) ->
            $httpBackend = _$httpBackend_
            $rootScope = _$rootScope_
            PlaceServ = _PlaceServ_

    afterEach ->
        $httpBackend.verifyNoOutstandingExpectation()
        $httpBackend.verifyNoOutstandingRequest()

    it 'should exist', ->
        expect(!!PlaceServ).toBe yes

    describe 'GET', ->
        afterEach ->
            $httpBackend.flush()

        describe '/places', ->
            beforeEach ->
                $httpBackend.expect('GET', BACKEND_URL + '/places').respond(200, ['place1', 'place2'])

            describe 'updateAll method', ->
                it 'should get places array', ->
                    PlaceServ.updateAll()

            describe 'getAll method', ->
                it 'should call updateAll method', ->
                    spyOn(PlaceServ, 'updateAll').and.callThrough()
                    PlaceServ.getAll()
                    expect(PlaceServ.updateAll).toHaveBeenCalled()

        describe '/place/1', ->
            beforeEach ->
                $httpBackend.expect('GET', BACKEND_URL + '/places/1')
                    .respond(200, {id: 1, name: 'place1'})

            describe 'get method', ->
                it 'should get one user', ->
                    PlaceServ.get(1).then (result) ->
                        place = result
