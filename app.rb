require 'omniauth'
require 'omniauth-facebook'
require 'sinatra'
require 'dotenv'
require 'debugger'

Dotenv.load

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
  "Hello World"
end
