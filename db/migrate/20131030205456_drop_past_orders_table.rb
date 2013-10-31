class DropPastOrdersTable < ActiveRecord::Migration
  def change
    drop_table :past_orders
  end
end
