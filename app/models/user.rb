class User < ActiveRecord::Base
  has_secure_password
  has_many :restaurant_meals
  has_many :meals, through: :restaurant_meals
end
