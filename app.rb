require 'sinatra/base'
# require './lib/bookmarks'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do 
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    session[:username] = params[:username]
    session[:password]= params[:password]
    redirect to '/portal'
  end

  post '/portal' do
    @username = session[:username]
    @password = session[:password]
    erb :portal
  end

  get '/portal' do
    erb :portal
  end

  get '/list' do
    erb :list
  end

  get '/signup' do
    erb :signup
  end

  post '/signingup' do
    erb :congrats
    
    redirect to '/congrats'
  end

  get '/congrats' do
    @username = session[:user_name]
    erb :congrats
  end

  post '/congrats' do
    session[:user_name] = params[:user_name]
    session[:password] = params[:password]
    erb :congrats
    redirect '/congrats'
  end

  get '/new' do
    erb :new
  end

  run! if app_file == $0
end
