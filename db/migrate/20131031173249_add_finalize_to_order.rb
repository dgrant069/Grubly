class AddFinalizeToOrder < ActiveRecord::Migration
  def change
    add_column :order, :finalize, :boolean, :default => false
  end
end
