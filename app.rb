require 'sinatra/base'
require './lib/users'
require './lib/space'
require './database_connection_setup'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do 
    erb :index
  end

  get '/login/new' do
    erb :'login/new'
  end

  post '/login' do
    user = User.authenticate(user_name: params[:user_name], password: params[:password])
    session[:user_id] = user.user_id
    session[:user_name] = params[:user_name]
    session[:password] = params[:password]
    @user_name = session[:user_name]
    redirect to '/portal'
  end

  post '/portal' do
    Space.create(space_name: params[:space_name], city: params[:city], description: params[:description], ppn: params[:ppn])
    redirect '/portal'
  end

  get '/portal' do
    @user_name = session[:user_name]
    @password = session[:password]
    erb :portal
  end

  get '/list' do
    @space = Space.all
    erb :list
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(user_name: params[:user_name], password: params[:password])
    session[:user_id] = user.user_id
    session[:user_name] = user.user_name
    redirect to '/congrats'
  end

  get '/congrats' do
    @user_name = session[:user_name]
    @user = User.find(user_id: session[:user_id])
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

  post '/logout' do
    session.clear
    redirect '/'
  end

  get '/book' do
    erb :book
  end

  post '/book' do
    session[:date] = params[:date]
    session[:booking_space] = params[:booking_space]
    redirect '/portal'
  end

  get '/bookings' do
    erb :bookings
  end

  run! if app_file == $0
end
