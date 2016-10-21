class AddForeignkeyToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :order_items, :products
    add_foreign_key :order_items, :orders
  end
end
