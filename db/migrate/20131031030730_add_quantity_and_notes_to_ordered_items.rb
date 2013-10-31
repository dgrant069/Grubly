class AddQuantityAndNotesToOrderedItems < ActiveRecord::Migration
  def change
    add_column :ordered_items, :quantity, :integer
    add_column :ordered_items, :note, :string
  end
end
