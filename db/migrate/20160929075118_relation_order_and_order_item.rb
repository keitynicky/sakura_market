class RelationOrderAndOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :order_id, :integer
    remove_column :order_items, :user_id

    add_column :orders, :user_id, :integer
  end
end
