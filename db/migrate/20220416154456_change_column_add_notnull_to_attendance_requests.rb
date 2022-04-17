class ChangeColumnAddNotnullToAttendanceRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_null :attendance_requests, :state, false
  end
end
