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
  'name' => 'Liam Mcdonald',
  'preferences' => 'Looking for a large size dog'
  })

owner6 = Owner.new({
  'name' => 'Caroline Holmes',
  'preferences' => 'Looking for a small size dog'
  })

owner1.save()
owner2.save()
owner3.save()
owner4.save()
owner5.save()
owner6.save()


animal1 = Animal.new({
  'name' => 'Spike',
  'type' => 'Dog',
  'breed' => 'X terrier',
  'sex' => 'Male',
  'age' => '3 years',
  'image_url' => '/images/StockSnap_AGEZT9FSY0.jpg',
  'admission_date' => '2017-04-10',
  'adoption_case' => "No",
  'adoption_date' => '2017-04-10',
  'owner_id' => owner1.id
})

animal2 = Animal.new({
  'name' => 'Midnight',
  'type' => 'Cat',
  'breed' => 'Domestic short hair',
  'sex' => 'Female',
  'age' => '3 years',
  'image_url' => '/images/155293403-cat-adoption-checklist-632x475-e1354290788940.jpg',
  'admission_date' => '2017-04-01',
  'adoption_case' => "Yes",
  'adoption_date' => '2017-04-01',
  'owner_id' => owner1.id
})

animal3 = Animal.new({
  'name' => 'Biscuit',
  'type' => 'Dog',
  'breed' => 'French Bulldog',
  'sex' => 'Male',
  'age' => '2 years',
  'image_url' => '/images/StockSnap_C8WJDJA390.jpg',
  'admission_date' => '2017-05-09',
  'adoption_case' => "No",
  'adoption_date' => '2017-05-09',
  'owner_id' => owner1.id
})

animal4 = Animal.new({
  'name' => 'Oreo',
  'type' => 'Cat',
  'breed' => 'British Shorthair',
  'sex' => 'Male',
  'age' => '4 months',
  'image_url' => '/images/01-cat-wants-to-tell-you-laptop.jpg',
  'admission_date' => '2017-05-02',
  'adoption_case' => "No",
  'adoption_date' => '2017-05-02',
  'owner_id' => owner1.id
})

animal5 = Animal.new({
  'name' => 'Alfie',
  'type' => 'Dog',
  'breed' => 'X Terrier',
  'sex' => 'Male',
  'age' => '10 months',
  'image_url' => '/images/myths-about-rescue-dogs.jpg',
  'admission_date' => '2017-02-12',
  'adoption_case' => "Yes",
  'adoption_date' => '2017-05-07',
  'owner_id' => owner2.id
})

animal6 = Animal.new({
  'name' => 'Scooby',
  'type' => 'Dog',
  'breed' => 'X Labrador/Mastiff',
  'sex' => 'Male',
  'age' => '7 years',
  'image_url' => '/images/1546975_7uGP9J.jpeg',
  'admission_date' => '2017-03-10',
  'adoption_case' => "Yes",
  'adoption_date' => '2017-03-10',
  'owner_id' => owner1.id
})

animal1.save()
animal2.save()
animal3.save()
animal4.save()
animal5.save()
animal6.save()

binding.pry
nil
