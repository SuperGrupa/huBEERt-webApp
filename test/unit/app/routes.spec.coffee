'use strict'

describe 'Directive: helloDirective', ->
    beforeEach module('templates')
    beforeEach module('huBEERt')
    location = {}
    rootScope = {}
    state = {}

    beforeEach ->
        inject (_$location_, _$rootScope_, _$state_) ->
            location = _$location_
            rootScope = _$rootScope_
            state = _$state_

    describe 'root state', ->
        it 'should have a templateUrl set', ->
            config = state.get('root')
            expect(config.templateUrl).toBe 'templates/src/root.html'

        it 'should load the index page on successful load of /', ->
            location.path('/')
            rootScope.$digest()
            expect(state.current.name).toBe 'root.main'

        it 'should redirect to the index path on non-existent state', ->
            location.path('/definitely/not/a/_state')
            rootScope.$digest()
            expect(state.current.name).toBe 'root.main'

    describe 'place state', ->
        it 'should have a templateUrl set', ->
            config = state.get('place')
            expect(config.templateUrl).toBe 'templates/src/modules/place/place.html'
        
        it 'should load index page', ->
            location.path('/places')
            rootScope.$digest()
            expect(state.current.name).toBe 'place.list'
        
        it 'should load concrete place show page', ->
            location.path('/place/1')
            rootScope.$digest()
            expect(state.current.name).toBe 'place.show'
        
        it 'should load new place page', ->
            location.path('/place/new')
            rootScope.$digest()
            expect(state.current.name).toBe 'place.new'
        
        it 'should load edit place page', ->
            location.path('/place/1/edit')
            rootScope.$digest()
            expect(state.current.name).toBe 'place.edit'
