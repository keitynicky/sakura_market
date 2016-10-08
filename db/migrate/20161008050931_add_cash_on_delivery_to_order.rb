class AddCashOnDeliveryToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cash_on_delivery, :integer
  end
end
