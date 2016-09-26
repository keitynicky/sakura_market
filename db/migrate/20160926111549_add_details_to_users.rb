class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :post_code, :integer
    add_column :users, :address, :string
  end
end
