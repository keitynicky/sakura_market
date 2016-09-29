class ChangeIsPhurchasedOrderAndOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :is_phurchased, :boolean, default: false
    remove_column :order_items, :is_phurchased
  end
end
