$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'json'

get '/' do
  erb :index
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