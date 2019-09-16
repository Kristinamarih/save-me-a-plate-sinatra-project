class MealsController < ApplicationController

  get '/meals' do
    if logged_in?
      @meals = Meal.all
      erb :'/meals'
    else
      redirect '/users/login'
    end
  end

  get '/meals/new' do
    if logged_in? && admin?
      erb :'/meals/new'
    else
      redirect '/meals'
    end
  end

  get '/meals/:id' do
    if logged_in?
      @meal = Meal.find(params[:id])
      erb :'/meals/show_meal'
    else
      redirect '/login'
    end
  end

  post '/meals' do
    if logged_in? && admin?
      if params[:name] == ""
        redirect '/meals/new'
      else
        @meal = Meal.create(params)
        @meal.save
        redirect "/meals/#{@meal.id}"
      end
    end
  end

  get '/meals/:id/edit' do
    if logged_in? && admin? && @meal.user == current_user
      @meal = Meal.find(params[:id])
      erb :'/meals/edit'
    else
      redirect '/meals/show_meal'
    end
  end

  patch '/meals/:id' do
    if logged_in? && admin?
      if params[:description] == ""
        redirect "/meals/#{params[:id]}/edit"
      else
        @meal = Meal.find(params[:id])
        @meal.update(params[:meal])
        @meal.save
        redirect "/meals/#{@meal.id}"
      end
    else
      redirect '/users/login'
    end
  end

  delete '/meals/:id/delete' do
    if logged_in? && admin?
      @meal = Meal.find(params[:id])
      if @meal && @meal.user == current_user
        @meal.delete
      end
      redirect to '/meals'
    else
      redirect to '/login'
    end
  end
end
