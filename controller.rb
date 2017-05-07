require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/animal')
require_relative('./models/owner')

get '/animals' do
  @animals = Animal.all()
  erb(:index)
end

get '/animals/new' do
  @owners = Owner.all()
  erb(:new)
end

get '/animals/stories' do
  @animals = Animal.all()
  erb(:stories)
end

get '/animals/ready' do
  @animals = Animal.all
  erb(:ready)
end

get '/animals/not-ready' do
  @animals = Animal.all
  erb(:not_ready)
end

get '/animals/dogs' do
  @animals = Animal.search_type('Dog')
  erb(:dogs)
end

get '/animals/cats' do
  @animals = Animal.search_type('Cat')
  erb(:cats)
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end