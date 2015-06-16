FactoryGirl = require('factory_girl')

FactoryGirl.define 'user', ->
  @id = Math.random()*101|0
  @email = 'email@site.com'
  @login = "login"
  @firstname = "firstname"
  @lastname = "lastname"
  @token = "some token"
