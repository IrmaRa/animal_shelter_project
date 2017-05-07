require_relative('../db/sql_runner')
require_relative('./owner')

class Animal

  attr_reader :id, :type, :admission_date, :sex, :breed, :owner_id
  attr_accessor :name, :age, :image_url, :adoption_case

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
    @type = params['type']
    @breed = params['breed']
    @sex = params['sex']
    @admission_date = params['admission_date']
    @age = params['age']
    @image_url = params['image_url']
    @adoption_case = params['adoption_case']
    @owner_id = params['owner_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO animals (name, type, breed, sex, admission_date, age, image_url, adoption_case, owner_id)
    VALUES ('#{@name}', '#{@type}', '#{@breed}', '#{@sex}', '#{@admission_date}', '#{@age}', '#{@image_url}', '#{@adoption_case}', #{@owner_id})
    RETURNING id;"

    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def update()
    sql = "
    UPDATE animals SET
    (name) = ('#{@name}'),
    (type) = ('#{@type}'),
    (breed) = ('#{@breed}'),
    (sex) = ('#{@sex}'),
    (admission_date) = ('#{@admission_date}'),
    (age) = ('#{@age}'),
    (image_url) = ('#{@image_url}'),
    (adoption_case) = ('#{@adoption_case}'),
    (owner_id) = (#{@owner_id})
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

  def Animal.find_type(type)
    sql = "SELECT * FROM animals 
    WHERE type = '#{type}';"
    return Animal.get_many(sql)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = #{@owner_id};"
    owner = SqlRunner.run(sql)
    result = Owner.new(owner.first)
    return result
  end

  def Animal.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def Animal.all()
    sql = "SELECT * FROM animals;"
    return Animal.get_many(sql)
  end

  def Animal.get_many(sql)
    animals = SqlRunner.run(sql)
    return animals.map { |animal| Animal.new(animal)
    }
  end

end