require_relative '../db/sqlrunner.rb'
require_relative '../models/film'

class Ranking

  attr_accessor :ranking, :comments, :name

  def initialize(options)
    @id = options['id']
    @film_id = options['film_id']
    @ranking = options['ranking'].to_i
    @comments = options['comments']
    @name = options['name']
  end

  def points()
    points = 0
    case @ranking
      when 1
        points = 100
      when 2
        points = 90
      when 3
        points = 80
      end
    return points
  end

  def film()
    sql = "SELECT * FROM films WHERE id = #{@film_id}"
    result = Film.map_item(sql)
    return result
  end

  def save()
    sql = "INSERT INTO rankings (film_id, ranking, comments, name) VALUES (#{@film_id}, #{@ranking}, '#{@comments}', '#{@name}' ) RETURNING *"
    ranking = SqlRunner.run_sql(sql).first
    result = Ranking.new( ranking )
    return result
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