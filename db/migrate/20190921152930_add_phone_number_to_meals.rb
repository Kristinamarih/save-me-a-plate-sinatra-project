class AddPhoneNumberToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :phone_number, :string
  end
end
