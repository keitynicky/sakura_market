class AddColumnToShoppingCart < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_carts, :quantity, :integer
    add_column :shopping_carts, :is_purchased, :boolean
  end
end
