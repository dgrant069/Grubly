class ChangePriceToDollarsAndCents < ActiveRecord::Migration
  def change
    add_column :items, :dollars, :integer
    add_column :items, :cents, :integer

    remove_column :items, :price
  end
end
