class ReCreateFieldsToUserForAutocomplete < ActiveRecord::Migration[5.0]
  def change
    if column_exists? :users, :first_name
      remove_column :users, :first_name 
      remove_column :users, :last_name 
      remove_column :users, :address 
      remove_column :users, :post_code
    end

    unless column_exists? :users, :family_name
      add_column :users, :family_name, :string  
      add_column :users, :given_name, :string 
      add_column :users, :postal_code, :string
      add_column :users, :address_level1, :string 
      add_column :users, :address_level2, :string
      add_column :users, :address_line1, :string 
      add_column :users, :address_line2, :string
    end
     
  end
end
