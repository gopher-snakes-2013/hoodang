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

