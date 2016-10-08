class AddMaxFeeToCashOnDelivery < ActiveRecord::Migration[5.0]
  def change
    add_column :cash_on_deliveries, :maxFee, :integer
  end
end