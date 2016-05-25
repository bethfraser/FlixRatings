require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/film'
require_relative '../models/ranking'


# get '/films' do
#   @films = Film.all
#   erb :'films/index'
# end

get '/rankings/new' do
  @films = Film.all()
  erb :'/rankings/new'
end

# post '/films/find' do
#   @params = params
#   @films = Film.search_films(params)
#   erb :'/films/new'
# end

post '/rankings' do
  @ranking1 = Ranking.new({ "film_id" => params[:first].to_i, "ranking" => 1, "name" => params[:name], "comments" => params[:first_comments]})
  @ranking1.save()
  @ranking2 = Ranking.new({ "film_id" => params[:second].to_i, "ranking" => 2, "name" => params[:name], "comments" => params[:second_comments]})
  @ranking2.save()
  @ranking3 = Ranking.new({ "film_id" => params[:third].to_i, "ranking" => 3, "name" => params[:name], "comments" => params[:third_comments]})
  @ranking3.save()
  erb :'/rankings/create'
end

# get '/films/:id' do
#   @film = Film.find(params[:id])
#   erb :'films/show'
# end

# delete '/films/:id/delete' do
#   Film.destroy(params[:id])
#   redirect to('/films')
# end