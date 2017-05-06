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

  def update()
    sql = "
    UPDATE animals SET
    (name) = ('#{@name}'),
    (type) = ('#{@type}'),
    (admission_date) = ('#{@admission_date}'),
    (owner_id) = (#{@owner_id}),
    (age) = (#{@age}),
    (image_url) = ('#{@image_url}'),
    (adoption_case) = ('#{@adoption_case}')
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Animal.find(id)
    sql = "SELECT * FROM animals
    WHERE id = #{id};"
    results = SqlRunner.run(sql)
    animal = Animal.new(results.first)
    return animal
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Animal.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def Animal.all()
    sql = "SELECT * FROM animals;"
    animal_hashes = SqlRunner.run(sql)
    animal_objects = animal_hashes.map do
      |animal_hash| Animal.new(animal_hash)
    end
    return animal_objects
  end



end