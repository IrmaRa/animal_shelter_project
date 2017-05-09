require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/owner')

get '/animals/new' do
  @owners = Owner.all()
  erb(:"animals/new")
end

get '/animals/adopted' do
  @animals = Animal.all()
  erb(:"animals/adopted")
end

get '/animals/ready' do
   @animals = Animal.ready()
  erb(:"animals/ready")
end

get '/animals/unready' do
  @animals = Animal.unready()
  erb(:"animals/ready")
end

get '/animals/type' do 
  @animals = Animal.find_type(params['type'])
  erb(:"animals/type")
end

post '/animals' do
  puts(params)
  @animal = Animal.new(params)
  @animal.save()
  erb(:"animals/create")
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all()
  erb(:"animals/edit")
end

post '/animals/:id' do
  @animal = Animal.new(params).update
  @animal = Animal.find(params[:id])
  erb(:"animals/update")
end

post '/animals/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  redirect to '/animals'
end

