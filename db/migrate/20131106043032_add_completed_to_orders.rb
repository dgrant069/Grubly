class AddCompletedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :completed, :boolean, :default => false
  end
end
