class RemoveUnnecessaryAttributesFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :quantity
    remove_column :orders, :item_id
  end
end
