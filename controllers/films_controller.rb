require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/film'
require_relative '../models/ranking'


get '/films' do
  @films = Film.all
  erb :'films/index'
end

get '/films/find' do
  erb :'films/find'
end

post '/films/find' do
  @params = params
  @films = Film.search_films(params)
  erb :'/films/new'
end

post '/films' do
  @film = Film.new(params)
  @film.save()
  erb :'/films/create'
end

get '/films/:id' do
  @film = Film.find(params[:id])
  erb :'films/show'
end

delete '/films/:id/delete' do
  Film.destroy(params[:id])
  redirect to('/films')
end