class CreateAttendanceRequestNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :attendance_request_notifications do |t|
      t.references :attendance_request, null: false, foreign_key: true
      t.references :notification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
