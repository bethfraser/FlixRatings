require_relative '../models/film'
require_relative '../models/ranking'
require_relative '../models/user'
require 'pry-byebug'

Film.delete_all()
Ranking.delete_all()
User.delete_all()

user1 = User.new({'name' => "Beth", 'password' => 'password'}).save
user2 = User.new({'name' => "Kat", 'password' => 'password'}).save

film1 = Film.new({'title' => "Jaws", "year" => 1975, 'imdb_rating' => 7, "summary" => "Great!"}).save
film2 = Film.new({'title' => "Taxi Driver", "year" => 1976, 'imdb_rating' => 8, "summary" => "Great!"}).save
film3 = Film.new({'title' => "Star Wars", "year" => 1977, 'imdb_rating' => 9, "summary" => "Great!"}).save

ranking1 = Ranking.new({"first_film_id" => film1.id, 'second_film_id' => film2.id, 'third_film_id' => film3.id, 'decade' => 1970, 'user_id' => user1.id}).save
ranking2 = Ranking.new({"first_film_id" => film3.id, 'second_film_id' => film1.id, 'third_film_id' => film2.id, 'decade' => 1970, 'user_id' => user2.id}).save


binding.pry
nil
