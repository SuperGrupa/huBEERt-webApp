beforeEach module('huBEERt')
beforeEach module('templates')
BACKEND_URL = 'http://localhost:3000/api/v1'

afterEach ->
  inject ($httpBackend) ->
    $httpBackend.verifyNoOutstandingRequest()
    $httpBackend.verifyNoOutstandingExpectation()
  localStorage.clear()
