class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name, limit: 32

      t.timestamps
    end
  end
end
