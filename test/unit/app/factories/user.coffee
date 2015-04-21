FactoryGirl.define 'user',
  id:       -> ~~(Math.random() * 1000)
  name:     'testuser'
  email:    'testuser@test.com'

FactoryGirl.define 'user2',
  id:       -> ~~(Math.random() * 1000)
  name:     'testuser2'
  email:    'testuser2@test.com'
