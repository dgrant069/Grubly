class ChangeDishNameToId < ActiveRecord::Migration
  def change
    add_column :orders, :item_id, :integer

    remove_column :orders, :dish_name, :string
  end
end
