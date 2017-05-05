require_relative('../db/sql_runner')
require_relative('./owner')

class Animal

  attr_reader :id, :type, :admission_date, :owner_id
  attr_accessor :name, :age, :image_url, :adoption_case

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
    @type = params['type']
    @admission_date = params['admission_date']
    @owner_id = params['owner_id'].to_i
    @age = params['age'].to_i
    @image_url = params['image_url']
    @adoption_case = params['adoption_case']
  end

  def save()
    sql = "
    INSERT INTO animals (name, type, admission_date, owner_id, age, image_url, adoption_case)
    VALUES ('#{@name}', '#{@type}', '#{@admission_date}', #{@owner_id}, #{@age}, '#{@image_url}', '#{@adoption_case}')
    RETURNING id;"

    @id = SqlRunner.run(sql)[0]["id"].to_i
  end



end