require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "repertoire_secret"
  end

  get "/" do
    "Hello, World!"
    # erb :welcome
  end

end
