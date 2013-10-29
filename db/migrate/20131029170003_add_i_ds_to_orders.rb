class AddIDsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :restaurant_id, :integer
    add_column :orders, :user_id, :integer
  end
end
