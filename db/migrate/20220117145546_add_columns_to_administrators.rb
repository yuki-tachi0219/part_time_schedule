class AddColumnsToAdministrators < ActiveRecord::Migration[6.1]
  def change
    add_column :administrators, :last_name, :string, limit: 16
    add_column :administrators, :first_name, :string, limit: 16
    add_column :administrators, :zipcode, :string, limit: 16
    add_column :administrators, :address, :string, limit: 128
    add_column :administrators, :phone_number, :string, limit: 16
    add_column :administrators, :delete_flg, :boolean
  end
end
