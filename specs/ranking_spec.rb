require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/ranking'
require_relative '../models/user'

class TestRanking < Minitest::Test

  def setup 

    user1 = User.new({'name' => "Beth", 'password' => 'password'})
    user2 = User.new({'name' => "Kat", 'password' => 'password'})

    film1 = Film.new({'id' => 1, 'title' => "Jaws", "year" => 1975, 'imdb_rating' => 7, "summary" => "Great!"})
    film2 = Film.new({'id' => 2, 'title' => "Taxi Driver", "year" => 1976, 'imdb_rating' => 8, "summary" => "Great!"})
    film3 = Film.new({'id' => 3, 'title' => "Star Wars", "year" => 1977, 'imdb_rating' => 9, "summary" => "Great!"})

    @ranking1 = Ranking.new({"first_film_id" => film1.id, 'second_film_id' => film2.id, 'third_film_id' => film3.id, 'decade' => 1970, 'user_id' => user1.id})
    @ranking2 = Ranking.new({"first_film_id" => film3.id, 'second_film_id' => film1.id, 'third_film_id' => film2.id, 'decade' => 1970, 'user_id' => user2.id})
  end
 
  def test_has_film_id
    assert_equal(@ranking1.first_film_id, 1)
  end

  def test_decade
    assert_equal(@ranking1.decade, 1970)
  end

end