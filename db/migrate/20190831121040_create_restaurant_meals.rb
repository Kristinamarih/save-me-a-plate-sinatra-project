class CreateRestaurantMeals < ActiveRecord::Migration
  def change
    create_table :restaurant_meals do |t|
      t.integer :restaurant_id
      t.integer :meal_id
    end
  end
end
