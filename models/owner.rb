require_relative('../db/sql_runner')
require_relative('./animal')

class Owner

  attr_reader :id
  attr_accessor :name, :preferences

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
    @preferences = params['preferences']
  end

  def save()
    sql = "
    INSERT INTO owners (name, preferences)
    VALUES ('#{@name}', '#{@preferences}')
    RETURNING id;"

    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def Owner.find(id)
    sql = "SELECT * FROM owners
    WHERE id = #{id};"
    results = SqlRunner.run(sql)
    owner = Owner.new(results.first)
    return owner
  end

  def Owner.delete_all()
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end

  def Owner.all()
    sql = "SELECT * FROM owners;"
    owner_hashes = SqlRunner.run(sql)
    owner_objects = owner_hashes.map do
      |owner_hash| Owner.new(owner_hash)
    end
    return owner_objects
  end




















end