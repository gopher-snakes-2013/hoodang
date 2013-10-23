require 'omniauth'
require 'omniauth-facebook'
require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'
require 'debugger'
require 'json'
require './models/user'

Dotenv.load

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/hoodang_development')

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
  user = env['omniauth.auth']
  User.create(name: user.info.name, email: user.info.email, image_url: user.info.image, status: 'false')
  redirect '/welcome'
end

get '/welcome' do
  #once there's a Model we'll need an instance variable here.
  erb :hoodang_home
end

get '/flag/:id' do
  #when i have a model return the status of the params[:id]'s flag via 'get' or AJAX
  # @user = User.find(params[:id])
  if request.xhr?
    p "AJAX"
    num = true
    rand(2) <= 0 ? num = false : num = true
    p num
    data = { id: params[:id], status: num }.to_json
    # data = { id: @user.id, status: @user.status }.to_json
  end
end

