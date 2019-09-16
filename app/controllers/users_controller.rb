class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(params[:id])
    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/new'
    else
      redirect '/meals/show'
    end
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect '/users/new'
    else
      @user = User.new(:email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/users/show'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/meals/show'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/meals/show'
    else
      redirect '/users/new'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/users/new'
    else
      redirect '/'
    end
  end
end
