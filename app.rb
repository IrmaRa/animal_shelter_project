require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/animals_controller')
require_relative('controllers/owners_controller')

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end