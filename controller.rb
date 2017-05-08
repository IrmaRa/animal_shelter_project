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
   @animals = Animal.ready()
  erb(:ready)
end

get '/animals/unready' do
  @animals = Animal.unready()
  erb(:ready)
end

get '/animals/type' do 
  @animals = Animal.find_type(params['type'])
  erb(:type)
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:show)
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all()
  erb(:edit)
end

post '/animals/:id' do
  @animal = Animal.new(params).update
  @animal = Animal.find(params[:id])
  erb(:update)
end

post '/animals/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  redirect to '/animals'
end

