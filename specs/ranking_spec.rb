require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/ranking'

class TestRanking < Minitest::Test

  def setup 
    @ranking1 = Ranking.new({"film_id" => 1, "ranking" => 1, "name" => "George"})
    @ranking2 = Ranking.new({"film_id" => 2, "ranking" => 2, "name" => "George"})
    @ranking3 = Ranking.new({"film_id" => 3, "ranking" => 3, "name" => "George"})
  end

  def test_has_name
    assert_equal(@ranking1.name, "George")
  end

  def test_has_ranking
    assert_equal(@ranking1.ranking, 1)
  end

  def test_points
    assert_equal(@ranking1.points, 100)
    assert_equal(@ranking2.points, 90)
    assert_equal(@ranking3.points, 80)
  end

end