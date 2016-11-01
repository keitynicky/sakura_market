class ChangeProductPhotoLimit < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :photo, :binary, limit: 10.megabyte
  end
end
