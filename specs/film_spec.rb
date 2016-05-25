require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/film'

class TestFilm < Minitest::Test

  def setup 
    @film1 = Film.new({"title" => "Jaws", "year" => 1975})
  end

  def test_has_title
    assert_equal(@film1.title, "Jaws")
  end

  def test_has_year
    assert_equal(@film1.year, 1975)
  end

  # def test_starts_with_no_user_rankings
  #   assert_equal(@film1.user_rankings.length, 0)
  # end

end