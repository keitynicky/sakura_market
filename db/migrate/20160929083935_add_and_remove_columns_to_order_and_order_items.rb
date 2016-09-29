class AddAndRemoveColumnsToOrderAndOrderItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :unit_price
    remove_column :orders, :total_price

    add_column :order_items, :unit_price, :integer
    add_column :order_items, :total_price, :integer
  end
end
