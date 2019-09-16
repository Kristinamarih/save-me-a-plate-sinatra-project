class UsersController < ApplicationController

  get '/user/:id' do
    @user = User.find(params[:id])
    erb :'/user/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/user/new'
    else
      redirect '/user/show'
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

  end

  post '/login' do

  end

  get '/logout' do

  end
end
