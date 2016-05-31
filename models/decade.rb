require_relative './film'

class Decade

  attr_reader :start_year
  
  def initialize(start_year)
    @start_year = start_year.to_i
  end

  def self.all()
    return [Decade.new(1960), Decade.new(1970), Decade.new(1980), Decade.new(1990), Decade.new(2000), Decade.new(2010)]
  end

  def films()
    sql = "SELECT * FROM films WHERE year > #{@start_year - 1} AND year < #{@start_year + 10}"
    return Film.map_items(sql)
  end

  def top_films()
    films = self.films()
    films.sort! { |a, b| a.combined_rating() <=> b.combined_rating() }
    films.reverse!
    return films[0..2]
  end

end