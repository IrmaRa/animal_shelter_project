require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/animals_controller')

get '/animals' do
  @animals = Animal.all()
  erb(:index)
end