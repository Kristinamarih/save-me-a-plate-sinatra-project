class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/login'
    end

    # @user = User.find_by_id(params[:id])
    # @meal = Meal.where(user_id: current_user.id)
    @meals = current_user.meals
    if !@meals.empty?
      erb :'users/show'
    else
      flash[:notice] = "Sorry, you have no meals!"
      redirect '/meals'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      flash[:notice] = "You already have an account!"
      redirect to '/meals'
    end
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == "" || User.find_by(email: params[:email])
      flash[:notice] = "Fields cannot be blank!"
      redirect '/signup'
    else67yy
      if params[:restaurant]
        @user = User.new(:email => params[:email], :password => params[:password], :restaurant => params[:restaurant])
        @user.restaurant == true
      else
        @user = User.new(:email => params[:email], :password => params[:password])
      end
      @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're now signed up!"
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
      flash[:notice] = "Welcome back!"
      redirect to '/meals'
    else
      flash[:notice] = "Oops! We had a problem with your log in! Please try again."
      redirect to '/login'
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
