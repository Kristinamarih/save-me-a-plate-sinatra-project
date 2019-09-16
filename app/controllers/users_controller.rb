class UsersController < ApplicationController

  get '/user/:id' do
    @user = User.find_by(params[:id])
    erb :'/user/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/user/new'
    else
      redirect '/meal/show'
    end
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect '/user/new'
    else
      @user = User.new(:email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/user/show'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/user/login'
    else
      redirect '/meal/show'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/meal/show'
    else
      redirect '/user/new'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/user/new'
    else
      redirect '/'
    end
  end
end
