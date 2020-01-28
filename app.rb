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

  get '/signup' do
    erb :signup
  end

  post '/signingup' do
    # session[:username] = params[:username]
    # session[:password] = params[:password]
    # @username = session[:username]
    # @password = session[:password]
    erb :congrats
    # redirect to '/congrats'
  end

  post '/congrats' do
    @username = params[:username]
    @password = params[:password]
    erb :congrats
  end

  run! if app_file == $0
end