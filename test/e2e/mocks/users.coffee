config = require('../helpers/config.helper')
FactoryGirl = require('factory_girl')

module.exports = [
  {
    request:
      path: config.baseURL + 'users'
      method: 'GET'
    response:
      data: FactoryGirl.createLists('user', 10)
  },
  {
    request:
      path: config.baseURL + 'users/1'
      method: 'GET'
    response:
      data: FactoryGirl.create('user', {id: 1})
  },
  {
    request:
      path: config.baseURL + 'users/2'
      method: 'GET'
    response:
      data: FactoryGirl.create('user', {id: 2})
  },
  {
    request:
      path: config.baseURL + 'users'
      method: 'POST'
    response:
      data: data: FactoryGirl.create('user')
  }
]
