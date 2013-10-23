require 'omniauth-facebook'
require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'
require 'debugger'
require 'json'

Dotenv.load

LOCAL_DATABASE_LOCATION = 'postgres://localhost/hoodang_development'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || LOCAL_DATABASE_LOCATION)

configure do 
  enable :sessions

  use OmniAuth::Builder do 
    provider :facebook, ENV['APP_ID'], ENV['APP_SECRET']
  end
end

get '/' do
  erb :index
end

get '/auth/facebook/callback' do
  env['omniauth.auth']
  redirect('/welcome')
end

get '/welcome' do
  erb :hoodang_home
end


