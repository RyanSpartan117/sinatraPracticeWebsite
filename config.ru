require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/teas-controller.rb'

run TeasController