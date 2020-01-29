require 'sinatra/base'
require './lib/space'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do 
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    session[:user_name] = params[:user_name]
    session[:password] = params[:password]
    redirect to '/portal'
  end

  post '/portal' do
    @user_name = session[:user_name]
    @password = session[:password]
    erb :portal
    Space.create(space_name: params[:space_name], city: params[:city], description: params[:description], ppn: params[:ppn])
    redirect '/portal'
  end

  get '/portal' do
    erb :portal
  end

  get '/list' do
    @space = Space.all
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
    @user_name = session[:user_name]
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
