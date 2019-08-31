class RestaurantMeal < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :meal
end
