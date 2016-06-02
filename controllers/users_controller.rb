require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/film'
require_relative '../models/ranking'
require_relative '../models/user'


get '/users/edit' do
  @users = User.all()
  erb :'/users/edit'
end

post '/users/update' do

  if User.login?(params[:id], params[:password])
    User.set_current_user(params[:id])
    redirect to('/')
  else
    erb :'/users/wrong_password'
  end 
end
