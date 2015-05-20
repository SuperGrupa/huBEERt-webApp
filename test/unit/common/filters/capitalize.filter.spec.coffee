describe 'Capitalize filter', ->
  capitalizeFltr = {}

  beforeEach ->
    inject ($filter) ->
      capitalizeFltr = $filter('capitalize')

  it 'should exist', ->
    expect(!!capitalizeFltr).toBe yes

  describe 'when evaluating an expression', ->
    it '"", should return ""', ->
      expect(capitalizeFltr('')).toBe ""

    it 'getnoticed, should return Getnoticed', ->
      expect(capitalizeFltr('getnoticed')).toBe "Getnoticed"

    it 'get noticed, should return Get Noticed', ->
      expect(capitalizeFltr('get noticed')).toBe "Get Noticed"

    it 'Getnoticed, should return Getnoticed', ->
      expect(capitalizeFltr('Getnoticed')).toBe "Getnoticed"
