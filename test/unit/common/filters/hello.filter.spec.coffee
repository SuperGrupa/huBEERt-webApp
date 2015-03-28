'use strict'

describe 'Filters: helloFilter', ->
  filter = null
  beforeEach ->
    module('common.filters.helloFilter')
  beforeEach ->
    inject (_$filter_) ->
      filter = _$filter_

  it 'should add Hello Filter', ->
    expect(filter('helloFilter')('Test')).toEqual('Test Hello Filter')
