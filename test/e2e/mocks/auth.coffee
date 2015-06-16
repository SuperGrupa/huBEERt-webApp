config = require('../helpers/config.helper')
FactoryGirl = require('factory_girl')

module.exports = [
  {
    request:
      path: config.baseURL + 'auth/login'
      method: 'POST'
    response:
      data: FactoryGirl.create('user')
  },
  {
    request:
      path: config.baseURL + 'auth/register'
      method: 'POST'
    response:
      data: FactoryGirl.create('user')
  },
  {
    request:
      path: config.baseURL + 'users/check_email'
      method: 'POST'
    response:
      data:
        "true"
  },
  {
    request:
      path: config.baseURL + 'users/check_login'
      method: 'POST'
    response:
      data:
        "true"
  },
  {
    request:
      path: config.baseURL + 'auth/logout'
      method: 'DELETE'
    response:
      data:
        "true"
  }
]
