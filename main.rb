require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative './controllers/rankings_controller.rb'
require_relative './controllers/films_controller.rb'
require_relative './controllers/decades_controller.rb'
require_relative './controllers/users_controller.rb'
require_relative './models/user.rb'

before do
  @user = User.current_user()
end