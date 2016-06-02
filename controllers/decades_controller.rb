require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/film'
require_relative '../models/ranking'
require_relative '../models/decade'
require_relative '../models/user'


get '/' do
  @decades = Decade.all()
  erb :'decades/index'
end

get '/decades/:decade' do
  @decade = Decade.new(params['decade'])
  erb :'/decades/show'
end