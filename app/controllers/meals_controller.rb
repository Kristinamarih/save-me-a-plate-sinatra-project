class MealsController < ApplicationController

  get '/meals' do
    if logged_in?
      @meals = Meal.all
      erb :'meals/meals'
    else
      redirect '/login'
    end
  end

  get '/meals/new' do
    if logged_in? && is_restaurant?
      erb :'/meals/create_meal'
    else
      redirect '/meals'
    end
  end

  get '/meals/:id' do
    if logged_in?
      @meal = Meal.find_by_id(params[:id])
      erb :'/meals/show_meal'
    else
      redirect '/login'
    end
  end

  post '/meals' do
    if logged_in? && is_restaurant?
      if params[:name] == ""
        redirect '/meals/new'
      else
        @meal = current_user.meals.build(name: params[:name], description: params[:description], phone_number: params[:phone_number])
        @meal.save
        redirect "/meals/#{@meal.id}"
      end
    end
  end

  get '/meals/:id/edit' do
    if logged_in? && is_restaurant?
      @meal = Meal.find_by_id(params[:id])
      if @meal.user == current_user
      erb :'/meals/edit'
      else
        flash[:notice] = "Sorry, but that one doesn't belong to you!"
        redirect to '/meals'
      end
    else
      redirect '/login'
    end
  end

  patch '/meals/:id' do
    if logged_in? && is_restaurant?
      if params[:description] == "" || params[:name] == "" || params[:phone_number] == ""
        redirect "/meals/#{params[:id]}/edit"
      else
        @meal = Meal.find_by_id(params[:id])
        @meal.update(name: params[:name], description: params[:description], phone_number: params[:phone_number])
        @meal.save
        flash[:notice] = "Your meal was successfully updated!"
        redirect "/meals/#{@meal.id}"
      end
    else
      redirect '/login'
    end
  end

  delete '/meals/:id/delete' do
    if logged_in? && is_restaurant?
      @meal = Meal.find_by_id(params[:id])
      if @meal && @meal.user == current_user
        @meal.delete
        flash[:notice] = "Your meal was successfully deleted!"
      else
        flash[:notice] = "Sorry, but that one doesn't belong to you!"
      end
      redirect to '/meals'
    else
      redirect to '/login'
    end
  end
end
