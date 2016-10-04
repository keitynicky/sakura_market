class ShoppingCartDropTable < ActiveRecord::Migration[5.0]
  def change
    if table_exists? 'shopping_carts'
      drop_table :shopping_carts
    end
  end
end
