class Restaurant < ActiveRecord::Base
  has_secure_password
  has_many :meals
  has_many :restaurant_meals
  has_many :users, through: :restaurant_meals
end
