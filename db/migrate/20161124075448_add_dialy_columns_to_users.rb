class AddDialyColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :binary
    add_column :users, :nick_name, :string
  end
end
