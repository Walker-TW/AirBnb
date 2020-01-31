require 'sinatra/base'
require './lib/users'
require './lib/space'
require './lib/booking'
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
      if user
        session[:user_id] = user.user_id
        @user_id = session[:user_id]
        session[:user_name] = params[:user_name]
        session[:password] = params[:password]
        @user_name = session[:user_name]
        redirect '/portal'
      else
        redirect '/login/error'
      end
  end

  get '/login/error' do
    erb :'login/error'
  end

  post '/portal' do
    #ADD USER 
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

  get '/book' do
    # p "space name in book:"
    # p space.space_name
    session[:space_name] = params[:space_name]
    @space_name = session[:space_name]
    # session[:date] = params[:date]
    # p "date in book"
    # p session[:date] 
    # p "params"
    # p params[:date]
    erb :book
  end

  post '/book' do
    # user find
    session[:date] = params[:date]
    @date = session[:date]
    @space_name = session[:space_name]
    space = Space.find(space_name: @space_name)
    user = User.find(user_id: session[:user_id])
    Booking.create(space_id: space.space_id, date: session[:date], user_id: user.user_id)
    session[:booking_space] = params[:booking_space]
    redirect '/booked'
  end

  get '/booked' do
    @date = session[:date]
    @space_name = session[:space_name]
    erb :booked
  end

  get '/bookings' do
    user = User.find(user_id: session[:user_id])
    @bookings = Booking.all(user_id: user.user_id)
    p "bookings in bookings"
    p @bookings
    erb :bookings
  end

  post '/logout' do
    session.clear
    redirect '/loggedout'
  end

  get '/loggedout' do
    erb :'login/loggedout'
  end

  get '/book' do
    erb :book
  end

  post '/book' do
    session[:date] = params[:date]
    session[:booking_space] = params[:booking_space]
    redirect '/booked'
  end

  get '/booked' do
    erb :booked
  end

  get '/bookings' do
    erb :bookings
  end

  run! if app_file == $0
end
