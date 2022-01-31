class ChangeColumnToAttendanceRequest < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :attendance_requests, :administrators
    remove_index :attendance_requests, :administrator_id
    remove_reference :attendance_requests, :administrator
    remove_foreign_key :attendance_requests, :employees
    remove_index :attendance_requests, :employee_id
    remove_reference :attendance_requests, :employee
    add_reference :attendance_requests, :schedule, null: false, foreign_key: true
  end
end
