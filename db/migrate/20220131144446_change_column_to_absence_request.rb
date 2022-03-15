class ChangeColumnToAbsenceRequest < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :absence_requests, :administrators
    remove_index :absence_requests, :administrator_id
    remove_reference :absence_requests, :administrator
    remove_foreign_key :absence_requests, :employees
    remove_index :absence_requests, :employee_id
    remove_reference :absence_requests, :employee
    add_reference :absence_requests, :schedule, null: false, foreign_key: true
  end
end
