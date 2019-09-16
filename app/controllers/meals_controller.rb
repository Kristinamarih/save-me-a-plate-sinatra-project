class MealsController < ApplicationController

  get '/meals' do
    if logged_in?
      @meals = Meal.all
      erb :'/meals/index'
    else
      redirect '/users/login'
    end
  end

  get '/meals/new' do
    if logged_in? && admin?
      erb :'/meals/new'
    else
      redirect '/meals/show'
    end
  end

  get '/meals/:id' do
    if logged_in?
      @meal = Meal.find(params[:id])
      erb :'/meals/show'
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
      redirect '/meals/show'
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
end
