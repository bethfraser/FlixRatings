require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/film'
require_relative '../models/ranking'
require_relative '../models/user'


post '/rankings/decade' do
  @films = Decade.new(params['decade']).films
  @current_user = User.current_user()
  @decade_start = params['decade']
  @decade_title = params['decade'] + "s"
  erb :'/rankings/new'
end

get '/rankings/choosedecade' do
  erb :'/rankings/choosedecade'
end

post '/rankings' do
  @ranking = Ranking.new({ "first_film_id" => params[:first].to_i, "second_film_id" => params[:second], "third_film_id" => params[:third], "decade" => params[:decade_start], "user_id" => params[:user_id], "comments" => params[:comments]})
  @ranking.save()
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