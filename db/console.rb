require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/animal')

Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({
  'name' => 'Kate',
  'preferences' => 'Small size dog'
  })
owner2 = Owner.new({
  'name' => 'Fraser',
  'preferences' => 'None'
  })

owner1.save()
owner2.save()

animal1 = Animal.new({
  'name' => 'Alfie',
  'type' => 'Dog',
  'breed' => 'Jack Russell Terrier',
  'sex' => 'Male',
  'age' => '3 years',
  'image_url' => 'https://www.hirerush.com/blog/wp-content/uploads/2016/02/myths-about-rescue-dogs.jpg',
  'admission_date' => '2017-02-12',
  'adoption_case' => true,
  'owner_id' => owner1.id
})

animal2 = Animal.new({
  'name' => 'Midnight',
  'type' => 'Cat',
  'breed' => 'Jack Russell Terrier',
  'sex' => 'Male',
  'age' => '5 months',
  'image_url' => 'https://www.petfinder.com/wp-content/uploads/2012/11/155293403-cat-adoption-checklist-632x475-e1354290788940.jpg',
  'admission_date' => '2017-04-01',
  'adoption_case' => false,
  'owner_id' => owner2.id
})

animal3 = Animal.new({
  'name' => 'Scooby',
  'type' => 'Dog',
  'breed' => 'Jack Russell Terrier',
  'sex' => 'Male',
  'age' => '7 years',
  'image_url' => 'http://y.delfi.lt/norm/46749/1546975_7uGP9J.jpeg',
  'admission_date' => '2017-03-10',
  'adoption_case' => true,
  'owner_id' => owner2.id
})

animal1.save()
animal2.save()
animal3.save()

binding.pry
nil
