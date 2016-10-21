class AddRefOrderItemsToProduct < ActiveRecord::Migration[5.0]
  def change
    if !index_exists? :order_items, :product_id
      add_index :order_items, :product_id
    end

    if column_exists? :products, :order_item_id
      remove_column :products, :order_item_id 
      remove_index :products, :order_item_id
    end
  end
end
