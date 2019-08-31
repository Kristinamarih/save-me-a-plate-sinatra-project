class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :dish
      t.integer :restaurant_id
      t.timestamps null: false
    end
  end
end
