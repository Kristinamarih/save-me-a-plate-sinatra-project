require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def is_restaurant?
      logged_in? ? current_user.restaurant : false
    end

    def current_user
      @current_user ||= User.find(id: session[:user_id]) if session[:user_id]
    end
  end

end
