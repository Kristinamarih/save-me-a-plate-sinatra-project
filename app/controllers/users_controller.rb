class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(params[:id])
    erb :'users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/meals'
    end
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      if params[:restaurant] == "true"
      @user = User.new(:email => params[:email], :password => params[:password], :restaurant => params[:restaurant])
      @user.restaurant = true
    else
      @user = User.new(:email => params[:email], :password => params[:password])
    end
      @user.save
      session[:user_id] = @user.id
      redirect to '/meals'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/meals'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/meals'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
