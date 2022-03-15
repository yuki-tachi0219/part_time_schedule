class ChangeColumnDefaultToAttendanceRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_default :attendance_requests, :state, from: nil, to: "0"
  end
end
