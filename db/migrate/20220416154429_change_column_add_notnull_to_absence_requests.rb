class ChangeColumnAddNotnullToAbsenceRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_null :absence_requests, :state, false
    change_column_null :absence_requests, :reason, false
  end
end
