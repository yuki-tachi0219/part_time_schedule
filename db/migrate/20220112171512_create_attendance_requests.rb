class CreateAttendanceRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :attendance_requests do |t|
      t.integer :state
      t.references :employee, null: false, foreign_key: true
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
