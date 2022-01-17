class AddColumnsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :last_name, :string, limit: 16
    add_column :employees, :first_name, :string, limit: 16
    add_column :employees, :zipcode, :string, limit: 16
    add_column :employees, :address, :string, limit: 128
    add_column :employees, :phone_number, :string, limit: 16
    add_column :employees, :delete_flag, :boolean
  end
end
