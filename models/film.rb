require_relative '../db/sqlrunner'
require_relative '../models/ranking'

class Film

  attr_accessor :id, :title, :year, :imdb_rating, :poster_image, :summary

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year'].to_i
    @imdb_rating = options['imdb_rating'].to_i
    @summary = options['summary']
    @poster_image = options['poster_image']
  end

  def rankings()
    sql = "SELECT * FROM rankings WHERE film_id = #{@id}"
    result = Ranking.map_items(sql)
    return result
  end

  def user_rating()
    rating = 0
    rankings = self.rankings()
    for ranking in rankings
      rating += ranking.points
    end
    return rating / rankings.length
  end

  def combined_rating()
    combined_total = (@imdb_rating * 10) + self.user_rating() 
    return combined_total / 2
  end

  def save()
    sql = "INSERT INTO films (title, year, imdb_rating, summary, poster_image) VALUES ('#{@title}', #{@year}, #{@imdb_rating}, '#{@summary}', '#{@poster_image}' ) RETURNING *"
    film = SqlRunner.run_sql(sql).first
    result = Film.new( film )
    return result
  end

  def self.all()
    sql = "SELECT * FROM films"
    return Film.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run_sql(sql)
  end


  def self.map_items(sql)
    film = SqlRunner.run_sql(sql)
    result = film.map { |f| Film.new( f ) }
    return result
  end

  def self.map_item(sql)
    result = Film.map_items(sql)
    return result.first
  end

end