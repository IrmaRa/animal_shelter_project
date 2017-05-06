require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/animal')
require_relative('./models/owner')

get '/animals' do
  @animals = Animal.all
  erb(:index)
end

get '/animals/new' do
  @owners = Owner.all()
  erb(:new)
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end