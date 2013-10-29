class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :dish_name
      t.integer :quantity
      t.string :note

      t.timestamps
    end
  end
end
