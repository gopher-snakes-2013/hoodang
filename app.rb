require 'omniauth'
require 'omniauth-facebook'
require 'sinatra'
require 'sinatra/activerecord'
require 'debugger'
require 'json'
require './models/user'

begin 
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/hoodang_development')

configure do
  enable :sessions

  use OmniAuth::Builder do
    provider :facebook, ENV['APP_ID'], ENV['APP_SECRET']
  end
end

helpers do
  def get_all_users
    @users = User.all
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id])
    rescue
      redirect '/'
    end
  end
end

get '/' do
  erb :index
end

put '/user/:id/:status' do

  p params
  @user_to_be_updated = User.find(params[:id])
  
  case params[:status]
    when "available"
      @user_to_be_updated.status = "unavailable"
    when "unavailable"
      @user_to_be_updated.status = "available"
  end
  @user_to_be_updated.save
  {id: @user_to_be_updated.id, status: @user_to_be_updated.status}.to_json

get '/logout' do
  session.clear
  redirect '/'
end

get '/auth/facebook/callback' do
  user = env['omniauth.auth']
  current_user = User.find_by_email(user.info.email);
  if current_user == nil
    current_user = User.create(name: user.info.name, email: user.info.email, image_url: user.info.image, status: 'unavailable')
  end
  current_user.id
  session[:user_id] = current_user.id
  redirect '/welcome'
end

get '/welcome' do
  current_user
  get_all_users
  erb :hoodang_home
end
