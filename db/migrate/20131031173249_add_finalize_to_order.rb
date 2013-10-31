class AddFinalizeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :finalize, :boolean, :default => false
  end
end
