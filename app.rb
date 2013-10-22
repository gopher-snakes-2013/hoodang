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

get 'flag/:user' do
  #when i have a model return the status of the params[:user]'s flag via get or AJAX
  @status = true
  if request.xhr?
    data = { status: true }.to_json
  end
end