class ChangeAdminToRestaurant < ActiveRecord::Migration
  def change
    rename_column :users, :admin, :restaurant
  end
end
