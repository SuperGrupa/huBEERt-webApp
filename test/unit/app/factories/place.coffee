FactoryGirl.define 'place',
    id:          -> ~~(Math.random() * 1000)
    name:        'Sample Pub'
    description: 'Some dummy description'
    phone:       -> ~~(Math.random()*500000000 + 300000000)
    email:       'sample_pub@test.com'
