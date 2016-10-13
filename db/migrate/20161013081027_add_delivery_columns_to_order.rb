class AddDeliveryColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_date, :date
    add_column :orders, :delivery_time, :string
  end
end
