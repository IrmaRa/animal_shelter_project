require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/animal')

Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({
  'name' => 'Edinburgh Animal Sanctuary',
  'preferences' => 'none'
  })

owner2 = Owner.new({
  'name' => 'Kate Smith',
  'preferences' => 'Small size dog'
  })
owner3 = Owner.new({
  'name' => 'Fraser Mitchell',
  'preferences' => 'Looking for both(cat and dog)'
  })

owner4 = Owner.new({
  'name' => 'Carol Lee',
  'preferences' => 'Looking for a cat'
  })

owner5 = Owner.new({
  'name' => 'Tom Jerry',
  'preferences' => 'Looking for a large size dog'
  })


owner1.save()
owner2.save()
owner3.save()
owner4.save()
owner5.save()


animal1 = Animal.new({
  'name' => 'Alfie',
  'type' => 'Dog',
  'breed' => 'X Terrier',
  'sex' => 'Male',
  'age' => '10 months',
  'image_url' => 'https://www.hirerush.com/blog/wp-content/uploads/2016/02/myths-about-rescue-dogs.jpg',
  'admission_date' => '2017-02-12',
  'adoption_case' => "Yes",
  'owner_id' => owner2.id
})

animal2 = Animal.new({
  'name' => 'Midnight',
  'type' => 'Cat',
  'breed' => 'Domestic short hair',
  'sex' => 'Female',
  'age' => '3 years',
  'image_url' => 'https://www.petfinder.com/wp-content/uploads/2012/11/155293403-cat-adoption-checklist-632x475-e1354290788940.jpg',
  'admission_date' => '2017-04-01',
  'adoption_case' => "No",
  'owner_id' => owner1.id
})

animal3 = Animal.new({
  'name' => 'Scooby',
  'type' => 'Dog',
  'breed' => 'X Labrador/Mastiff',
  'sex' => 'Male',
  'age' => '7 years',
  'image_url' => 'http://y.delfi.lt/norm/46749/1546975_7uGP9J.jpeg',
  'admission_date' => '2017-03-10',
  'adoption_case' => "Yes",
  'owner_id' => owner1.id
})

animal4 = Animal.new({
  'name' => 'Oreo',
  'type' => 'Dog',
  'breed' => 'British Shorthair',
  'sex' => 'Male',
  'age' => '4 months',
  'image_url' => 'http://www.rd.com/wp-content/uploads/sites/2/2016/04/01-cat-wants-to-tell-you-laptop.jpg',
  'admission_date' => '2017-05-02',
  'adoption_case' => "Yes",
  'owner_id' => owner1.id
})

animal1.save()
animal2.save()
animal3.save()
animal4.save()

binding.pry
nil
