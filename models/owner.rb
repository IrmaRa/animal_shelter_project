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

  















end