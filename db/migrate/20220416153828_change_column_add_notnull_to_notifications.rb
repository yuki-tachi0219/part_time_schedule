class ChangeColumnAddNotnullToNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column_null :notifications, :action, false
    change_column_null :notifications, :checked, false
  end
end
