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
  @animals = Animal.find_type('Dog')
  erb(:dogs)
end

get '/animals/cats' do
  @animals = Animal.find_type('Cat')
  erb(:cats)
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:show)
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all()
  erb(:edit)
end

post '/animals/:id' do
  Animal.new(params).update
  redirect to '/animals'
end
