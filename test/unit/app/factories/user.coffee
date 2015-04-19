FactoryGirl.define 'user',
  id:       -> ~~(Math.random() * 1000)
  name:     'testuser'
  email:    'testuser@test.com'
