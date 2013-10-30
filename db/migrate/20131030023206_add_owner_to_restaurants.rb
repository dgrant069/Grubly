class AddOwnerToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :owner, :integer
  end
end
