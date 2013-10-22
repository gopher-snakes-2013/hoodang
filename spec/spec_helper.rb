require 'rspec'
require 'capybara/rspec'
require 'rubygems'
require './app'

def app
  Sinatra::Application
end