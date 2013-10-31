class CreateItemsOrdereds < ActiveRecord::Migration
  def change
    create_table :items_ordereds do |t|
      t.integer :order_id
      t.integer :item_id
      t.timestamps
    end
  end
end
