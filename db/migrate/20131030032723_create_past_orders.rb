class CreatePastOrders < ActiveRecord::Migration
  def change
    create_table :past_orders do |t|
    t.integer  "quantity"
    t.string   "note"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "item_id"

    t.timestamps
    end
  end
end
