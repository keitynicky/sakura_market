class RenameMinAndMaxFeeCashOnDelivery < ActiveRecord::Migration[5.0]
  def change
    rename_column :cash_on_deliveries, :minFee, :min_fee
    rename_column :cash_on_deliveries, :maxFee, :max_fee
  end
end
