class MealsController < ApplicationController

  get '/meals' do
    @meals = Meal.all
    erb :'/meals/index'
  end

  get '/meals/new' do
    erb :'/meals/new'
  end

  get '/meals/:id' do
    @meal = Meal.find(params[:id])
    erb :'/meals/show'
  end

  post '/meals' do
    @meal = Meal.create(params)
    @meal.save
    redirect "/meals/#{@meal.id}"
  end

  get '/meals/:id/edit' do
    @meal = Meal.find(params[:id])
    erb :'/meals/edit'
  end

  patch '/meals/:id' do
    @meal = Meal.find(params[:id])
    @meal.update(params[:meal])
    @meal.save
    redirect "/meals/#{@meal.id}"
  end
end
