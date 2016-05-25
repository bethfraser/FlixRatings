require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative './controllers/rankings_controller.rb'
require_relative './controllers/films_controller.rb'
require_relative './controllers/decades_controller.rb'