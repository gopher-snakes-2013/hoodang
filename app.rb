%w(omniauth omniauth-facebook sinatra dotenv debugger).each { |dependency| require dependency} 

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
  debugger
end

# env['omniauth.auth']['info'][:email]
# env['omniauth.auth']['info']['first_name']
# env['omniauth.auth']['info']['name']
# env['omniauth.auth']['info']['image']