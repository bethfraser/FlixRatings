require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/film'
require_relative '../models/ranking'
require_relative '../models/user'


get '/users/edit' do
  @users = User.all()
  erb :'/users/edit'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users/update' do
  user = User.find_by_name(params[:username])
  if user
    if User.login?(user.id, params[:password])
    User.set_current_user(user.id)
    redirect to('/')
    else 
      erb :'/users/wrong_password'
    end
  else
    erb :'/users/wrong_password'
  end 
end

post '/users/create' do
  @new_user = User.new(params).save
  User.set_current_user(@new_user.id)
  @user = @new_user
  erb :'/users/create'
end
