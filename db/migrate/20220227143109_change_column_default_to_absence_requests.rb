class ChangeColumnDefaultToAbsenceRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_default :absence_requests, :state, from: nil, to: "0"
  end
end
