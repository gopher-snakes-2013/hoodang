$LOAD_PATH.unshift(File.expand_path('.'))


require 'rspec'
require 'capybara/rspec'
require 'rubygems'
require 'app'

Capybara.app = Sinatra::Application
