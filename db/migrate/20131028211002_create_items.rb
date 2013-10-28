class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :dish_name
      t.decimal :price, :precision => 10, :scale => 2
      t.string :description
      t.string :subcategory
      t.integer :inventory

      t.timestamps
    end
  end
end
