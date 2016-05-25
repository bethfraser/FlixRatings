require_relative '../models/film'
require_relative '../models/ranking'
require 'pry-byebug'

Film.delete_all()
Ranking.delete_all()


film1 = Film.new({'title' => "Jaws", "year" => 1975, 'imdb_rating' => 7}).save
film2 = Film.new({'title' => "Taxi Driver", "year" => 1976, 'imdb_rating' => 8}).save
film3 = Film.new({'title' => "Star Wars", "year" => 1977, 'imdb_rating' => 9}).save

ranking1 = Ranking.new({"film_id" => film1.id, "ranking" => 1, "name" => "George"}).save
ranking2 = Ranking.new({"film_id" => film2.id, "ranking" => 2, "name" => "George"}).save
ranking3 = Ranking.new({"film_id" => film3.id, "ranking" => 3, "name" => "George"}).save
ranking4 = Ranking.new({"film_id" => film1.id, "ranking" => 3, "name" => "Brenda"}).save
ranking5 = Ranking.new({"film_id" => film2.id, "ranking" => 1, "name" => "Brenda"}).save
ranking6 = Ranking.new({"film_id" => film3.id, "ranking" => 2, "name" => "Brenda"}).save

binding.pry
nil
