require_relative './film'

class Decade

  def initialize(start_year)
    @start_year = start_year
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