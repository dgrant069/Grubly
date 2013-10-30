class CreateOrderedItems < ActiveRecord::Migration
  def change
    create_table :ordered_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.timestamps
    end

    add_column :restaurants, :user_id, :integer
    add_column :users, :restaurant_id, :integer

    remove_column :orders, :item_id
  end
end
