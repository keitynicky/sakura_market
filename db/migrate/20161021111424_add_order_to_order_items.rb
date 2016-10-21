class AddOrderToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_index :order_items, :order_id
  end
end
