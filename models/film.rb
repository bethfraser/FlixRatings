require_relative '../db/sqlrunner'
require_relative '../models/ranking'
require 'open-uri'
require 'json'

class Film

  attr_accessor :id, :title, :year, :imdb_rating, :poster_image, :summary

  def initialize(options)
    @id = options['id']
    @title = options['title'].gsub("'", "&rsquo;")
    @year = options['year'].to_i
    @imdb_rating = options['imdb_rating'].to_f
    @summary = options['summary'].gsub("'", "&rsquo;")
    @poster_image = options['poster_image']
  end

  def rankings()
    sql = "SELECT * FROM rankings WHERE first_film_id = #{@id}"
    firsts = Ranking.map_items(sql) 
    sql2 = "SELECT * FROM rankings WHERE second_film_id = #{@id}"
    seconds = Ranking.map_items(sql2) 
    sql3 = "SELECT * FROM rankings WHERE third_film_id = #{@id}"
    thirds = Ranking.map_items(sql3) 
    result = { firsts: firsts.length, seconds: seconds.length, thirds: thirds.length}
    return result
  end

  def user_rating()
    rating = 0
    rankings = self.rankings()
    total_rankings = rankings[:firsts] + rankings[:seconds] + rankings[:thirds]
    if total_rankings > 0 
      rating = (rankings[:firsts] * 100) + (rankings[:seconds] * 90) + (rankings[:thirds] * 80)
      return rating / total_rankings
    else
      return 0
    end
  end

  def combined_rating()
    combined_total = (@imdb_rating * 10) + self.user_rating()
    if self.user_rating() > 0
      return combined_total / 2
    else
      return combined_total
    end
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

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = #{id};"
    return Film.map_item(sql)
  end

  def self.search_films(params)
    title = params["title"].gsub(" ", "%20")
    if params[:year] != ""
      film_string = "http://www.omdbapi.com/?t=#{title}&y=#{params[:year]}&r=json"
    else
      film_string = "http://www.omdbapi.com/?t=#{title}&r=json"
    end
    film1 = open(film_string)
    response_status = film1.status
    response_body = JSON.parse(film1.read)
    return response_body
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run_sql(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM films WHERE id = #{id}"
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