config = require('../helpers/config.helper')

module.exports = [
  {
    request:
      path: config.baseURL + 'auth/login'
      method: 'POST'
    response:
      data:
        token: 'some token'
        user:
          id: 1
          email: 'email@site.com'
          login: "login"
          firstname: "firstname"
          lastname: "lastname"
  },
  {
    request:
      path: config.baseURL + 'auth/register'
      method: 'POST'
    response:
      data:
        token: 'some token'
        user:
          id: 1
          email: 'email@site.com'
          login: "login"
          firstname: "firstname"
          lastname: "lastname"
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
  }
]
