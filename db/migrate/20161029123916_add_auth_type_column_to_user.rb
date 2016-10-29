class AddAuthTypeColumnToUser < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :auth_type, :integer, nil: false, default: 1
  end

  def self.down
    remove_column :users, :auth_type
  end
end
