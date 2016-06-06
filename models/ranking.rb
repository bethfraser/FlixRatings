require_relative '../db/sqlrunner.rb'
require_relative '../models/film'

class Ranking

  attr_accessor :ranking, :comments, :name, :decade

  def initialize(options)
    @id = options['id']
    @first_film_id = options['first_film_id']
    @second_film_id = options['second_film_id']
    @third_film_id = options['third_film_id']
    @comments = options['comments']
    @decade = options['decade']
    @user_id = options['user_id']
  end

  def save()
    sql = "INSERT INTO rankings (first_film_id, second_film_id, third_film_id, decade, comments, user_id) VALUES (#{@first_film_id}, #{@second_film_id}, #{@third_film_id}, #{@decade}, '#{@comments}', #{@user_id} ) RETURNING *"
    ranking = SqlRunner.run_sql(sql).first
    result = Ranking.new( ranking )
    return result
  end

  def films 
    films = []
    sql = "SELECT * FROM films WHERE id = #{@first_film_id}"
    film1 = Film.map_item(sql)
    sql2 = "SELECT * FROM films WHERE id = #{@second_film_id}"
    film2 = Film.map_item(sql2)
    sql3 = "SELECT * FROM films WHERE id = #{@third_film_id}"
    film3 = Film.map_item(sql3)
    return [film1, film2, film3]
  end


  def self.all()
    sql = "SELECT * FROM rankings"
    return Ranking.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM rankings"
    SqlRunner.run_sql(sql)
  end

  def self.map_items(sql)
    ranking = SqlRunner.run_sql(sql)
    result = ranking.map { |r| Ranking.new( r ) }
    return result
  end

  def self.map_item(sql)
    result = Ranking.map_items(sql)
    return result.first
  end


end