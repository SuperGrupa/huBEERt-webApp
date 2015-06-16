FactoryGirl = require('factory_girl')

FactoryGirl.define 'user', ->
  @sequence('seq_id', 'id')
  @sequence('seq_name', 'login')
  @email = 'email@site.com'
  @firstname = "firstname"
  @lastname = "lastname"
  @token = "some token"
