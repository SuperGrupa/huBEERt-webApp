module.exports = [
  {
    request:
      path: 'http://localhost:3000/api/v1/auth/login'
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
      path: 'http://localhost:3000/api/v1/auth/register'
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
      path: 'http://localhost:3000/api/v1/users/check_email'
      method: 'POST'
    response:
      data:
        "true"
  },
  {
    request:
      path: 'http://localhost:3000/api/v1/users/check_login'
      method: 'POST'
    response:
      data:
        "true"
  }
]
