class CreateAbsenceRequestNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :absence_request_notifications do |t|
      t.references :absence_request, null: false, foreign_key: true
      t.references :notification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
