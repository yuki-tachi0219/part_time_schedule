class ChangeColumnAddNotnullToSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column_null :schedules, :starting_time, false
    change_column_null :schedules, :closing_time, false
  end
end
