require 'sinatra/base'
# require './lib/bookmarks'

class MakersBnB < Sinatra::Base

  enable :sessions

  get '/' do 
    "Helo World"
  end

  run! if app_file == $0
end