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
  erb(:show)
end

get '/animals/ready' do
  @animals = Animal.all
  erb(:show1)
end

get '/animals/not-ready' do
  @animals = Animal.all
  erb(:show2)
end

get '/animals/type' do
  @animals = Animal.all
  erb(:show3)
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end