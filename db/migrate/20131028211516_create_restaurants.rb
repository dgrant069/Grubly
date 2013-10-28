class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :category
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
