class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :password, limit: 64
      t.string :last_name, limit: 16
      t.string :first_name, limit: 16
      t.string :zipcode, limit: 16
      t.string :address, limit: 128
      t.string :email, limit: 128
      t.string :phone_number, limit: 16
      t.references :store, null: false, foreign_key: true
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
