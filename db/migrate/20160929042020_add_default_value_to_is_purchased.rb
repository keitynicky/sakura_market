class AddDefaultValueToIsPurchased < ActiveRecord::Migration[5.0]
  def up
    change_column :shopping_carts, :is_purchased, :boolean, :default => true
  end

  def down
    change_column :shopping_carts, :is_purchased, :boolean, :default => nil
  end
end
