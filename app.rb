$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'

get '/' do
  erb :index
end