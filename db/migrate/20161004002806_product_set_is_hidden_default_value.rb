class ProductSetIsHiddenDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :is_hidden, :boolean, :default => false
  end
end
