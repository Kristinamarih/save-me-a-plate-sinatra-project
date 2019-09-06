class UsersController < ApplicationController

  get '/user/:id' do
    @user = User.find(params[:id])
    erb :'/user/show'
  end

  get '/signup' do
      
  end

  post '/signup' do

  end

  get '/login' do

  end

  post '/login' do

  end

  get '/logout' do

  end
end
