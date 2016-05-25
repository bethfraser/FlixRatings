require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/film'
require_relative '../models/ranking'
require_relative '../models/decade'


get '/decades' do
  @films1960s = Decade.new(1960).top_films
  @films1970s = Decade.new(1970).top_films
  @films1980s = Decade.new(1980).top_films
  @films1990s = Decade.new(1990).top_films
  @films2000s = Decade.new(2000).top_films
  @films2010s = Decade.new(2010).top_films
  erb :'decades/index'
end